%CS460 - Machine Learning 
%Assignment 1 - Implementing kNN
%Casey O'Kane 
%Assignment 1 Driver

function main = assignment1kNN()

    %Import dataset information
    %TODO: Add column labels?
    synth1 = csvread('Data\synthetic-1.csv');
    synth2 = csvread('Data\synthetic-2.csv');
    synth3 = csvread('Data\synthetic-3.csv');
    synth4 = csvread('Data\synthetic-4.csv');   
    
    %Retrieve appropriate k value from crossValidation using data
    k = crossValidate(synth1, 10);

end

