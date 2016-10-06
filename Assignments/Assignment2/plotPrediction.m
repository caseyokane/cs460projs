%Helper function used to plot result given specific information
function plotPrediction(numIter, trFeats, trLabels, teFeats, teLabels, predLabels, method)

    currTitle = strcat(num2str(numIter), 'Order Linear Regression using ', method, ' prediction');
    trainLspace = linspace(min(predLabels(:,2)), max(predLabels(:,2)), size(predLabels,1));

    
    
    %Plot for the  Normal Method
    %using the results from fitLinRegNormal, form a polynomial to plot 
    figure(); clf;
    %scatter(testLspace, hw2Train(:,2),25,'green')
    %scatter(trainLspace, hw2Train(:,2),25,'green')
    %TODO: Maybe change this?
    plot(trFeats,trLabels, 'og')
    hold on;
    %scatter(xLspace, hw2Test(:,1),25,'red')
    %scatter(testLspace, hw2Test(:,2),25,'red') 
    plot(teFeats, teLabels, 'or')
    plot(trainLspace, predLabels(:,1))
    title(currTitle)
    xlabel('Feature values')
    ylabel('Label values')

    hold off;

end

