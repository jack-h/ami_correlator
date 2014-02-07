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
    p.add_option('-b', '--boffile', dest='boffile',type='str', default='ami_fx_sbl_wide.bof', 
        help='Boffile to program. Default: ami_fx_sbl_wide.bof')
    p.add_option('-a', '--acc_len', dest='acc_len',type='int', default='1024', 
        help='Number of spectra to accumulate. Default: 1024')
    p.add_option('-f', '--fft_shift', dest='fft_shift',type='str', default='111111111111', 
        help='FFT shift schedule. Enter as a 12-bit binary string. Default: 111111111111 (i.e. shift every stage)')
    p.add_option('-m', '--manual_sync', dest='manual_sync',action='store_true', default=False, 
        help='Use this flag to issue a manual sync (useful when no PPS is connected). Default: Do not issue sync')
    p.add_option('-c', '--clockrate', dest='clockrate', type='int', default=None, 
        help='Clock rate in MHz, for use when plotting frequency axes. If none is given, rate will be estimated from FPGA clock')

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
    clk_est = r.est_brd_clk()
    print 'Clock speed is %d MHz'%clk_est
    if opts.clockrate is None:
        clkrate = clk_est*16
    else:
        clkrate = opts.clockrate

    freq_axis = gen_freq_scale(clkrate,2048)

    if opts.prog_fpga:
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
    d_adc0 = uint2int(snap(r,'snapshot_adc0','B',man_trig=True),8,7)
    print 'Snapping adc 1'
    d_adc1 = uint2int(snap(r,'snapshot_adc1','B',man_trig=True),8,7)
    pylab.figure()
    pylab.title('raw adc')
    pylab.subplot(2,1,1)
    pylab.plot(d_adc0)
    pylab.subplot(2,1,2)
    pylab.plot(d_adc1)

    print 'snapping post delay'
    snap_delay = uint2int(snap(r,'snapshot_delay1','b'),8,7)
    pylab.figure()
    pylab.plot(snap_delay)
    pylab.title('delay')

    print 'snapping post fir'
    fir_delay = uint2int(snap(r,'snapshot_fir1','L'),18,17)
    pylab.figure()
    pylab.plot(fir_delay)
    pylab.title('fir')

    print 'snapping post fft'
    fft_r = uint2int(snap(r,'snapshot_fft_r1','L'),18,17)
    fft_i = uint2int(snap(r,'snapshot_fft_i1','L'),18,17)
    pylab.figure()
    pylab.plot(fft_r, label='real')
    pylab.plot(fft_i, label='imag')
    pylab.title('fft')
    pylab.legend()

    print 'snapping post fine delay'
    fft_r = uint2int(snap(r,'snapshot_fd_r1','L',man_trig=False),18,17)
    fft_i = uint2int(snap(r,'snapshot_fd_im1','L',man_trig=False),18,17)
    pylab.figure()
    #pylab.plot(fft_r, label='real')
    #pylab.plot(fft_i, label='imag')
    pylab.plot(fft_r**2 + fft_i**2)
    pylab.title('fine delay')
    pylab.legend()

    print 'snapping pre vacc'
    pre_vacc = snap(r,'snapshot_pre_vacc','q',man_trig=False)
    pylab.figure()
    pylab.plot(freq_axis[0:1024],dbs(pre_vacc))
    pylab.ylabel('dBs')
    pylab.xlabel('freq (MHz)')
    pylab.title('pre_vacc')
    
    print 'Snapping 00...'
    #d00 = uint2int(snap(r,'corr00','Q'),64,34)
    d00 = snap(r,'corr00','q',man_trig=False)
    print 'Snapping 11...'
    #d11 = uint2int(snap(r,'corr11','Q'),64,34)
    d11 = snap(r,'corr11','q',man_trig=False)
    print 'Snapping 01 real ...'
    #d01_r = uint2int(snap(r,'corr01_r','Q'),64,34)
    d01_r = snap(r,'corr01_r','q',man_trig=False)
    print 'Snapping 01 imag...'
    #d01_i = uint2int(snap(r,'corr01_i','Q'),64,34)
    d01_i = snap(r,'corr01_i','q',man_trig=False)

    pylab.figure()
    pylab.subplot(3,1,1)
    pylab.plot(freq_axis,dbs(d00))
    pylab.xlabel('Frequency (MHz)')
    pylab.ylabel('dBs')
    pylab.subplot(3,1,2)
    pylab.plot(freq_axis,dbs(d11))
    #pylab.plot(dbs(d11))
    pylab.xlabel('Frequency (MHz)')
    pylab.ylabel('dBs')
    pylab.subplot(3,1,3)
    #pylab.plot(freq_axis,d01_r)
    #pylab.plot(freq_axis,d01_i)
    pylab.plot(freq_axis,dbs(np.sqrt(d01_r**2 + d01_i**2)))
    pylab.xlabel('Frequency (MHz)')
    pylab.ylabel('dBs')
    pylab.show()




