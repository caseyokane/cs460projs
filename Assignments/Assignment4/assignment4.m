%CS460 - Machine Learning 
%Assignment 4 - Image Classification Showdown
%Casey O'Kane 
%Assignment 4 Driver

%Read in relevant information contained in the data directory
trainData = importdata('data/caltechTrainData.dat');
trainLabs = importdata('data/caltechTrainLabel.dat');
testData = importdata('data/caltechTestData.dat');

%Currently plan on using Tree Bagger Library
numTrees = 125; 

%Account for overfitting by randomly selecting 75% of data to train on 
newInd = randperm(size(trainData,1));
newTrainData = trainData(newInd(1:1080),:);
newTrainLabs = trainLabs(newInd(1:1080),:);
%Store the remaining values for later testing
remTrainData = trainData(newInd(1081:1440),:);
remTrainLabs = trainLabs(newInd(1081:1440),:);

%Train a Tree Bagger object using the limited training data and labels
RandomForest = TreeBagger(numTrees, newTrainData, newTrainLabs, 'Method', 'classification');

%Preform example prediction using remaining training data 
predictedRemTrainLabs = RandomForest.predict(remTrainData);
%Preform prediction on entire training dataset 
predictedTrainLabs = RandomForest.predict(trainData);

%Create confusion Matrix for remaining data 
S = sprintf('%s*', predictedRemTrainLabs{:});
predRemLabsDouble = sscanf(S, '%f*');
Conf_Mat = confusionmat(remTrainLabs, predRemLabsDouble);

%Use a heatmat visualization for confusion matrix 
figure(1); clf
imagesc(Conf_Mat);
title('Confusion Matrix of 360 Training Set Examples (with 150 Tree Random Forest)');
xlabel('Predicted Labels');
ylabel('Actual Labels');

%Calculate true positive rate for remaining data 
actTestLabs = textscan(sprintf('%i\n',remTrainLabs'),'%s');
actTestLabs = actTestLabs{1};    
mdlErr = sum(~strcmp(predictedRemTrainLabs, actTestLabs));
finalMdlErr = sum(mdlErr)/size(predictedRemTrainLabs,1);
TPR = (1 - finalMdlErr)*100


%Create confusion Matrix for entre training data 
S = sprintf('%s*', predictedTrainLabs{:});
predLabsDouble = sscanf(S, '%f*');
Conf_Mat2 = confusionmat(trainLabs, predLabsDouble);

%Use a heatmat visualization for confusion matrix 
figure(2); clf
imagesc(Conf_Mat2);
title('Confusion Matrix of Entire Training Set (with 150 Tree Random Forest)');
xlabel('Predicted Labels');
ylabel('Actual Labels');

%Calculate true positive rate for training data 
actTestLabs = textscan(sprintf('%i\n',trainLabs'),'%s');
actTestLabs = actTestLabs{1};    
mdlErr = sum(~strcmp(predictedTrainLabs, actTestLabs));
finalMdlErr = sum(mdlErr)/size(predictedTrainLabs,1);
TPR = (1 - finalMdlErr)*100

%predict test results and store in caltechPredictLabel.dat
predictedTestLabs = RandomForest.predict(testData);

%Write predicted test labels to the specified .dat file  
S = sprintf('%s*', predictedTestLabs{:});
predLabsDouble = sscanf(S, '%f*');
dlmwrite('caltechPredictLabel.dat',predLabsDouble,'precision',8)