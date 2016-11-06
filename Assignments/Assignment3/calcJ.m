function [ J, NewGrad ] = calcJ(theta, data, lambda)
%calcJ is used to represent the logistic regression cost function 

    global costs;
    %First, compute the hypothesis using the logRegHyp function
    [hypVals, Xvals] = logRegHyp(data,theta);
    %Determine the number of samples for the cost function
    numSamples = size(data(:,1),1);
    %Initialize the gradient values
    grad = zeros(size(theta'));
    Yvals = data(:,end);
    
    %Implement the log liklihood cost function as discussed during lecture
    J = ((-1/numSamples) * sum((Yvals .* log(hypVals)) + (1 -Yvals).*log(1-hypVals)));
    
    %Continue to compute the gradient for each sample
    for i =1:numSamples
        %Use gradient computation formula as mentioned during lecture
        grad = grad + (Xvals(i,:)' * (hypVals(i) - Yvals(i)));
    end
    
    %Return New gradient using the ideal one
    NewGrad = 1/numSamples * grad;
    
    %After cost value has been found append it to the costs list
    if(isnan(J) ~= 1)
        costs = [costs J];
    end
    
%     QUAD: Would finish if had more time, feel that I'm missing some things though 
%     If regularization is necessary (for quadratic FS) then use lambda
%     if(lamda ~= 0)
%         %Compute regularized cost where lambda is provided and ignoring the
%         %constant column of theta
%         J = J + lambda /(2*numSamples);
%         %Compute the regularized gradient 
%         grad = (1/numSamples) * grad + ((lambda/numSample));
%     end
    
end

