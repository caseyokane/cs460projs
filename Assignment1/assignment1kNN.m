%CS460 - Machine Learning 
%Assignment 1 - Implementing kNN
%Casey O'Kane 
%Assignment 1 Driver

function main = assignment1kNN()

    %Import dataset information
    synth1 = csvread('Data/synthetic-1.csv');
    synth2 = csvread('Data/synthetic-2.csv');
    synth3 = csvread('Data/synthetic-3.csv');
    synth4 = csvread('Data/synthetic-4.csv');   
    
    synthCell = cell(4);
    synthCell{1} =synth1; synthCell{2} =synth2; synthCell{3} =synth3;
    synthCell{4} =synth4;
    
    %For each collection of synthetic data 
    lowestKErr = 1; lowestKErrInd = 0;
    cvErrMat = zeros([10 2]); cvErrMat(:,1) = 1:10;
    
    %for dataCtr = 1:4
    
        %Set the data to the currently used synthesized data
        currSynthData = synthCell{2};
        %Get measurements and labels 
        synthMeas = currSynthData(:,1:2); synthLabs = currSynthData(:,3);
        %Guess k=10 to reduce bias 
        %for initK = 2:10
        initK = 10;
        %Call the cvFunction
        cvErrMat(:,2) = crossValidate(synthMeas, synthLabs, initK);
            
            %append crossvalidate error rate to matrix
            %cvErrMat(initK,2) = cvErr;
            
        %find lowest error rate for best k value
            %if cvErr < lowestKErr
            %   lowestKErr = cvError; lowestKErrInd = initK;
            %end
        [lowestKErr,lowestKErrInd] = min(cvErrMat(:,1));
        %end

        %graph cvErrMat to show k vs. classification error 
        clear clf;
        figure();
        scatter(cvErrMat(:,1), cvErrMat(:,2));
        title('Average Misclassification Error Rate');
        xlabel('Number of Folds'); 
        ylabel('Misclassification Error');
        
        %best k value is found as lowestKerrInd

        %Partition data so so that you can get kNN from train data 
        %testkNN labels on test Data 

        %with value for k, call kNN.m to return predicted class label
        %append the predicted labels to a matrix to check if they are right
        %check that labels are correctly placed

        %Call decision tree implementation 

    %end

end

