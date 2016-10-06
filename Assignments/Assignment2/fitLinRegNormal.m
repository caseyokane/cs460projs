%Linear Solution method for linear regression
function model = fitLinRegNormal(data, labels)

    %Simple implementation that calculates the model for a given dataset
    model = inv(data' * data) * data' * labels;


end
