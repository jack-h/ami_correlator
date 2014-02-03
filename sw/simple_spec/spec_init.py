import numpy as np
import adc5g as adc
import corr
import time
import sys
import struct
import pylab

def snap(r,name,format='L',man_trig=True,wait_period=10):
    n_bytes = struct.calcsize('=%s'%format)
    d = r.snapshot_get(name, man_trig=man_trig, wait_period=wait_period)
    return np.array(struct.unpack('>%d%s'%(d['length']/n_bytes,format),d['data']))

def uint2int(d,bits,bp,complex=False):
    if complex:
        dout_r = (np.array(d) & (((2**bits)-1)<<bits)) >> bits
        dout_i = np.array(d) & ((2**bits)-1)
        dout_r = uint2int(dout_r,bits,bp,complex=False)
        dout_i = uint2int(dout_i,bits,bp,complex=False)
        return dout_r + 1j*dout_i
    else:
        dout = np.array(d,dtype=float)
        dout[dout>(2**(bits-1))] -= 2**bits
        dout /= 2**bp
        return dout

def dbs(x):
    return 10*np.log10(x)

def gen_freq_scale(fs,N):
    return np.arange(0,fs/2.,fs/2./N)


if __name__ == '__main__':
    from optparse import OptionParser

    p = OptionParser()
    p.set_usage('%prog [options]')
    p.set_description(__doc__)
    p.add_option('-p', '--skip_prog', dest='prog_fpga',action='store_false', default=True, 
        help='Skip FPGA programming (assumes already programmed).  Default: program the FPGAs')
    #p.add_option('-e', '--skip_eq', dest='prog_eq',action='store_false', default=True, 
    #    help='Skip configuration of the equaliser in the F engines.  Default: set the EQ according to config file.')
    p.add_option('-v', '--verbosity', dest='verbosity',type='int', default=0, 
        help='Verbosity level. Default: 0')
    p.add_option('-r', '--roach', dest='roach',type='str', default='192.168.0.111', 
        help='ROACH IP address or hostname. Default: 192.168.0.111')
    p.add_option('-b', '--boffile', dest='boffile',type='str', default='simple_spec.bof', 
        help='Boffile to program. Default: simple_spec.bof')
    p.add_option('-a', '--acc_len', dest='acc_len',type='int', default='1048576', 
        help='Number of spectra to accumulate. Default: 1048576')
    p.add_option('-t', '--tvg', dest='tvg',action='store_true', default=False, 
        help='Use corner turn tvg. Default:False')
    p.add_option('-u', '--update', dest='update',action='store_true', default=False, 
        help='Auto update plot. Default:False')
    p.add_option('-f', '--fft_shift', dest='fft_shift',type='str', default='111111111111', 
        help='FFT shift schedule. Enter as a 12-bit binary string. Default: 111111111111 (i.e. shift every stage)')
    p.add_option('-m', '--manual_sync', dest='manual_sync',action='store_true', default=False, 
        help='Use this flag to issue a manual sync (useful when no PPS is connected). Default: Do not issue sync')
    p.add_option('-c', '--clockrate', dest='clockrate', type='int', default=None, 
        help='Clock rate in MHz, for use when plotting frequency axes. If none is given, rate will be estimated from FPGA clock')

    opts, args = p.parse_args(sys.argv[1:])


    N_CHANS = 2048

    print 'Connecting to %s'%opts.roach
    r = corr.katcp_wrapper.FpgaClient(opts.roach)
    time.sleep(0.2)
    print 'ROACH is connected?', r.is_connected()

    if opts.prog_fpga:
        print 'Programming ROACH with boffile %s'%opts.boffile
        r.progdev(opts.boffile)
        time.sleep(0.5)

    print 'Estimating clock speed...'
    fpga_clk_est = r.est_brd_clk()
    print 'Clock speed is %d MHz'%fpga_clk_est
    if opts.clockrate is None:
        clkrate = fpga_clk_est*16 #This is the ADC rate
    else:
        clkrate = opts.clockrate

    print 'ADC sample rate is %d MHz'%clkrate
    freq_axis = gen_freq_scale(clkrate,N_CHANS)

    if opts.prog_fpga:
        print 'Calibrating ADCs'
        adc.calibrate_all_delays(r,0,snaps=['snapshot_adc0'],verbosity=opts.verbosity)
        #adc.sync_adc(r)
    
    print 'Setting accumulation length to %d'%opts.acc_len,
    print '(%.2f seconds)'%((2*N_CHANS*opts.acc_len)/(clkrate*1e6))
    # There is an inherent accumulation of 8 parallel samples. The register 'acc_len'
    # controls serial accumulation, so write opts.acc_len/8 to it
    r.write_int('acc_len',opts.acc_len//8)

    fft_shift_int = int(opts.fft_shift,2)
    print 'Setting fft-shift to %s'%opts.fft_shift
    r.write_int('fft_shift0',fft_shift_int)

    print 'Using test vector generator?:', opts.tvg
    r.write_int('ct_tvg_en',int(opts.tvg))

    print 'Arming pps'
    ctrl = r.read_uint('control')
    ctrl = ctrl | (1<<2)
    r.write_int('control',ctrl)
    ctrl = ctrl & ((2**32-1)-(1<<2))
    r.write_int('control',ctrl)

    if opts.manual_sync:
        print 'Issuing manual sync'
        for i in range(2): #After a reset, the first sync is ignored, so send two
            ctrl = r.read_uint('control')
            ctrl = ctrl | (1<<1)
            r.write_int('control',ctrl)
            ctrl = ctrl & ((2**32-1)-(1<<1))
            r.write_int('control',ctrl)

    #print 'Snapping adc 0'
    #d_adc0 = uint2int(snap(r,'snapshot_adc0','B',man_trig=True),8,7)
    #pylab.figure()
    #pylab.plot(d_adc0)
    

    pylab.figure()
    if opts.update:
        pylab.ion()
    while True:
        pylab.cla()
        print 'snapping 00...',
        #d00 = uint2int(snap(r,'corr00','q'),64,34)
        d00 = snap(r,'corr00','q',man_trig=False)
        cnt = (r.read_uint('mcnt_lsb') >> 11) / (opts.acc_len//8) #shift down by 2**11 because mcnt counts channels (after parallel accumulation)
        print cnt
        if opts.tvg:
            pylab.plot(d00)
            for dn, d in enumerate(d00):
                print dn,d
        else:
            pylab.plot(freq_axis,dbs(d00))
        pylab.title('spectrum %d'%cnt)
        pylab.xlabel('frequency (mhz)')
        pylab.ylabel('dbs')
        if opts.update:
            pylab.draw()
        else:
            pylab.show()

