%Helper function used to plot result given specific information
function plotPrediction(numIter, trFeats, trLabels, teFeats, teLabels, predLabels, method)

    currOrder = abs(1 - numIter);
    currTitle = strcat(num2str(currOrder), ' Order Linear Regression using ', method, ' prediction');
    %line space for linear regression prediction 
    labMat = predLabels(:,1);
    trainLspace = linspace(min(labMat), max(labMat), size(predLabels,1));
    %trainLspace = linspace(-1.5, 1.5);

    
    
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
    %plot(trainLspace, predLabels(:,1))
    plot(trainLspace, polyval(predLabels,trainLspace))
    title(currTitle)
    xlabel('Feature values')
    ylabel('Label values')

    hold off;

end

