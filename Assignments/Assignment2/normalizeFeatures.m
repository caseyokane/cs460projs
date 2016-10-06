%Helper function used to normalize feature space for gradient descent 
%mean and stddev are used for normalizing the test data 
function [featureSpace, meanMat, stdDevMat] = normalizeFeatures(data)

    featureSpace = data;
    [numRow, numCol] = size(data);
    %Initialize arrays to store the std dev and mean for each feature
    stdDevMat = zeros(1, numCol); meanMat = zeros(1,numCol);

    %For each feature determine mean and std dev
    for iCtr=1:numCol
        meanMat(1,iCtr) = mean(data(:,iCtr)); 
        stdDevMat(1,iCtr) = std(data(:,iCtr));
        
        %Subtract the mean and divide by the standard deviation of each column
        featureSpace(:,iCtr) = (data(:,iCtr)-mean(1,iCtr))/stdDevMat(1,iCtr);
    end

end

