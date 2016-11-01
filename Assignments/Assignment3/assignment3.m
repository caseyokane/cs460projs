%CS460 - Machine Learning 
%Assignment 3 - Logistic Regression
%Casey O'Kane 
%Assignment 3 Driver

%Getting Started
%Import data sets
data = csvread('data/synthetic-1.csv');

%Implement logistic regression hypothesis function using sigmoid function
hTheta = logRegHyp(data(1:2,:));

%Implement grid sampling the logistic regression function for a range of
%parameters and then show result
figure(2); clf;
Xmin = min(data(:,1)); Xmax = max(data(:,1));
Ymin = min(data(:,2)); Ymax = max(data(:,2));
[XX,YY] = meshgrid(linspace(Xmin, Xmax,200), linspace(Ymin, Ymax,200));

hTheta = reshape(hTheta,size(XX));

imagesc(hTheta, 'Xdata', [Xmin,Xmax], 'Ydata', [Ymin,Ymax], [0 1])
hold on
scatter(data(:,1), data(:,2), 40, data(:,3), 'filled');
contour(XX,YY,hTheta,[.5 .5], 'k')
set(h, 'MarkerEdgeColor', 'w')
hold off
axis equal
title(sprintf('%s %s',1,1)) 