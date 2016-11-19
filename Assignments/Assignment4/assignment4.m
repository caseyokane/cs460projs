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
numTrees = 50; 

%Train a Tree Bagger object using the training data and the training labels
RandomForest = TreeBagger(numTrees, trainData, trainLabs, 'Method', 'classification');

%Implement cross validation
cvMdl = cvpartition(trainLabs,'k',4);
cvErr = zeros(cvMdl.NumTestSets,1);

%Train a random forest for the current iteration 
cvForest = TreeBagger(50, trainData(trainVals), trainLabs(trainVals), 'Method', 'classification');

for i = 1:cvMdl.NumTestSets

   %Store the training and testing indices 
   trainVals = cvMdl.training(i);
   testVals = cvMdl.test(i);
 
   %Use the forest to predict test labels 
   predictedTestLabs = cvForest.predict(trainData(testVals));
   
   %Get resulting test labels
   actTestLabs = textscan(sprintf('%i\n',trainLabs(testVals)'),'%s');
   actTestLabs = actTestLabs{1}; 
   
   %determine amount of times labels don't match
   cvErr(i) = sum(~strcmp(predictedTestLabs, actTestLabs))


end

%Calculate the total CV error 
finalCVerr = sum(cvErr)/sum(cvMdl.TestSize)


%Predict result using caltechTestData

%Create confusion Matrix 
ConfusMat = zeros(18);
    %increment counter for each training example seen
    %matrix where rows are true and columns are predicted 

%Use a heatmat visualization with imagsc(confusionMatrix)

%store results in caltechPredictLabel.dat

