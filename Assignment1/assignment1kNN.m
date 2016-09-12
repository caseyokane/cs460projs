%CS460 - Machine Learning 
%Assignment 1 - Implementing kNN
%Casey O'Kane 

function kNN = assignment1kNN()

    %Import dataset information
    %TODO: Append them as 1 file?
    synth1 = csvread('Data\synthetic-1.csv')
    synth2 = csvread('Data\synthetic-2.csv')
    synth3 = csvread('Data\synthetic-3.csv')
    synth4 = csvread('Data\synthetic-4.csv')    
    
    %Retrieve appropriate k value from crossValidation using data
    k = crossValidate();

end


%Cross Validation using fold-based method
function kFold = crossValidate()

    %Arrange examples in random order 
    %Divide the examples into k fold 
    for i = 1:k
        %Train classifier using examples not in current fold
        %Test classifier on all examples in current fold
        %Compute number of examples in fold not classified correctly
        %Keep track of the number of incorrect predictions
        numWrong = 0;
    end
    %estimate error as sum of all number of failures over # examples
    kFold = 10;
end

