%CS460 - Machine Learning 
%Assignment 2 - Linear Regression and Overfitting
%Casey O'Kane 
%Assignment 2 Driver

%Import the data used throughout the assignment 
hw2Train = importdata('Data/hw2.train');
hw2Test = importdata('Data/hw2.test');
housingData = importdata('Data/housing.data');

%initialize variables that will be used later:

%For graphing:
tTrain = 1:size(hw2Train,1);
tTest = 1:size(hw2Test,1);

%Part 1 

%First make sure matrix is set up in correct order for current fitting
%Need to find the model for orders 0 through 4

%Append column of 1's to account for the bias term.
hw2TrainNorm = [ones(size(hw2Train,1), 1), hw2Train];
%Use normal equation method for linear regression to train 5 models
currNormModel = fitLinRegNormal(hw2TrainNorm(:,1:2), hw2TrainNorm(:,end));

%Normalize feature space for GD
hw2TrainGD, meanMat, stdDev = normalizeFeatures(hw2Train);
%Account for bias
hw2TrainGD = [ones(size(hw2Train,1),1), hw2TrainGD];

%Use gradient descent method for linear regression 
currGDModel = fitLinRegGD(data, labels, numIter, learnRate);

%predict labels using current models 
normLabels = predictLinearReg(currNormModel, hw2Train);
tNormRslt = 1:size(normLabels,1);
%testLspace = linspace(-2, 2);
%trainLspace = linspace(min(normLabels(:,2)), max(normLabels(:,2)), size(normLabels,1));

%using the results from fitLinRegNormal, form a polynomial to plot 
figure(1); clf;
%scatter(testLspace, hw2Train(:,2),25,'green')
%scatter(trainLspace, hw2Train(:,2),25,'green')

%TODO: Maybe change this?
plot(hw2Train(:,2), hw2Train(:,3), 'og')
hold on;
%scatter(xLspace, hw2Test(:,1),25,'red')
%scatter(testLspace, hw2Test(:,2),25,'red') 
plot(hw2Test(:,1), hw2Test(:,2), 'or')
plot(trainLspace, normLabels(:,1))
title('Order Linear Regression using normal prediction')
xlabel('Iteration')
ylabel('Normal Prediction Value')

hold off;

%Compute MSE for both methods

%plot the MSE graph for both solutions 