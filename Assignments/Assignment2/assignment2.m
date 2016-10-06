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
hw2Train = [ones(size(hw2Train,1), 1), hw2Train];
%Use normal equation method for linear regression to train 5 models
currModel = fitLinRegNormal(hw2Train(:,1:2), hw2Train(:,end));

%Normalize feature space for GD
    %subtract the mean and divide by the std dev of each column

%Use gradient descent method for linear regression to train 5 models

%predict labels using current models 
normLabels = predictLinearReg(currModel, hw2Train);
tNormRslt = 1:size(normLabels,1);

%using the results from fitLinRegNormal, form a polynomial to plot 
figure(1); clf;
scatter(tTrain, hw2Train(:,3),25,'green')
hold on;
scatter(tTest, hw2Test(:,2),25,'red')
plot(tNormRslt, normLabels(:,3))
xlabel('Iteration')
ylabel('Normal Prediction Value')

hold off;

%Compute MSE for both methods

%plot the MSE graph for both solutions 