%CS460 - Machine Learning 
%Assignment 1 - Implementing kNN
%Casey O'Kane 
%General Decision Tree Method


function dTree = dTreeTrain(meas)
    
    %Initialize dTree structure which keeps track of splits 
    %struct: table of Data, variable to split, L/R branches, depth
    f1 = 'tableData'; f2 = 'splitVal'; f3 = 'lBranch'; f4 = 'rBranch';
    f5 = 'depth'; 
    v1 = []; v2 = 0; v3 = struct([]); v4 = struct([]); v5 = 0;
    baseNode = struct(f1,v1,f2,v2,f3,v3,f4,v4,f5,v5);
    
    
    %root = baseNode; root.tableData = meas; root.depth = 1;
    dTree = splitTree( baseNode, meas, 1);
%     %For all features (along the column)
%     for featCtr = 1:numel(meas(1,:))
%         %sort the features
%         uniqueVals = unique(meas(:,featCtr));
%         %find splitValue by taking midpoint between each element in UniqueVals
%         for instCtr = 1:(numel(uniqueVals(:,1))-1)
%             %possible splits include a midterm and the associated column
%             possSplits = [possSplits; mean(uniqueVals(instCtr:(1+instCtr),1)) featCtr];
%         end
% 
%     end
%     
%     %find the best split
%     [bestSplit, bestlBranch, bestrBranch] = findBestSplit(possSplits, meas(:,1:2));
%     
%     %Actually split the tree
%     root.splitVal = bestSplit; root.bestlBranch; root.bestrBranch;
%     lNode = root;  lNode.tableData = bestlBranch; lNode.depth = 2;
%     rNode = root;  rNode.tableData = bestrBranch; rNode.depth = 3;

    %dTree = root;
        
        
end
