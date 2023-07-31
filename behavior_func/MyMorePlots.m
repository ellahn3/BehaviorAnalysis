function [] = MyMorePlots(meanData,TestType, ylabelText)
% MYMOREPLOTS - Generate comparison plots for mean data.
%
%   MyMorePlots(meanData, TestType, ylabelText)
%   This function generates comparison plots for the mean data stored in the 'meanData' structure.
%   It takes the mean data organized with nested fields for groups, variables, and components.
%   For each component, the function plots a comparison graph for the mean data between two groups.
%   The generated plots provide insights into the differences in mean data between the groups.
%
%   Inputs:
%     meanData - A structure containing mean data for different groups, variables, and components.
%     TestType - A string representing the name of the test type.
%     ylabelText - A cell array of strings representing the y-axis labels for each component.
%
%   Author: Ella Hanzin
%   Version: 2.0
%   Last Updated: 30-07-2023


groups=fieldnames(meanData);% the names of the two groups from the data struct
components=fieldnames(meanData.(groups{1}).(TestType));% the names of components within the variable we want to plot
n=length(components);% Number of components

% Plot figure 1
f7 = figure('Name', 'more_plots');
set(f7, 'color', [1 1 1]);
set(f7, 'position', [300 50 1050 500]); % ['start from right', 'start from bottom', 'finish left', 'finish top']
for i=1:n
    AdataMT={meanData.(groups{1}).(TestType).(components{i});meanData.(groups{2}).(TestType).(components{i})};
    subplot(1, 2, i)     % a subplot for the current component
    hold on;
    % Plot mean data for the first group with red markers
    plot(1:(size(AdataMT{1}, 2)), AdataMT{1}, 'o', 'LineWidth', 2, 'Color', '#A2142F', 'MarkerSize', 10);

    % Plot mean data for the second group with blue markers
    plot((size(AdataMT{1}, 2)) + 1:(size(AdataMT{1}, 2)) + size(AdataMT{2}, 2), AdataMT{2}, 'o', 'LineWidth', 2, 'Color', '#0072BD', 'MarkerSize', 10);
    % Set the x-axis label and y-axis label for the current component
    ylabel(ylabelText{i}, 'FontSize', 14);
    xlabel('Mouse #', 'FontSize', 14);

    % Create a title for the current component based on its name
    t=join([char(components{i})]);
    title(t, 'FontSize', 18);
    
    legend(groups)
    box off
end



end