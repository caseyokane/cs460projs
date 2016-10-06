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

%Part 1 

%First make sure matrix is set up in correct order for current fitting
%Need to find the model for orders 0 through 4

%INSIDE FOR LOOP HERE

%For data use Feats, labels use Labels
trainFeats = hw2Train(:,1:end-1); 
trainLabels = hw2Train(:,end);
testFeats = hw2Test(:,1:end-1);
testLabels = hw2Test(:,end);
[numRows,numFeats] = size(trainFeats);

%Append column of 1's to account for the bias term.
hw2TrainNorm = [ones(numRows, 1), trainFeats];
%Use normal equation method for linear regression to train 5 models
currNormModel = fitLinRegNormal(hw2TrainNorm, trainLabels);

%Normalize feature space for GD
[hw2TrainGD, meanMat, stdDev] = normalizeFeatures(trainFeats);

%Account for bias
hw2TrainGD = [ones(numRows,1), trainFeats];

%Use gradient descent method for linear regression 
currGDModel = fitLinRegGD(hw2TrainGD, trainLabels, numIter, learnRate);

%predict labels using current models 
normLabels = predictLinearReg(currNormModel, hw2TrainNorm);
gdLabels = predictLinearReg(currGDModel, hw2TrainGD);
tNormRslt = numRows;

%Compute MSE for both methods

%plot the MSE graph for both solutions 

%Plots the values in here. TODO Need to update first argument.
plotPrediction(0, trainFeats, trainLabels, testFeats, testLabels, normLabels, ' normal ')
plotPrediction(0, trainFeats, trainLabels, testFeats, testLabels, gdLabels, ' gradient descent ')



%Part 2 
