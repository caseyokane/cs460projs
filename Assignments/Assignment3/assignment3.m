%CS460 - Machine Learning 
%Assignment 3 - Logistic Regression
%Casey O'Kane 
%Assignment 3 Driver

%Getting Started
%Import data sets
data = csvread('data/synthetic-1.csv');

%compute cost of logisitc regression
hTheta = logRegHyp(data);


%Implement logistic regression hypothesis function using sigmoid function
%hTheta = logRegHyp(data(1:2,:));

%Implement grid sampling the logistic regression function for a range of
%parameters and then show result
Xmin = min(data(:,1)); Xmax = max(data(:,1));
Ymin = min(data(:,2)); Ymax = max(data(:,2));

%Define the function for logistic regression plotting
f = @(vals) 1./(1+exp(-[0, 1, -.5,.5]*vals));

[XX,YY] = meshgrid(linspace(Xmin, Xmax,200), linspace(Ymin, Ymax,200));

hTheta = reshape(hTheta,size(XX));

figure(1); clf;
imagesc(hTheta, 'Xdata', [Xmin,Xmax], 'Ydata', [Ymin,Ymax], [0 1])
hold on
scatter(data(:,1), data(:,2), 30, data(:,3), 'filled');
contour(XX,YY,hTheta,[.5 .5], 'k')
set(h, 'MarkerEdgeColor', 'r')
hold off
axis equal
%Include variable title
%title(sprintf('%s %s',1,1)) 