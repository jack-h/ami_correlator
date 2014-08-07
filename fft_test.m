% run this script after simulating the FFT

N_CHANS = 2048; % number of FFT channels
N_P     = 8;    % number of parallel fft outputs


%Find time index of sync out pulse
sync_index = find(sync.data)

%merge the parallel outputs
N_S = N_CHANS*N_CHANS*2*1;
d = zeros(N_S,1);

d(1:N_P:N_S) = q0.data(sync_index+1:sync_index+N_S/N_P);
d(1)
d(2:N_P:N_S) = q1.data(sync_index+1:sync_index+N_S/N_P);
d(2)
d(3:N_P:N_S) = q2.data(sync_index+1:sync_index+N_S/N_P);
d(4:N_P:N_S) = q3.data(sync_index+1:sync_index+N_S/N_P);
d(5:N_P:N_S) = q4.data(sync_index+1:sync_index+N_S/N_P);
d(6:N_P:N_S) = q5.data(sync_index+1:sync_index+N_S/N_P);
d(7:N_P:N_S) = q6.data(sync_index+1:sync_index+N_S/N_P);
d(8:N_P:N_S) = q7.data(sync_index+1:sync_index+N_S/N_P);

%d(100000:101000)

d = reshape(d,N_CHANS,N_CHANS*2)*(2^9 * 2^2);

%dc(100000:101000)
d(1:10)

figure()
CHAN = 20
plot(real(d(:,CHAN+1)),'b')
hold on
plot(imag(d(:,CHAN+1)),'r')
plot(abs(d(:,CHAN+1)),'g')


%for n = [1:128:N_CHANS]
%    plot(abs(ifft(d(:,n))).^2)
%    hold on
%end



