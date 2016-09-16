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
        initK = 10;
        %Call the cvFunction
        [cvErrMat(:,2),testData,trainMeas,trainLabs] = crossValidate(synthMeas, synthLabs, initK);
            
        %find lowest error rate for best k value
        [lowestKErr,lowestKErrInd] = min(cvErrMat(:,2));

        %graph cvErrMat to show k vs. classification error 
%         clear clf;
%         figure();
%         scatter(cvErrMat(:,1), cvErrMat(:,2));
%         title('Average Misclassification Error Rate');
%         xlabel('Number of Folds'); 
%         ylabel('Misclassification Error');
        
        %Keep track of the kNN labels for each test point (row)
        predictLabs = zeros([numel(testData(:,1)) lowestKErrInd]);
        numCorrect = 0;
        %best k value is found as lowestKerrInd, the index for lowest k
        %Iterate through each of the test points 
        for testPtCtr = 1:numel(testData(:,1))
            %Call the kNN function which returns the labels of the kNN
            %points for the passed test point.
            predictLabs(testPtCtr,:) = kNN(testData(testPtCtr,1:2), lowestKErrInd, trainMeas, trainLabs);
            %testkNN labels on test Data 
            %For all of the predicted labels
            
            for labCtr = 1:numel(predictLabs(testPtCtr,:))
                if predictLabs(testPtCtr,labCtr) == testData(testPtCtr,3)
                    numCorrect = numCorrect + 1;
                end
            end
          
        end
        
        kNNAccuracy = numCorrect / numel(testData(:,1))
        

        %Call decision tree implementation 

    %end

end

