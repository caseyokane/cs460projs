function  hTheta = logRegHyp( data )

    %Using the sample points, determine Theta.' * x
    %Rename data set with friendlier variables
    feats = data(:,1:2); labs = data(:,3);

    %TODO: CLEAN BELOW
    %Get dimesions of the data set 
    [rows, cols] = size(feats);
    %Set up data matrix to include bias term
    X = [ones(rows,1), feats];
    
    %Initialize parameter values equal to 0 initially
        %TODO: Maybe change cols +1 to size()
    hTheta = zeros(cols+1, 1);
    
    %Compute the cost value using the sigmoid function
    hTheta = sigmoid(X * hTheta);

end

