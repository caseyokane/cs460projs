%CS460 - Machine Learning 
%Assignment 1 - Implementing kNN
%Casey O'Kane 

function kNN = assignment1kNN()

    %Import dataset information
    %TODO: Add column labels?
    synth1 = csvread('Data\synthetic-1.csv');
    synth2 = csvread('Data\synthetic-2.csv');
    synth3 = csvread('Data\synthetic-3.csv');
    synth4 = csvread('Data\synthetic-4.csv');   
    
    %Retrieve appropriate k value from crossValidation using data
    k = crossValidate(synth1, 10);

end

%Helper function used to generate indices from labels and numFolds
function kFoldIndices = cvIndices(observations, numFolds)
    [group, groupLabels] = grp2idx(observations); %create group array with 
    %with numbers that represent labels
    
    N = numel(group); %Number of disjoint sets   
    nS = accumarray(group(:),1); %nS is number of elements for each label
    tInd = zeros(N,1); %Initialize Matrix of Zeros based on N
    
    %iterate through the number of labels
    for g = 1:numel(nS)
        h = find(group==g); %return indices for label in range
        q = ceil(numFolds *(1:nS(g))/nS(g));%Create array of ceiling values
        %determined by the number of folds and label values
        
        kPerms = randperm(numFolds); 
        randInd = randperm(nS(g));
        tInd(h(randInd)) = kPerms(q);
    end
    
end

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

