clear;
snr = 26;
osf = 8;
M = 16;
k = ampgen(M);
y = 0;
z = modulateQAM(M,snr,osf);
% plot(y,'r.');
%feed z to demodulateQAM
% ekhaneo complex dite hobe
k1 = real(k);
k2 = imag(k);
k = [k1,k2];
generated_signal = [z(:,1),z(:,2)];
noisy_points = [z(:,3),z(:,4)];
demod = demodulateQAM(noisy_points , k);
ber = berCompare(demod, generated_signal);



