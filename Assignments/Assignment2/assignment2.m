%CS460 - Machine Learning 
%Assignment 2 - Linear Regression and Overfitting
%Casey O'Kane 
%Assignment 2 Driver

%Import the data used throughout the assignment 
hw2Train = importdata('Data/hw2.train');
hw2Test = importdata('Data/hw2.test');
housingData = importdata('Data/housing.data');

%initialize variables that will be used later:
%For gradient descent
learnRate = 0.01;
numIter = 1000;

%For graphing:
tTrain = 1:size(hw2Train,1);
tTest = 1:size(hw2Test,1);

%%%Part 1 

%Simplify data collection
trainFeats = hw2Train(:,1:end-1); 
trainLabels = hw2Train(:,end);
testFeats = hw2Test(:,1:end-1);
testLabels = hw2Test(:,end);

[numRows,numFeats] = size(currTrainFeats);

%Append column of 1's to account for the bias term.
trainFeats = [ones(numRows, 1), trainFeats];

%Need to find the model for orders 2,3,4
%Order 2 will find the square of the x values
ord2 = trainFeats.^2;
%Order 3 will find the cube of the x values
ord3 = trainFeats.^3;
%Order 4 will find multiply x by a constant value
ord4 = trainFeats.*2;

%Append new orders to the end of the features matrix
trainFeats = [trainFeats, ord2, ord3, ord4];


for iOrd = 1:5
    
    %For data use Feats, labels use Labels
    currTrainFeats = trainFeats(:,1:iOrd); 
    currTrainLabels = trainLabels;
    %currTrainLabels = hw2Train(:,end);
    %currTestFeats = hw2Test(:,1:end-1);
    currTestFeats = testFeats;
    currTestLabels = testLabels;
    
    %Use normal equation method for linear regression to train 5 models
    currNormModel = fitLinRegNormal(currTrainFeats, currTrainLabels);

    %Normalize feature space for GD
    [hw2TrainGD, meanMat, stdDev] = normalizeFeatures(currTrainFeats);

    %Use gradient descent method for linear regression 
    currGDModel = fitLinRegGD(currTrainFeats, currTrainLabels, numIter, learnRate);

    %predict labels using current models 
    normLabels = predictLinearReg(currNormModel, currTrainFeats);
    gdLabels = predictLinearReg(currGDModel, currTrainFeats);
    tNormRslt = numRows;
    

    %Compute MSE for both methods

    %plot the MSE graph for both solutions 

    %Plots the values in here. TODO Need to update first argument.
    plotPrediction(iOrd, trainFeats(:,2), trainLabels, testFeats, testLabels, normLabels, ' normal ')
    %plotPrediction(1, currTrainFeats, currTrainLabels, currTestFeats, currTestLabels, currNormModel, ' normal ')
    %plotPrediction(1, currTrainFeats, currTrainLabels, currTestFeats, currTestLabels, gdLabels, ' gradient descent ')

end 


%Part 2 

%F_orig contains the original data (row = example)

%Make some additional feature types
% F = [F_orig F_orig.^2 log(F_orig) 1]
% 
% # try all size-2 subsets of features
% min_error = Infinity
% for i = 1:size(F,2)
%     for j = i+1:size(F,2)
%         # run cross validation
%         err = 0            F_local = F(:, [i,j]);
%         for fold = 1:k
%              fit regression model from F_local to target to k-th training fold
%              err = err + error on k-th testing fold
%         end
%  
%         if err < min_error
%             bestModel = [i j];
%             min_error = err;
%         end
%     end
% end
% 
% fit regression model to full dataset
% 
% compute MSE on full dataset
%select the optimal model (minimum mean-squared error)
%Collect any two compatible pairs of columns and create a new feature space


