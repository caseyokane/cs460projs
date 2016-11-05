function  [hyp, Xvals] = logRegHyp(data, theta)
%logRegHyp determines the hypothesis given the original dataset   
    
    %Store the feature space for calculating the sigmoid while including a 
    %bias term
    Xvals = [ones(size(data,1),1) data(:,1:2)];

    %Compute the cost value using the sigmoid function
    hyp = sigmoid(Xvals * theta');
end

