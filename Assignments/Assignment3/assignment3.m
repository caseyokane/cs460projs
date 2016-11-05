%CS460 - Machine Learning 
%Assignment 3 - Logistic Regression
%Casey O'Kane 
%Assignment 3 Driver

%%PART 0: Set up initial values
%Import data sets for raw features
filename = 'data/synthetic-1.csv';
%filename = 'data/synthetic-2.csv';
% filename = 'data/synthetic-3.csv';
% filename = 'data/synthetic-4.csv';
% filename = 'data/synthetic-5.csv';
%filename = 'data/synthetic-6.csv';

rawData = csvread(filename);


%Update dataset to account for quadratic features as well
% quadData = [rawData;
% quadFeats = [rawData (rawData(:,1) .* rawData(:,2)) (rawData(:,1).^2) (rawData(:,2).^2)];

%Determine dimensions of data 
[rows, cols] = size(rawData); %[Brows, Bcols] = size(BData);
%Initialize theta value
initTheta = zeros(1,cols); %initBTheta = zeros(1,Bcols);
%Compute the cost 
cost = calcJ(initTheta, rawData, 0); %Bcost = calcJ(initBTheta, BData, lambda);

%%Part 1: Logistic Regression with gradient descent (and fminunc)
%Minimize the cost function by using the fminunc function 
%Determine options as stated in the lecture notes
options = optimset('GradObj', 'on', 'MaxIter', 400);
%Get results from fminunc function for raw data 
[optTheta, optCost] = fminunc(@(iTheta)calcJ(iTheta, rawData, false), initTheta, options);
%Get results from fminunc function for the basis data set 
%[BoptTheta, BoptCost] = fminunc(@(iTheta)calcJ(iTheta, BData), initBTheta, options);

%Compute the misclassified error rate with code provided during lecture 
misClass = 100 * sum() / numel(y);


%%Part 2: Logistic Regression with glmfit

%%Part 3: Plot grid with results
%Implement grid sampling the logistic regression function for a range of
%parameters and then show result
Xmin = min(rawData(:,1)); Xmax = max(rawData(:,1));
Ymin = min(rawData(:,2)); Ymax = max(rawData(:,2));

%Preform basis expansion for the raw feature space
expand = @(feat) [ones(size(feat,1),1) feat(:,1) feat(:,2)]';

[XX,YY] = meshgrid(linspace(Xmin, Xmax,200), linspace(Ymin, Ymax,200));

%Use optimized theta to determine 
z = sigmoid(expand([XX(:) YY(:)])' * optTheta');
z = reshape(z,size(XX));

figure(1); clf;
imagesc(z, 'Xdata', [Xmin,Xmax], 'Ydata', [Ymin,Ymax], [0 1])
hold on
h = scatter(rawData(:,1), rawData(:,2), 30, rawData(:,3), 'filled');
contour(XX,YY,z,[.5 .5], 'k')
set(h, 'MarkerEdgeColor', 'w')
hold off
axis equal
%Include variable title
title(sprintf('%s %s',filename,'Raw')); 