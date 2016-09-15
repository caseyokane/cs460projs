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
    lowestKStarErr = 1; lowestKStarErrInd = 0;
    cvErrMat = zeros([10 2]); cvErrMat(:,1) = 1:10;
    for dataCtr = 1:4
        %For each initial K guess from 2-10
        for initK = 2:10
            %Call the cvFunction
            cvErr = crossValidate(meas, species, initK);
            %append crossvalidate error rate to matrix
            cvErrMat(initK,2) = cvErr;
            %find lowest error rate for best k value
            if cvErr < lowestKStarErr
                lowestKStarErr = cvError; lowestKStarErrInd = initK;
            end
        end
        
        %graph cvErrMat to show k vs. error 
        
        %best k value is found as lowestKerrInd
        
        %Partition data so that 
        
        %with value for k, call kNN.m to return predicted class label
        %append the predicted labels to a matrix to check if they are right
        %check that labels are correctly placed
        
        %Call decision tree implementation 
        
    end

end

