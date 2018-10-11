snr = -4:2:26;
osf = 24;
M = [4,16,64];
ber_store = [];
k1 = 0;
k2 = 0;
ber_store = zeros(length(M),length(snr));
for mod_counter = 1:1:length(M)
    for snr_counter = 1:1:length(snr)
        k = ampgen(M(mod_counter));
        %eitah specific modulation use kore
        z = modulateQAM(M(mod_counter),snr(snr_counter),osf);
        k1 = real(k);
        k2 = imag(k);
        k = [k1,k2];
        generated_signal = [z(:,1),z(:,2)];
        noisy_points = [z(:,3),z(:,4)];
        demod = demodulateQAM(noisy_points , k);
        ber = berCompare(demod, generated_signal);
        ber_store(mod_counter,snr_counter)= ber;
    end
end

ber_store
%plot the BER against SNR

%plot BER for each QAM
grid on;
plot(ber_store(1,:),snr,'r');
hold on;
plot(ber_store(2,:),snr,'b');
plot(ber_store(3,:),snr,'g');

