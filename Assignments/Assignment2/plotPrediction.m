%Helper function used to plot result given specific information
function plotPrediction(numIter, trFeats, trLabels, teFeats, teLabels, mseVal, predLabels, method)

    %trFeats = trainData(

    currOrder = abs(1 - numIter);
    currTitle = strcat(num2str(currOrder), ' Order Linear Regression using ', method, ' prediction');
    %line space for linear regression prediction 
    
    trainLspace = linspace(min(trFeats), max(trFeats), size(trFeats,1));
    %trainLspace = linspace(-1.5, 1.5, 25);
    
    %Plot for the  Normal Method
    %using the results from fitLinRegNormal, form a polynomial to plot 
    figure(); clf;
    %scatter(testLspace, hw2Train(:,2),25,'green')
    %scatter(trainLspace, hw2Train(:,2),25,'green')
    plot(trFeats,trLabels, 'og')
    hold on;
    %scatter(xLspace, hw2Test(:,1),25,'red')
    %scatter(testLspace, hw2Test(:,2),25,'red') 
    plot(teFeats, teLabels, 'or')
    %plot(trainLspace, predLabels)
    plot(trainLspace, polyval(predLabels,trainLspace))
    title(currTitle)
    xlabel('Feature values')
    ylabel('Label values')
    
    %include MSE value
    mseString = {'MSE value = ', num2str(mseVal)};
    text(0,12,mseString)

    hold off;

end

