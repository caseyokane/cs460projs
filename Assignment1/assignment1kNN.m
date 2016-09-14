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
    %k = crossValidate(synth1, 10);
    %For each collection of synthetic data 
    for dataCtr = 1:4
        %For each initial K guess from 1-10
        for initK = 1:10
            %append crossvalidate error rate to matrix 
            %find lowest error rate for best k value
            %create table k vs. error  and graph it 
        end
        
        %with value for k, call kNN.m to return predicted class label
        %append the predicted labels to a matrix to check if they are right
        %check that labels are correctly placed
        
        %Call decision tree implementation 
        
    end

end

