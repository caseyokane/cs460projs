function [ J, grad ] = calcJ(theta, data, lamda)
%calcJ is used to represent the logistic regression cost function 

    %First, compute the hypothesis using the logRegHyp function
    [hyp, Xvals] = logRegHyp(data,theta);
    %Determine the number of samples for the cost function
    numSamples = size(data(:,1),1);
    %Initialize the gradient values
    grad = zeros(size(theta'));
    Yvals = data(:,end);
    
    %Implement the log liklihood cost function
    J = ((-1/numSamples) * sum((Yvals .* log(hyp)) + (1 -Yvals).*log(1-hyp)));
    
    %TODO: CLEAN UP and document
    for i =1:numSamples
        grad = grad + ((hyp(i) - Yvals(i)) * Xvals(i,:)');
    end
    grad = 1/numSamples * grad;
    
%     %If regularization is necessary (for quadratic FS) then use lambda
%     if(lamda ~= 0)
%         %Compute regularized cost where lambda is provided and ignoring the
%         %constant column of theta
%         J = J + lambda /(2*numSamples) * sum(theta(2:end).^2);
%         %Compute the regularized gradient 
%         grad = (1/numSamples) * grad + ((lambda/numSample) * [0:theta(2:end)]);
%     end
    
end

