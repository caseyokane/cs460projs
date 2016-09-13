%CS460 - Machine Learning 
%Assignment 1 - Implementing kNN
%Casey O'Kane 

function kNN = assignment1kNN()

    %Import dataset information
    %TODO: Append them as 1 file?
    synth1 = csvread('Data\synthetic-1.csv');
    synth2 = csvread('Data\synthetic-2.csv');
    synth3 = csvread('Data\synthetic-3.csv');
    synth4 = csvread('Data\synthetic-4.csv');   
    
    %Retrieve appropriate k value from crossValidation using data
    k = crossValidate();

end

function kFoldIndices = cvIndices()

end

%Cross Validation using fold-based method
function kFold = crossValidate()

    kFoldIndices = cvIndices();
    %Arrange examples in random order 
    %Divide the examples into k fold 
    cPerf = classperf(labels);
    for i = 1:k
        %Test classifier on all examples in current fold
        test = (kFoldIndices == i);
        %Train classifier using examples not in current fold
        train = ~test;
        %Compute number of examples in fold not classified correctly
        class = classify(vals(test,:),vals(train,:),labels(train,:));
        classperf(cPerf,class,test);
    end
    %estimate error as sum of all number of failures over # examples
    kFold = cPerf.ErrorRate;
end

