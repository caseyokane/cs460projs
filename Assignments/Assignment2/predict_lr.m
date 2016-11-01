%Predict the labels for a dataset given a model
function labels = predict_lr(model, data)
    %Just a matrix multiple of the data and the model
    labels = data * model;

end
