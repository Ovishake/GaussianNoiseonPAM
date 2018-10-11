function [y] = modulateQAM10e6(M,SNR,OSF)
     
%     M = 16;
%     SNR = 28;
%     OSF = 8;

        k = log2(M);               % Number of bits per symbol
        n = 10e6;                  % Number of bits to process

        if mod(n,k) > 0
            n = n + (k - mod(n,k));
            %MAKING IT AS GENERIC AS POSSIBLE
            %PUT IT IN A FUNCTION AS THE PROGRAM BECOMES UNWIELDY
            %CUBERSOME
            %ALTHOUGH THIS IS NOT CORRECT
            % IN PROJECT YOU ASKED QUESTIONS WITH MULTIPLES OF 4
            % MULTIPLES OF 4 CAN DIVIDE THE INPUT YOU WANT
        end

        rng default; %default rand Integer generator
        bitstr = randi([0 1],n,1);

        bitstrArr = reshape(bitstr,length(bitstr)/k,k);
        %didn't know this in the last semester
        bitGray = zeros(n,1);
        bitGray = reshape(bitGray,length(bitGray)/k,k);

        % for i = 1:1:length(bitstrArr)
        %     temp = bitstrArr;
        %     temp = 
        % end

        %dec values
        bitDec = bi2de(bitstrArr);
        bitGray = dec2gray(bitDec);

        in_phase = zeros(length(bitGray),1);
        quadrature = zeros(length(bitGray),1);
        % lmid = length(dec2bin(bitGray(1)));
        % lmid = lmid/2;

        bitGray = bitGray.';
        bitGray = dec2bin(bitGray);
        k = log2(M);
        lmid = k/2;
        lmid_pp = lmid + 1;
        for i = 1:1:length(bitGray)
            temp = bitGray(i,:);
            if length(temp) < k
                diff = k - length(temp);
                pad = repmat('0',diff);
                temp = [pad(1),temp];
            end
            ip = temp(1:lmid);   
            quad = temp(lmid_pp:k);
            in_phase(i,1) = bin2dec(ip);
            quadrature(i,1) = bin2dec(quad);
        end


    %     plot(in_phase, quadrature, 'r.');
    %     k = waitforbuttonpress;
    %     w = [in_phase, quadrature];
        in_phase = 2 * in_phase;
        quadrature = 2 * quadrature;
        in_phase = in_phase - 3;
        quadrature = quadrature -3;
        w = [in_phase, quadrature];

        in_phase = add_awgn_noise(in_phase,SNR, OSF);
        quadrature = add_awgn_noise(quadrature,SNR, OSF);
        w = [w, in_phase];
        w = [w, quadrature];
        plot(in_phase,quadrature,'r.');
        grid on;
        y = w;
end