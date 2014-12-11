import socket, numpy as np, struct

IP = '10.1.1.1'
PORT = 10000
words_per_pkt = 55*2
PKT_SIZE = words_per_pkt*4 + 8 + 4 + 4
pkt_fmt = '>QLL%dL'%words_per_pkt

expected_pkt = tuple([i*1024 for i in range(words_per_pkt)])

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

s.bind((IP,PORT))

i = 0
while True:
   try:
       data, addr = s.recvfrom(PKT_SIZE)
       print i, 'received from %s:%d'%addr
       d = struct.unpack(pkt_fmt, data)
       print 'mcnt: %d, xeng: %d, offset: %d, packet ok? %r'%(d[0], d[1], d[2], d[3:]==expected_pkt)
       i += 1
       
   except KeyboardInterrupt:
       s.close()
