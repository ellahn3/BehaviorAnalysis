function [] = plotGroupComparison(data, variableName, ylabelText)
% PLOTGROUPCOMPARISON - Plot group comparison for a specific variable.
%
%   plotGroupComparison(data, variableName, ylabelText)
%   This function plots group comparisons for a specific variable. It takes the data
%   stored in the 'data' structure, the name of the variable to be plotted, and the
%   corresponding ylabel texts for each component. The function creates a subplot for
%   each component within the variable and calls the 'MyPlot' function to generate
%   grouped bar plots with error bars, comparing the means of different groups.
%   The 'data' structure should be organized with nested fields for groups, variables,
%   and components.
%
%   Inputs:
%     data - A structure containing data for different groups and variables.
%     variableName - A string representing the name of the variable to be plotted.
%     ylabelText - A cell array containing ylabel texts for each component.
%
%   Note: This function is designed to be very general and can handle diverse data structures, making it
%   suitable for a wide range of data analysis tasks. Users can customize the input data structure to 
%   match their specific needs. Additionally, it is important to ensure that the data passed to this 
%   function is appropriate for group comparisons and statistical analysis.
%
%   Author: Ella Hanzin 
%   Version: 1.0
%   Last Updated: 19-07-2023

%% getting basic info about data
groups=fieldnames(data);% the names of the two groups from the data struct
names=fieldnames(data.(groups{1}).(variableName));% the names of components within the variable we want to plot
n=length(names);% Number of components
%% ploting
figure1 = figure;%  figure for the plot
set(figure1, 'color', [1 1 1]);
set(figure1, 'position', [300 50 700 500]); % ['start from right', 'start from bottom', 'finish left', 'finish top']
set(figure1, 'name', variableName);
for i=1:n
    component=names{i};% current component name
    group1_component1_data = data.(groups{1}).(variableName).(component);% Data for group1 and component1
    group2_component1_data = data.(groups{2}).(variableName).(component);% Data for group2 and component1
    subplot(1, n, i);
    hold on
    % using MyPlot function to plot and perform t-tests for the current component
    MyPlot(group1_component1_data,group2_component1_data,groups,variableName,component,ylabelText{i})
end

end
