%CS460 - Machine Learning 
%Assignment 4 - Image Classification Showdown
%Casey O'Kane 
%Assignment 4 Driver

%Read in relevant information contained in the data directory
trainData = importdata('data/caltechTrainData.dat');
trainLabs = importdata('data/caltechTrainLabel.dat');
lab2string = importdata('data/caltechLabel2string.dat');
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

%Train a Tree Bagger object using the training data and the training labels
RandomForest = TreeBagger(numTrees, newTrainData, newTrainLabs, 'Method', 'classification');

%Preform example prediction using remaining training data 
predictedTrainLabs = RandomForest.predict(remTrainData);

%Create confusion Matrix 
S = sprintf('%s*', predictedTrainLabs{:});
predLabsDouble = sscanf(S, '%f*');
Conf_Mat = confusionmat(remTrainLabs, predLabsDouble);

%Use a heatmat visualization with imagsc(confusionMatrix)
figure(1); clf
imagesc(Conf_Mat);
title('Confusion Matrix for 150 Trees');
xlabel('Predicted Labels');
ylabel('Actual Labels');

%Calculate true positive rate 
actTestLabs = textscan(sprintf('%i\n',remTrainLabs'),'%s');
actTestLabs = actTestLabs{1};    
mdlErr = sum(~strcmp(predictedTrainLabs, actTestLabs));
finalMdlErr = sum(mdlErr)/size(predictedTrainLabs,1);
TPR = (1 - finalMdlErr)*100

%presdict test results and store in caltechPredictLabel.dat
predictedTestLabs = RandomForest.predict(testData);
