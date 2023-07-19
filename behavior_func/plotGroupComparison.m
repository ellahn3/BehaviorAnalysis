function [] = plotGroupComparison(data, group1, group2, variableName, component1, component2, ylabelText)
% PLOTGROUPCOMPARISON Generates a comparison plot between two groups based on their data.
%
%   The function plots data points for each group as markers on the x-axis, with the mean and standard 
%   deviation of each group's data displayed using error bars. The x-axis is labeled with the names of 
%   the two groups. Additionally, the function performs a permutation t-test to compare the two groups' 
%   data for 'component1' and 'component2', and the results of the t-tests (p-value, observed difference, 
%   and effect size) are displayed as subtitles below each subplot.
%
%   Parameters:
%       data: the data struct containing information about the two groups and their variables.
%       group1 and group2: strings representing the names of the two groups to compare.
%       variableName: string representing the variable to analyze in the data struct.
%       component1 and component2: strings representing the components within the variable to compare.
%       ylabelText: string representing the label for the y-axis in the plot.
%
%   Note: This function is designed to be very general and can handle diverse data structures, making it
%   suitable for a wide range of data analysis tasks.
%


% extracting data for the specified groups and variables
group1_component1_data = data.(group1).(variableName).(component1);
group1_component2_data = data.(group1).(variableName).(component2);
group2_component1_data = data.(group2).(variableName).(component1);
group2_component2_data = data.(group2).(variableName).(component2);

figure1 = figure;%  figure for the plot
set(figure1, 'color', [1 1 1]);
set(figure1, 'position', [300 50 700 500]); % ['start from right', 'start from bottom', 'finish left', 'finish top']
set(figure1, 'name', variableName);

subplot(1, 2, 1)%first subplot (comparison of the first component)
hold on
plot(ones(size(group1_component1_data ,1), 1), group1_component1_data, 'o', 'MarkerSize', 10, 'MarkerEdgeColor', '#A2142F');
plot(2 .* ones(size(group2_component1_data, 1), 1), group2_component1_data, 'o', 'MarkerSize', 10, 'MarkerEdgeColor', '#0072BD');
xlim([0 3]);
xticks([1 2])
ylim([0 1]);
xticklabels({group1, group2})
xlabel('Group')
ylabel(ylabelText)
errorbar1 = errorbar(1.1, mean(group1_component1_data), std(group1_component1_data), 'o', 'MarkerSize', 10, 'LineWidth', 2, 'MarkerEdgeColor', '#A2142F');
errorbar1.Color = '#A2142F';
errorbar2 = errorbar(2.1, mean(group2_component1_data), std(group2_component1_data), 'o', 'MarkerSize', 10, 'LineWidth', 2, 'MarkerEdgeColor', '#0072BD');
errorbar2.Color = '#0072BD';
title1 = " " + variableName + " - " + component1 + " Comparison";
title(title1, 'FontSize', 14)

% performing a permutation t-test for the first component
[p1, observedDifference1, effectSize1] = permutationTest(group1_component1_data, group2_component1_data, 10000);

subtitleText1 = "p= " + num2str(p1) + newline + "observed difference= " + num2str(observedDifference1) + newline + "effect size= " + num2str(effectSize1);
subtitle(subtitleText1, 'FontSize', 9)


subplot(1, 2, 2)%second subplot (comparison of the second component)
hold on
plot(ones(size(group1_component2_data ,1), 1), group1_component2_data, 'o', 'MarkerSize', 10, 'MarkerEdgeColor', '#A2142F');
plot(2 .* ones(size(group2_component2_data, 1), 1), group2_component2_data, 'o', 'MarkerSize', 10, 'MarkerEdgeColor', '#0072BD');
xlim([0 3]);
xticks([1 2])
ylim([0 1]);
xticklabels({group1, group2})
xlabel('Group')
ylabel(ylabelText)
errorbar1 = errorbar(1.1, mean(group1_component2_data), std(group1_component2_data), 'o', 'MarkerSize', 10, 'LineWidth', 2, 'MarkerEdgeColor', '#A2142F');
errorbar1.Color = '#A2142F';
errorbar2 = errorbar(2.1, mean(group2_component2_data), std(group2_component2_data), 'o', 'MarkerSize', 10, 'LineWidth', 2, 'MarkerEdgeColor', '#0072BD');
errorbar2.Color = '#0072BD';
title2 = " " + variableName + " - " + component2 + " Comparison";
title(title2, 'FontSize', 14)

% performing a permutation t-test for the second component
[p2, observedDifference2, effectSize2] = permutationTest(group1_component2_data, group2_component2_data, 10000);

subtitleText2 = "p= " + num2str(p2) + newline + "observed difference= " + num2str(observedDifference2) + newline + "effect size= " + num2str(effectSize2);
subtitle(subtitleText2, 'FontSize', 9)
end
