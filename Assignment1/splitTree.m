%CS460 - Machine Learning 
%Assignment 1 - Implementing kNN
%Casey O'Kane 
%General Decision Tree Method

function node = splitTree( baseNode, tableData, depth )

    possSplits = [];
    root = baseNode; root.tableData = tableData; root.depth = depth
    
    if isempty(tableData)
        node = root;
    else 
        %For all features (along the column)
        for featCtr = 1:numel(tableData(1,:))
            %sort the features
            uniqueVals = unique(tableData(:,featCtr));
            %find splitValue by taking midpoint between each element in UniqueVals
            for instCtr = 1:(numel(uniqueVals(:,1))-1)
                %possible splits include a midterm and the associated column
                possSplits = [possSplits; mean(uniqueVals(instCtr:(1+instCtr),1)) featCtr];
            end

        end

        %find the best split
        [bestSplit, bestlBranch, bestrBranch] = findBestSplit(possSplits, tableData(:,1:2));
        root.splitVal = bestSplit; 

        %Actually split the tree
        if depth < 3
            lNode = splitTree( baseNode, bestlBranch, depth+1 );
            rNode = splitTree( baseNode, bestrBranch, depth+1 );
            root.lBranch=lNode; root.rBranch =rNode;
        end  
        node = root;
    end
    

end

