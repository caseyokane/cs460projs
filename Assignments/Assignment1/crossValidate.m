%CS460 - Machine Learning 
%Assignment 1 - Implementing kNN
%Casey O'Kane 
%Cross Validation Functions

%Cross Validation using fold-based method
function [kFoldErr,testData,trainMeas,trainLabs] = crossValidate(dataMeas, dataLabs, numFolds)

    kFoldIndices = cvIndices(dataLabs, numFolds);
    cPerf = classperf(dataLabs);
    
    kFoldErr = zeros([numFolds 1]);
    
    %Iterate based on number of folds
    for iFold = 1:numFolds
        %Test classifier on all examples in current fold
        test = (kFoldIndices == iFold);
        %Train classifier using examples not in current fold
        train = ~test;
        %Store test data (measurements and labels)
        testData = [dataMeas(test,:) dataLabs(test,:)]; 
        %Store train measurements and labels seperately
        trainMeas = dataMeas(train,:); trainLabs = dataLabs(train,:);
        %Compute number of examples in fold not classified correctly
        class = classify(testData(:,1:2),trainMeas,trainLabs);
        classperf(cPerf,class,test);
        %estimate error as sum of all number of failures over # examples
        kFoldErr(iFold) = cPerf.ErrorRate;
    end

end

%Helper function used to generate indices from labels and numFolds
function kFoldIndices = cvIndices(observations, numFolds)
    %create group array with with numbers that represent labels
    group = grp2idx(observations); 
    
    N = numel(group); %Number of disjoint sets   
    nS = accumarray(group(:),1); %nS is number of elements for each label
    kFoldIndices = zeros(N,1); %Initialize Matrix of Zeros based on N
    
    %iterate through the number of labels
    for i = 1:numel(nS)
        h = find(group==i); %return indices for label in range
        q = ceil(numFolds *(1:nS(i))/nS(i));%Create array of ceiling values
        %determined by the number of folds and label values
        
        kPerms = randperm(numFolds); 
        randInd = randperm(nS(i));
        kFoldIndices(h(randInd)) = kPerms(q);
    end
    
end

