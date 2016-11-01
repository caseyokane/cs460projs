function  hTheta = logRegHyp( smplPts )

    %Using the sample points, determine Theta.' * x
    %Options is needed here, the sample points are the features space
    hTheta = sigmoid(smplPts * Theta.');

end

