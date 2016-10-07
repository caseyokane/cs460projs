%Helper function used to calculate the mean square root error
function mse = compute_MSE(groundLabels, estLabels)

    %Could use immse as an alternative
    %mse = immse(groundLabels, estLabels);
    mse = (1/size(estLabels,1)) * sum((groundLabels - estLabels).^2);

end

