import numpy as np
import adc5g as adc
import corr
import time
import sys
import struct
import pylab

def snap(r,name,format='L',man_trig=True):
    n_bytes = struct.calcsize('=%s'%format)
    d = r.snapshot_get(name, man_trig=man_trig)
    return np.array(struct.unpack('>%d%s'%(d['length']/n_bytes,format),d['data']))

def uint2int(d,bits,bp):
    dout = np.array(d,dtype=float)
    dout[dout>(2**(bits-1))] -= 2**bits
    dout /= 2**bp
    return dout


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
    p.add_option('-b', '--boffile', dest='boffile',type='str', default='ami_fx_sbl_wide.bof', 
        help='Boffile to program. Default: ami_fx_sbl_wide.bof')
    p.add_option('-a', '--acc_len', dest='acc_len',type='int', default='1024', 
        help='Number of spectra to accumulate. Default: 1024')
    p.add_option('-f', '--fft_shift', dest='fft_shift',type='str', default='111111111111', 
        help='FFT shift schedule. Enter as a 12-bit binary string. Default: 111111111111 (i.e. shift every stage)')
    p.add_option('-m', '--manual_sync', dest='manual_sync',action='store_true', default=False, 
        help='Use this flag to issue a manual sync (useful when no PPS is connected). Default: Do not issue sync')

    opts, args = p.parse_args(sys.argv[1:])

    print 'Connecting to %s'%opts.roach
    r = corr.katcp_wrapper.FpgaClient(opts.roach)
    time.sleep(0.2)
    print 'ROACH is connected?', r.is_connected()

    if opts.prog_fpga:
        print 'Programming ROACH with boffile %s'%opts.boffile
        r.progdev(opts.boffile)
        time.sleep(0.5)
        print 'Estimating clock speed...'
        print 'Clock speed is %d MHz'%r.est_brd_clk()
        print 'Calibrating ADCs'
        adc.calibrate_all_delays(r,0,snaps=['snapshot_adc0'],verbosity=opts.verbosity)
        adc.calibrate_all_delays(r,1,snaps=['snapshot_adc1'],verbosity=opts.verbosity)
        #adc.sync_adc(r)
    
    print 'Setting accumulation length to %d'%opts.acc_len
    r.write_int('acc_len',opts.acc_len)

    #print 'Setting fft-shift to %s'%opts.fft_shift
    #r.write_int('fft_shift0',int(opts.fft_shift,2))
    #r.write_int('fft_shift1',int(opts.fft_shift,2))
    fft_shift=-1
    print 'Setting fft-shift to %s'%fft_shift
    r.write_int('fft_shift0',fft_shift)
    r.write_int('fft_shift1',fft_shift)

    COARSE_DELAY=1024
    print 'Setting coarse delays to %d'%COARSE_DELAY
    r.write_int('coarse_delay0',COARSE_DELAY)
    r.write_int('coarse_delay1',COARSE_DELAY)

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

    print 'Snapping adc 0'
    snap_adc0 = r.snapshot_get('snapshot_adc0',man_trig=True)
    d_adc0 = struct.unpack('>%db'%snap_adc0['length'], snap_adc0['data'])
    print 'Snapping adc 1'
    snap_adc1 = r.snapshot_get('snapshot_adc1',man_trig=True)
    d_adc1 = struct.unpack('>%db'%snap_adc1['length'], snap_adc1['data'])
    pylab.figure()
    pylab.subplot(2,1,1)
    pylab.plot(d_adc0)
    pylab.subplot(2,1,2)
    pylab.plot(d_adc1)
    
    print 'Snapping 00...'
    snap00 = r.snapshot_get('corr00',wait_period=10)
    d00 = struct.unpack('>%dq'%(snap00['length']/8),snap00['data'])
    print 'Snapping 11...'
    snap11 = r.snapshot_get('corr11',wait_period=10)
    d11 = struct.unpack('>%dq'%(snap11['length']/8),snap11['data'])
    print 'Snapping 01 real ...'
    snap01_r = r.snapshot_get('corr01_r',wait_period=10)
    d01_r = struct.unpack('>%dq'%(snap01_r['length']/8),snap01_r['data'])
    print 'Snapping 01 imag...'
    snap01_i = r.snapshot_get('corr01_i',wait_period=10)
    d01_i = struct.unpack('>%dq'%(snap01_i['length']/8),snap01_i['data'])

    pylab.figure()
    pylab.subplot(3,1,1)
    pylab.plot(d00)
    pylab.subplot(3,1,2)
    pylab.plot(d11)
    pylab.subplot(3,1,3)
    pylab.plot(d01_r)
    pylab.plot(d01_i)
    pylab.show()




