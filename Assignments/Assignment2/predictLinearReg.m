%Predict the labels for a dataset given a model
function labels = predictLinearReg(model, data)

    labels = polyval(model, data);
    %labels = model * data;

end
