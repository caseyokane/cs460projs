%Linear regression using Gradient Descent
function model = fit_lr_gd(data, labels, numIter, learnRate)

    %Initialize model to matrix based on feature size
    model = zeros(size(data,2),1);
    %Have a temporary model that is updated throughout the algorithm
    tempTheta = model;
    
    for iIter = 1:numIter
        %store temporary result
        temp = (data * model) - labels;
        
        %For every theta, compute the value
        for iTheta = 1:size(model,1)
            tempTheta(iTheta,1) = sum(temp.*data(:,iTheta));
        end
        
        %Use the actual Gradient descent formula
        model = model - (learnRate/size(data,1)) * tempTheta;
        
    end

end
