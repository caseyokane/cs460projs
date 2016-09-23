%CS 460 Puzzler 1 
%Expected Value from Random Sampling Distribution 
%Casey O'Kane 

%Generate a sampling distribution for both normal/uniform examples 
% uRandSamples = rand(1000,1);
% nRandSamples = randn(1000,1);
%Range from 3 to 4 for uniform sample
q3RandSamples = (4-3).*rand(1000,1)+3;
%Mean = 4, Variance = 3^2
q4RandSamples = 3.*randn(1000,1)+4;

uN = numel(uRandSamples);
nN = numel(nRandSamples);


%fx = x^2
%fxU = sum(uRandSamples(:).^2)
%fxN = sum(nRandSamples(:).^2)

%fx = x^3 - 2x^2 + 3
fxQ3 = sum( (q3RandSamples(:).^3) - (2*q3RandSamples(:).^2) + 3)
fxQ4 = sum( (q4RandSamples(:).^3) - (2*q4RandSamples(:).^2) + 3)

%Compute the result from the summation of the function at a given sample
% expctdU = 1/uN * fxU
% expctdN = 1/nN * fxN

expctdU = 1/uN * fxQ3
expctdN = 1/nN * fxQ4
