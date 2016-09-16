function decBound = decision_boundary()
% Example code that shows how to plot the function value and a decision
% boundary for a simple logistic regression model using python
%
% Author: Nathan Jacobs
%

    % basis expansion
    expand = @(feat) [ones(size(feat,1),1) feat(:,1) feat(:,2) feat(:,2).^2]';

    % define the function
    %Inputs values(features) and does things
    %replace in parameters with endpoints 
    f = @(vals) 1./(1+exp(-[0, 1, -.5,.5]*vals));

    % some training points
    % run the sample points 
    X_samp = 10*rand(100,2) - 5;
    z_samp = f(expand(X_samp))';
    label_samp = z_samp > rand(size(z_samp));

    % define the domain
    x_min = -5; x_max = 5;
    y_min = -5; y_max = 5;

    [x, y] = meshgrid(linspace(x_min,x_max,200), linspace(y_min,y_max,200));

    % evaluate

    z = f(expand([x(:) y(:)])); % lets pretend that this is the result of your kNN
    z = reshape(z, size(x));

    % plot
    figure(1); clf; 
    %Gives background color
    imagesc(z, 'XData', [x_min,x_max], 'YData', [y_min,y_max], [0 1])
    hold on
    %Draws decision boundary
    contour(x,y,z,[.5 .5],'k', 'LineWidth', 2)
    %Draws points 
    h = scatter(X_samp(:,1), X_samp(:,2), 60, label_samp, 'filled');
    set(h, 'MarkerEdgeColor', 'w')
    hold off
    axis xy, xlabel('X'), ylabel('Y')
    colorbar
    
end

