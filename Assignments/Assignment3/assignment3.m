%CS460 - Machine Learning 
%Assignment 3 - Logistic Regression
%Casey O'Kane 
%Assignment 3 Driver

close all;

%%PART 0: Set up initial values
%Import data sets for raw features
filename = 'data/synthetic-1.csv';
%filename = 'data/synthetic-2.csv';
%filename = 'data/synthetic-3.csv';
%filename = 'data/synthetic-4.csv';
%filename = 'data/synthetic-5.csv';
%filename = 'data/synthetic-6.csv';

rawData = csvread(filename);

%QUAD: Planned to include basis function here
%Update dataset to account for quadratic features as well
% quadData = [rawData;
% quadFeats = [rawData (rawData(:,1) .* rawData(:,2)) (rawData(:,1).^2) (rawData(:,2).^2)];

%Determine dimensions of data 
[rows, cols] = size(rawData); %[Brows, Bcols] = size(BData);
%Initialize theta value
initTheta = zeros(1,cols); %initBTheta = zeros(1,Bcols);
%Initialize values required to plot costs later on
global costs; costs = [];
%Compute the cost 
J  = calcJ(initTheta, rawData, 0); 

%QUAD: Planned to calculate basis cost with a lambda constant 
%Bcost = calcJ(initBTheta, BData, lambda);


%%Part 1: Logistic Regression with gradient descent (and fminunc)
%Minimize the cost function by using the fminunc function 

%Determine options as stated in the lecture notes
options = optimset('GradObj', 'on', 'MaxIter', 400);

%Get results from fminunc function for raw data 
[optTheta, optCost] = fminunc(@(iTheta)calcJ(iTheta, rawData, false), initTheta, options);

%QUAD: Get results from fminunc function for the basis data set 
%[BoptTheta, BoptCost] = fminunc(@(iTheta)calcJ(iTheta, BData), initBTheta, options);

%Compute the misclassified error rate 
Xvals = [ones(length(rawData),1) rawData(:,1:2)];
Yvals = rawData(:,3);

%Calculate the sigmoid of the dot product for theta and X 
resultHyp = sigmoid(Xvals * optTheta');

numErrors = 0;
for i = 1:numel(rawData(:,1))
    
    %Determine is result is greater than threshold of 0.5 and if that
    %matches what is expected from label
    gtThresh = resultHyp(i) >= 0.5;
    mismatchLabel =  gtThresh ~= Yvals(i);
    %Append matched result
    numErrors = numErrors + mismatchLabel;
    
end


misClassError = 100 * (numErrors/length(rawData));

%%Part 2: Logistic Regression with glmfit
%Simply treat the x values as the predictive values, the y values as the
%target outcome and a column of 1's as the count parameter
Btheta = glmfit(Xvals, [Yvals ones(length(rawData),1)], 'binomial', 'link', 'logit');
glmResultHyp = sigmoid(Xvals * Btheta(2:4));

numErrors = 0;
for i = 1:numel(rawData(:,1))
    
    %Determine is result is greater than threshold of 0.5 and if that
    %matches what is expected from label
    gtThresh = glmResultHyp(i) >= 0.5;
    mismatchLabel =  gtThresh ~= Yvals(i);
    %Append matched result
    numErrors = numErrors + mismatchLabel;
    
end


misClassError2 = 100 * (numErrors/length(rawData));


%%Part 3: Plot grid with results
%Implement grid sampling the logistic regression function for a range of
%parameters and then show result

%Plot the graphs associated with the implemented logistic regression
%function
plotLogReg(rawData, optTheta, filename, 'fminunc', misClassError)

%Plot the graphs associated with glmfit
plotLogReg(rawData, Btheta(2:4)', filename, 'glmfit', misClassError2)
