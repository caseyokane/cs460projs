%CS460 - Machine Learning 
%Assignment 1 - Implementing kNN
%Casey O'Kane 
%Cross Validation Functions

%Cross Validation using fold-based method
function kFold = crossValidate(dataMeas, dataLabs, numFolds)

    kFoldIndices = cvIndices(dataLabs, numFolds);
    %Arrange examples in random order 
    %Divide the examples into k fold 
    cPerf = classperf(dataLabs);
    
    %Iterate based on number of folds
    for i = 1:numFolds
        %Test classifier on all examples in current fold
        test = (kFoldIndices == i);
        %Train classifier using examples not in current fold
        train = ~test;
        %Compute number of examples in fold not classified correctly
        class = classify(dataMeas(test,:),dataMeas(train,:),dataLabs(train,:));
        classperf(cPerf,class,test);
    end
    %estimate error as sum of all number of failures over # examples
    kFold = cPerf.ErrorRate;
end

%Helper function used to generate indices from labels and numFolds
function kFoldIndices = cvIndices(observations, numFolds)
    [group, groupLabels] = grp2idx(observations); %create group array with 
    %with numbers that represent labels
    
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

