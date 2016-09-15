%CS460 - Machine Learning 
%Assignment 1 - Implementing kNN
%Casey O'Kane 
%kNN Implementation


function kNNLabel = kNN(testPoint, k, trainPoints, trainLabels)


%Generate Distances
    %Initialize distance matrix
    numTrainInst = numel(trainPoints(:,1));
    distMat = zeros([numTrainInst 2]); distMat(:,2) = 1:numTrainInst;
    
    %Initialize k value matrix to store k values and indices 
    kNNMat = zeros([k 2]);
    %Initialize array of labels to store the labels associated with kNN
    kNNLabel = zeros([1 k]);
    
    
    %iterate through each row element in a column tPoints(:, ctr)
    for ctr = 1:numTrainInst
        %Calculate Euclidean distance using L2_distance.m with transpose
        kDist = L2_distance(testPoint', trainPoints(ctr,:)'); 
        %store result in distMat column, with index in 2nd column
        distMat(ctr,1) = kDist;
    end

%Find K closest values 
    %While there are still some k values left
    for kCtr = 1:k
        %Find the minimum distance and it's related index
        [minK, minKind] = min(distMat(:,1));
        %Remove row associated at that index to find the the new minimum
        distMat(minKind,:) = [];
        %Place minK and it's index in kNN array with index 
        kNNMat(kCtr,1) = minK; kNNMat(kCtr,2) = minKind;
        %use minKind to find labels associated with kvalues
        kNNLabel(kCtr) = trainLabels(minKind,1);
    end
    
end