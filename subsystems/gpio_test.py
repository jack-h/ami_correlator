import corr
import sys
import struct
import pylab
import time

BOFFILE='gpio_test.bof'

r = corr.katcp_wrapper.FpgaClient(sys.argv[1])
time.sleep(0.01)

#r.progdev(BOFFILE)

r.write_int('sync_gen_sync_period_var', 100)
r.write_int('sync_gen_sync_period_sel', 1)

r.write_int('out0_val', 1)
r.write_int('out1_val', 1)
r.write_int('out0_sel', 0)
r.write_int('out1_sel', 0)

s0 = r.snapshot_get('snapshot_in0', man_trig=True, man_valid=True)
d0 = struct.unpack('>%dB'%s0['length'], s0['data'])

s1 = r.snapshot_get('snapshot_in1', man_trig=True, man_valid=True)
d1 = struct.unpack('>%dB'%s1['length'], s1['data'])

pylab.plot(d0, label='gpio_in_0')
pylab.plot(d1, label='gpio_in_1')
pylab.ylim(-0.2, 1.2)
pylab.legend()
pylab.show()

print 'done'
