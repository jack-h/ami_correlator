import corr
import struct
import numpy as np
import time
import sys
import logging
import pylab

def corr_from_tv(tvg, anta, antb, acc_len, n_ants, window=0):
    da = tvg[acc_len*n_ants*window + anta*acc_len : acc_len*n_ants*window + (anta+1)*acc_len]
    db = tvg[acc_len*n_ants*window + antb*acc_len : acc_len*n_ants*window + (antb+1)*acc_len]
    corr = da * np.conj(db)
    return np.sum(corr)

boffile = 'xeng_test.bof'
if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('test_qdr.py <ROACH_HOSTNAME_or_IP> [options]')
    p.set_description(__doc__)
    p.add_option('-p', '--noprogram', dest='noprogram', action='store_true',
        help='Don\'t reprogram the self.fpga.')
    p.add_option('-b', '--boffile', dest='bof', type='str', default=boffile,
        help='Specify the bof file to load')  
    p.add_option('-m', '--mode', dest='mode', type='str', default='noise',
        help='Type of test vector: noise, constant, counter')  
    p.add_option('-g', '--gaps', dest='gaps', action='store_true', default=False,
        help='Put in gaps in valid windows')  
    p.add_option('--plot', dest='plot', action='store_true', default=False,
        help='Plot mcnts and outputs and whatnot')  
    opts, args = p.parse_args(sys.argv[1:])

    if args==[]:
        print 'Please specify a ROACH board. \nExiting.'
        exit()
    else:
        roach = args[0]
    if opts.bof != '':
        boffile = opts.bof

    lh = corr.log_handlers.DebugLogHandler()
    logger = logging.getLogger(roach)
    logger.addHandler(lh)
    logger.setLevel(10)

    print('Connecting to server %s... '%(roach)),
    fpga = corr.katcp_wrapper.FpgaClient(roach, logger=logger)
    time.sleep(1)

    if not opts.noprogram:
        print '------------------------'
        print 'Programming FPGA...',
        sys.stdout.flush()
        fpga.progdev(boffile)
        time.sleep(0.1)
        print 'ok'

    print 'Board clock:', fpga.est_brd_clk()
    
    NANTS = 10
    NSERIAL = 64
    NPARALLEL = 16
    NTOT = NSERIAL*NPARALLEL
    NWINDOWS = 6 #firmware specific
    if opts.gaps:
        is_valid = [1, 0, 0, 1, 0, 1]
    else:
        is_valid = [1, 1, 1, 1, 1, 1]

    print 'Of 6 windows, valid pattern is:', is_valid

    tvg_vec_len = NANTS*NSERIAL*NPARALLEL*NWINDOWS
    tvg = np.zeros(tvg_vec_len, dtype=complex)
    if opts.mode == 'constant':
        print 'Using constant TVG: All ants have same constant value.'
        tvg[:] = np.ones(tvg_vec_len) + 1j*np.ones(tvg_vec_len)
    elif opts.mode == 'counter':
        print 'Using counter TVG: each antenna has a (different) constant value.'
        for window in range(NWINDOWS):
            for ant in range(NANTS):
                tvg[window*NANTS*NTOT + ant*NTOT : window*NANTS*NTOT + (ant+1)*NTOT] = ant-8 + 1j*(ant-8+2)
    elif opts.mode == 'mcnt':
        print 'Using mcnt TVG: each mcnt window has a constant value.'
        for window in range(NWINDOWS):
            for ant in range(NANTS):
                tvg[window*NANTS*NTOT + ant*NTOT : window*NANTS*NTOT + (ant+1)*NTOT] = window + 1j*0
    elif opts.mode == 'noise':
        print 'Using noise TVG: Every sample of every antenna is random'
        tvg[:] = np.random.randint(-8, high=7, size=tvg_vec_len) + 1j*np.random.randint(-8, high=7, size=tvg_vec_len)
    else:
        print 'Unknown tvg type: %s'%opts.mode
        exit()
    
    if (np.real(tvg) > 7).any():
        print 'ERROR: Real samples > 7 found'
        exit()
    if (np.real(tvg) < -8 ).any():
        print 'ERROR: Real samples < -8 found'
        exit()
    if (np.imag(tvg) > 7).any():
        print 'ERROR: Imag samples > 7 found'
        exit()
    if (np.imag(tvg) < -8).any():
        print 'ERROR: Imag samples < -8 found'
        exit()

    # Write the test vectors to bram
    for p in range(NPARALLEL):
        tv = tvg[p::NPARALLEL]
        tv_8bit = np.array(((np.array(tv.real, dtype=int) & 0xf) << 4) + (np.array(tv.imag, dtype=int) & 0xf), dtype=np.uint8)
        print 'Writing test vector parallel samples %d'%p
        fpga.write('din_tvg%d'%p, tv_8bit.tostring())
    #pylab.plot(struct.unpack('>4096B', fpga.read('din_tvg0', 4096)))
    #pylab.show()
    #exit()

    #Write the valid and mcnt values
    mcnts = np.zeros(NSERIAL*NANTS*NWINDOWS, dtype=int)
    vlds  = np.zeros(NSERIAL*NANTS*NWINDOWS, dtype=int)
    for w in range(NWINDOWS):
        mcnts[w*NANTS*NSERIAL : (w+1)*NANTS*NSERIAL] = w
        vlds[w*NANTS*NSERIAL : (w+1)*NANTS*NSERIAL] = is_valid[w]
    print 'Writing mcnts and valids'
    ctrl_8bit = np.array((mcnts << 1) + (vlds & 0b1), dtype=np.uint8)
    fpga.write('ctrl_bram', ctrl_8bit.tostring())
    #pylab.plot(struct.unpack('>4096B', fpga.read('ctrl_bram', 4096)))
    #pylab.show()
    #exit()


    # Get the results!
    time.sleep(0.1)
    #fpga.write_int('dout_ctrl', 0)
    #fpga.write_int('dout_ctrl', 1)
    #time.sleep(0.1)
    #rv = {'length':1024*8, 'data':fpga.read('dout_bram', 1024*8)}
    rv = fpga.snapshot_get('dout')
    rv_vec = np.array(struct.unpack('>%dl'%(rv['length']/4), rv['data']), dtype=np.int32)
    mcnt_out = rv_vec[::2]
    dout_c = rv_vec[1::2]
    dout_r = dout_c[1::2]
    dout_i = dout_c[0::2]
    dout = dout_r + 1j*dout_i
    
    bl_order = corr.sim.get_bl_order(NANTS)
    n_bls = (NANTS + 1)*NANTS / 2

    vld_window = 0
    total_baddies = 0
    for window in range(NWINDOWS):
        baddies = 0
        print 'Testing measured vs Expected for window %d...'%window
        if is_valid[window]:
            for bn, bl in enumerate(bl_order):
                measured = dout[vld_window*n_bls + bn]
                golden = corr_from_tv(tvg, bl[0], bl[1], NTOT, NANTS, window=window)
                if measured != golden:
                    print 'Baseline (%d,%d) does not match!'%(bl[0], bl[1]), 'Measured:', measured,'Golden:', golden
                    baddies += 1
                    total_baddies += 1
            print 'Done (%d baddies)'%baddies
            vld_window += 1
        else:
            print 'Window is not valid'

    print '#################################'
    if total_baddies == 0:
        print 'PASSED!'
    else:
        print 'FAILED!'
    print '#################################'

    if opts.plot:
        pylab.figure()
        pylab.subplot(3,1,1)
        pylab.plot(dout_r, label='real')
        pylab.legend()
        pylab.subplot(3,1,2)
        pylab.plot(dout_i, label='imag')
        pylab.legend()
        pylab.subplot(3,1,3)
        pylab.plot(mcnt_out, label='mcnt')
        pylab.legend()
        pylab.show()

        
        

    exit()
