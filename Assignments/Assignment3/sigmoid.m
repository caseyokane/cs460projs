function sigOut = sigmoid(z)
%sigOut: Simple function that implements the sigmoid formula

    sigOut = 1 ./ (1 + exp(-z));

end

