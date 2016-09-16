%CS460 - Machine Learning 
%Assignment 1 - Implementing kNN
%Casey O'Kane 
%Decision Tree - Find Split - Method

function [bestSplit, finalLBranch, finalRBranch] = findBestSplit(possSplits, splitMeas)
    
     bestGini = 1; finalLBranch = []; finalRBranch = [];
     if isempty(possSplits)
         bestSplit = 0;
     else
     %Iterate along each split 
        for splitCtr = 1:numel(possSplits(:,1))
            lBranch = []; rBranch = [];
            %Make the actual split 
            %iterate through original data
            for measCtr = 1:numel(splitMeas(:,1))
                %if curr measurement <= proposed split place in lBranch else r
                if splitMeas(measCtr, possSplits(splitCtr,2)) <= possSplits(splitCtr,1)
                    %place in lBranch
                    %lBranch = [lBranch; splitMeas(measCtr, possSplits(splitCtr,2));];
                    lBranch = [lBranch; splitMeas(measCtr, :);];
                else
                    %place in rBranch
                    %rBranch = [rBranch; splitMeas(measCtr, possSplits(splitCtr,2));];
                    rBranch = [rBranch; splitMeas(measCtr, :);];
                end    
            end
         
            %find the the gini value
            numPerBranch = [numel(lBranch(:,1)) numel(rBranch(:,1))];
            %for gCtr = 1:2
                %giniVals = []; cntMats = [sum(numBranchs)];
            gini = 1 - sum((numPerBranch(:)/sum(numPerBranch(:))).^2); 
            if gini <= bestGini
                bestGini = gini;
                finalLBranch = lBranch; 
                finalRBranch = rBranch;
                bestSplit = possSplits(splitCtr,1);
            end
            
                %giniVals = [giniVals, gini];
            %Calculate the gini index
            %giniInd = sum(( cntMats(:)/sum(cntMats) ).*giniVals(:));
            %end
        end

     end


end