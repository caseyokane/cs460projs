function plotLogReg(Data, optTheta, filename, version, misClassError)
%plotLogReg Used to create visualizations for relevant functions
%   Implemented as result of code provided during lecture

global costs;

Xmin = min(Data(:,1)); Xmax = max(Data(:,1));
Ymin = min(Data(:,2)); Ymax = max(Data(:,2));

%Preform basis expansion for the raw feature space
expand = @(feat) [ones(size(feat,1),1) feat(:,1) feat(:,2)]';

[XX,YY] = meshgrid(linspace(Xmin, Xmax,200), linspace(Ymin, Ymax,200));

%Use optimized theta to determine 
z = sigmoid(expand([XX(:) YY(:)])' * optTheta');
z = reshape(z,size(XX));

figure(); clf;
imagesc(z, 'Xdata', [Xmin,Xmax], 'Ydata', [Ymin,Ymax], [0 1])
hold on
h = scatter(Data(:,1), Data(:,2), 30, Data(:,3), 'filled');
contour(XX,YY,z,[.5 .5], 'k')
set(h, 'MarkerEdgeColor', 'w')
hold off
axis equal
%Include variable title
title(sprintf('%s %s using %s with error: %.2f%%',filename,'Raw', version, misClassError)); 


%Now plot the costs function
figure(); clf;
plot(costs);
title(sprintf('%s Cost Plot using %s',filename, version));

end

