function [] = MyPlot(group1Data, group2Data, Groups, variableName, component, ylabelText)
% MyPlot - Generates a comparison plot between two groups based on their data.
%
%   The function plots data points for each group as markers on the x-axis,
%   with the mean and standard deviation of each group's data displayed using 
%   error bars. The x-axis is labeled with the names of the groups, and the 
%   y-axis is labeled with the specified ylabelText (e.g., percentage).
%
%   Parameters:
%       group1Data- vector of group 1 for the specific variable and component.
%       group2Data- vector of group 2 for the specific variable and component.
%       Groups- cell array of strings representing the names of the two groups being compared.
%       variableName- string representing the variable being analyzed.
%       component- string representing the specific component within the variable being analyzed.
%       ylabelText- string representing the label for the y-axis in the plot.
%
%   Note: This function generates a simple comparison plot with error bars, 
%   comparing two groups (e.g., experimental vs. control) for a specific 
%   variable and component. The function also performs a permutation t-test 
%   between the two groups and displays the results as a subtitle below the plot.
%
%   Author: Ella Hanzin 
%   Version: 1.0
%   Last Updated: 19-07-2023

%% plotting the data points for each group with markers
plot(ones(size(group1Data, 1), 1), group1Data, 'o', 'MarkerSize', 10, 'MarkerEdgeColor', '#A2142F');
plot(2 .* ones(size(group2Data, 1), 1), group2Data, 'o', 'MarkerSize', 10, 'MarkerEdgeColor', '#0072BD');

%% setting the axis properties
xlim([0 3]);
xticks([1 2]);
ylim([0 1]);
xticklabels(Groups);
xlabel('Group');
ylabel(ylabelText);

% plotting the mean and standard deviation using error bars
e1 = errorbar(1.1, mean(group1Data), std(group1Data), 'o', 'MarkerSize', 10, 'LineWidth', 2, 'MarkerEdgeColor', '#A2142F');
e1.Color = '#A2142F';
e2 = errorbar(2.1, mean(group2Data), std(group2Data), 'o', 'MarkerSize', 10, 'LineWidth', 2, 'MarkerEdgeColor', '#0072BD');
e2.Color = '#0072BD';

% plot title
title1 = " " + variableName + " - " + component + " Comparison";
title(title1, 'FontSize', 14);

% performing a permutation t-test for the two groups and displaying the results as a subtitle
[p, observedDifference, effectSize] = permutationTest(group1Data, group2Data, 10000);
subtitleText2 = "p = " + num2str(p) + newline + "observed difference = " + num2str(observedDifference) + newline + "effect size = " + num2str(effectSize);
subtitle(subtitleText2, 'FontSize', 9);

end
