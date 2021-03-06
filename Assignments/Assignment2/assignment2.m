%CS460 - Machine Learning 
%Assignment 2 - Linear Regression and Overfitting
%Casey O'Kane 
%Assignment 2 Driver

%%%Part 1 
%Import the data used throughout the assignment 
hw2Train = importdata('Data/hw2.train');
hw2Test = importdata('Data/hw2.test');

%initialize variables that will be used later:
%For gradient descent
learnRate = 0.01;
numIter = 1000;

%Simplify data collection
trainFeats = hw2Train(:,1:end-1); 
trainLabels = hw2Train(:,end);
testFeats = hw2Test(:,1:end-1);
testLabels = hw2Test(:,end);

[numRows,numFeats] = size(trainFeats);

%Append column of 1's to account for the bias term.
trainFeats = [ones(numRows, 1), trainFeats];

%Need to find the model for orders 2,3,4
%Order 2 will find the square of the x values
ord2 = trainFeats(:,2).^2;
%Order 3 will find the cube of the x values
ord3 = trainFeats(:,2).^3;
%Order 4 will find multiply x by a constant value
ord4 = trainFeats(:,2).*2;

%Append new orders to the end of the features matrix
trainFeats = [trainFeats, ord2, ord3, ord4];


for iOrd = 1:5
    
    %For data use Feats, labels use Labels
    currTrainFeats = trainFeats(:,1:iOrd); 
    currTrainLabels = trainLabels;
    currTestFeats = testFeats;
    currTestLabels = testLabels;
    
    %Use normal equation method for linear regression to train 5 models
    currNormModel = fit_lr_normal(currTrainFeats, currTrainLabels);

    %Normalize feature space for GD
    [hw2TrainGD, meanMat, stdDev] = normalizeFeatures(currTrainFeats);

    %Use gradient descent method for linear regression 
    currGDModel = fit_lr_gd(currTrainFeats, currTrainLabels, numIter, learnRate);

    %predict labels using current models 
    normLabels = predict_lr(currNormModel, currTrainFeats);
    gdLabels = predict_lr(currGDModel, currTrainFeats);
    tNormRslt = numRows;

    %Compute MSE for both methods
    mseNormal = compute_MSE(trainLabels, normLabels);
    mseGD = compute_MSE(trainLabels, gdLabels);

    %plot the prediction graph (with MSE) for both solutions 
    plotPrediction(iOrd, trainFeats(:,2), trainLabels, testFeats, testLabels, mseNormal, currNormModel, ' normal ')
    plotPrediction(iOrd, trainFeats(:,2), trainLabels, testFeats, testLabels, mseGD, currGDModel, ' gradient descent ')

end 


%%%Part 2 

%Using psuedocode provided in assignment prompt
%F_orig contains the original data (row = example)
F = importdata('Data/housing.data');
%Seperate into features and labels again
fFeats = F(:,1:13);
fLabels = F(:,14);


%try all size-2 subsets of features
min_error = Inf;
for i = 1:size(fFeats,2)
    for j = i+1:size(fFeats,2)
        err = 0;
        %F_Local is the current feature space
        F_local = fFeats(:, [i,j]);
        %Cross validate and get training and testing data 
        cv = cvpartition(fLabels,'k',5);
        %changed k=5 for 5 fold cv
        for fold = 1:5
             %fit regression model from F_local to target to k-th training fold
             trIdx = cv.training(fold);
             teIdx = cv.test(fold);
             %call the fit functions for GD and normal eqs with train data
             normalModel = fit_lr_normal(F_local(trIdx,:), fLabels(trIdx,:));
             
             %Normalize feature space for GD
             %[normalizedF, meanMat, stdDev] = normalizeFeatures(F_local);
             %gdModel = fit_lr_gd(F_local(:,trIdx), FLabels(:,trIdx));
             
             
             %call prediction function
             predNormLabels = predict_lr(normalModel, F_local(trIdx,:));
             %predGDLabels = predict_lr(gflModel, F_local);
             
             
             %calculate error
             normErr = compute_MSE(predNormLabels, fLabels(trIdx));
             %gdErr = compute_MSE(predGDLabels, fLabels(trIdx));
             %normErr = sum(~strcmp(predNormLabels, fLabels(teIdx)));
             %gdErr = sum(~strcmp(predGDLabels, fLabels(teIdx)));
             
             err = err + normErr; %on k-th testing fold
             %err = err + gdErr;
        end
        
        %If a new minimum error is found update the best model
        if err < min_error
            bestModel = [i j];
            bestModelModel = normalModel;
            min_error = err;
        end
    end
end

%fit regression model to full dataset
%after best model is found, 
normalModel = fit_lr_normal(fFeats, fLabels);
finalPredLabels = predict_lr(normalModel, fFeats);
%compute MSE on full dataset
finalMSE = compute_MSE(fLabels, finalPredLabels)
%report the best model found
bestModel
bestModelModel



