%Helper function used to plot result given specific information
function plotPrediction(numIter, trFeats, trLabels, teFeats, teLabels, mseVal, predLabels, method)

    %trFeats = trainData(

    currOrder = abs(1 - numIter);
    currTitle = strcat(num2str(currOrder), ' Order Linear Regression using ', method, ' prediction');
    
    %line space for linear regression prediction 
    trainLspace = linspace(min(trFeats), max(trFeats), size(trFeats,1));
    
    %Plot for the  Normal Method
    %using the results from fitLinRegNormal, form a polynomial to plot 
    figure(); clf;
    plot(trFeats,trLabels, 'og')
    hold on;
    plot(teFeats, teLabels, 'or')
    %plot(trFeats, predLabels)
    plot(trainLspace, polyval(predLabels,trainLspace))
    title(currTitle)
    xlabel('Feature values')
    ylabel('Label values')
    
    %include MSE value
    mseString = {'MSE value = ', num2str(mseVal)};
    text(0,12,mseString)

    hold off;

end

