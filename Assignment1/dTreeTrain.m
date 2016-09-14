%CS460 - Machine Learning 
%Assignment 1 - Implementing kNN
%Casey O'Kane 
%Decision Tree Method


function dTree = dTreeTrain(data, features)
    
    %Tree can only have max depth of 3
    maxDep = 3;
    %Initialize dTree structure which keeps track of splits 
    dtreeStruct = struct;
    
    %Along each dimension, find all possible splits
    %bestGini = [];
    %Iterate along each dimension 
        %Sort all values along that dimension and try all possible
        %mid-points between consecutive distinct values
        
        %find the the gini value
        %giniVals = []; cntMats = [sum(cnt)];
        %gini = 1 - sum((cnt(:)/sum(cnt(:))).^2); Where cnt is the matrix
        %giniVals = [giniVals, gini];
        %giniInd = sum(( cntMats(:)/sum(cntMats) ).*giniVals(:));
        
        %if gini index > threshold

end
