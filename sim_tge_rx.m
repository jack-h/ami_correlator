SIM_LENGTH = 128*4*10*2*2
N_WORDS_PER_PACKET = 512/8

t = [1:SIM_LENGTH]';
z = zeros(1,SIM_LENGTH)';

sim_rst.time = t;
sim_rst.signals.values = z;
sim_gbe_din.time = t;
sim_gbe_din.signals.values = z;
sim_gbe_vld.time = t;
sim_gbe_vld.signals.values = z;
sim_gbe_eof.time = t;
sim_gbe_eof.signals.values = z;

mcnt=0;
ant=0;
chan=0;

sim_rst.signals.values(1) = 1;

sim_rst.signals.values

timeoffset = 0;
mcnt= 0
buf = 0
ant = 0

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 1

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 2

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 3

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 4

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 5

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 6

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 7

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 8

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 9

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

%%%%%

timeoffset = timeoffset + 128;
mcnt= mcnt + 4
buf = buf + 1
ant = 0

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 1

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 2

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 3

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 4

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 5

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 6

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 7

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 8

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 9

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
mcnt= mcnt + 4
buf = buf + 1
ant = 0

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 1

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 2

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 3

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 4

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 5

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 6

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 7

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 8

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 9

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
mcnt= mcnt + 4
buf = buf + 1
ant = 0

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 1

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 2

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 3

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 4

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 5

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 6

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 7

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 8

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 9

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

%%%%%

timeoffset = timeoffset + 128;
mcnt= mcnt + 4
buf = buf + 1,4
ant = 0

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 1

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 2

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 3

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 4

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 5

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 6

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 7

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 8

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 9

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
mcnt= mcnt + 4
buf = buf + 1
ant = 0

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 1

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 2

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 3

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 4

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 5

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 6

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 7

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 8

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 9

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
mcnt= mcnt + 4
buf = buf + 1
ant = 0

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 1

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 2

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 3

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 4

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 5

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 6

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 7

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 8

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

timeoffset = timeoffset + 128;
ant = 9

sim_gbe_din.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), mcnt * (2^16) + ant * (2^8) + buf, [0:N_WORDS_PER_PACKET-1]];
sim_gbe_vld.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), ones(1, N_WORDS_PER_PACKET+1)];
sim_gbe_eof.signals.values(timeoffset + 1:timeoffset + N_WORDS_PER_PACKET + 13) = [zeros(1,12), zeros(1, N_WORDS_PER_PACKET), 1];

