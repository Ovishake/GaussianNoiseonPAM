# GaussianNoiseonPAM
Modelling Additive White Gaussian Noise's effect on pulse amplitude modulation, and optimal detection of the bits after it has been corrupted and then finding out the Signal to Noise Ratio or the Bit Error Rate. This was part of my course ICSI 660: Advanced Communication Engineering. Written in scratch using MATLAB (a language similar to Python) and completely original work. Although not of much significance but Optimal Detection is of significance in many fields for leveraging the power of applied AI.

The code does it for 10e3 data points, but the idea of the project was to model it for 10e6 data points. Please refer to the files with fig extension. The fig file for 10e6 is 75MB large when generated on MATLAB and too noisy -- because of the Gaussian Noise script. As a result not fit for understanding the Gaussian Noise corruption that is happening. It works will with a smaller dataset.

Run Time Comments:
The BER Loop PLot takes a long time to run. Like 60 minutes on an AMD A12 machine. Go to the function 'modulateQAM' and change n = 10e6 to n = 10e3 (line 8). This substantially reduces the run time to 5 minutes.

Please run the 'BERLoopPlot' to get the plot for all the values of SNR vs the BER

You can also get the BER values for different modulations like 4-QAM, 16-QAM, 64-QAM from entering the variable ber_store in the interactive shell of MATLAB.

The Oversampling Factor is by default 8. You can change it to get other values.In the BER Loop Plot it is 26.

modulate QAM returns the values as vectors with the first 2 vectors corresponding to the in-phase and quadrature of the generated symbol. The other two vectors are the noisy symbols made with add_awgn_noise supplied by Professor Aveek Dutta.


The Base Script generates the BER corresponding to a certain QAM and SNR combination.

Ber Loop Script generates a matrix that generates each and every BER for a QAM.
Each Row corresponds to a QAM.
The plots for each BER is done in 'red', 'blue' and 'green' colour.

Execute the base script if you want to test the correctness of the code.
