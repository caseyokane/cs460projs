function altBestSplit = altBestSplit( node )
%Alternative to best split which calculates the gini Index 

    %For each column
        %determine all splits
        %For each split 
            %Calculate gini index
                %calculate left gini
                %calculate right gini
            %giniInd = numel(lBranch)/totalBranchlengh *lGini + numel(rBranch)/totalBranchlengh *rGini
            %if giniInd < giniMin
                %giniMin = giniInd;
                %finalLBranch = lBranch; 
                %finalRBranch = rBranch;
                %bestSplitVal = possSplits(splitCtr,1); 
    %After for loop is exited assign L/R Branches and best Split value to node
    
end

