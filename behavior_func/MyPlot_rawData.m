function [] = MyPlot_rawData(DataGroup1, DataGroup2, Groups, TestType, component, ylabelText)
% MYPLOT_RAWDATA - Create a grouped bar plot with error bars for two data groups.
%
%   MyPlot_rawData(DataGroup1, DataGroup2, Groups, TestType, component, ylabelText)
%   This function creates a grouped bar plot to compare the means of two data groups
%   along with their standard deviation/error bars. It takes the data for each group,
%   the group names, and additional information such as the type of comparison and
%   component being compared. The function generates a grouped bar plot with error
%   bars for each group, allowing visual comparison of the mean values between the two
%   groups.
%
%   Inputs:
%     DataGroup1 - A structure representing the data for the first group.
%     DataGroup2 - A structure representing the data for the second group.
%     Groups - A cell array containing the names of the two groups being compared.
%     TestType - A string representing the type of comparison being made.
%     component - A string representing the component being compared.
%     ylabelText - A string representing the label for the y-axis.
%
%   Author: Ella Hanzin 
%   Version: 1.0
%   Last Updated: 19-07-2023

%% plotting the data points for each group with markers
vecName=fieldnames(DataGroup1);
% for i=1:length(vecName)
%     v1=DataGroup1.(vecName{1});%water consum
%     v2=DataGroup1.(vecName{2});%suger consum
% 
% 
% end
v1=[mean(DataGroup1.(vecName{1})),mean(DataGroup2.(vecName{2}))];
v2=[mean(DataGroup1.(vecName{2})),mean(DataGroup2.(vecName{2}))];
model_series=[v1;v2];
model_error = [1 3;2 4]; 
% bar(y)
b = bar(model_series, 'grouped');
hold on
% Calculate the number of groups and number of bars in each group
[ngroups,nbars] = size(model_series);
% Get the x coordinate of the bars
x = nan(nbars, ngroups);
for i = 1:nbars
    x(i,:) = b(i).XEndPoints;
end
% Plot the errorbars
errorbar(x',model_series,model_error,'k','linestyle','none');

%% setting the axis properties
%xlim([0 3]);
xticks([1 2]);
xticklabels(Groups);
xlabel('Group');
ylabel(ylabelText);
legend(vecName)

% % plotting the mean and standard deviation using error bars
% e1 = errorbar(1.1, mean(group1Data), std(group1Data), 'o', 'MarkerSize', 10, 'LineWidth', 2, 'MarkerEdgeColor', '#A2142F');
% e1.Color = '#A2142F';
% e2 = errorbar(2.1, mean(group2Data), std(group2Data), 'o', 'MarkerSize', 10, 'LineWidth', 2, 'MarkerEdgeColor', '#0072BD');
% e2.Color = '#0072BD';

% plot title
title1 = " " + TestType + " - " + component + " Comparison";
title(title1, 'FontSize', 14);

% performing a permutation t-test for the two groups and displaying the results as a subtitle
% [p, observedDifference, effectSize] = permutationTest(group1Data, group2Data, 10000);
% subtitleText2 = "p = " + num2str(p) + newline + "observed difference = " + num2str(observedDifference) + newline + "effect size = " + num2str(effectSize);
% subtitle(subtitleText2, 'FontSize', 9);

end
