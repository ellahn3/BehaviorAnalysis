function [] = plotGroupComparison(data, variableName, ylabelText)
% PLOTGROUPCOMPARISON Generates a comparison plot between two groups based on their data.
%
%   The function plots data points for each group as markers on the x-axis, with the mean and standard 
%   deviation of each group's data displayed using error bars. The x-axis is labeled with the names of 
%   the two groups. Additionally, the function performs a permutation t-test to compare the two groups' 
%   data for 'component1' and 'component2', and the results of the t-tests (p-value, observed difference, 
%   and effect size) are displayed as subtitles below each subplot.
%
%   Parameters:
%       data- struct containing information about the two groups and their variables.
%       variableName- string representing the variable to analyze in the data struct.
%       ylabelText-string representing the label for the y-axis in the plot.
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
    MyPlot(group1_component1_data,group2_component1_data,groups,variableName,component,ylabelText)
end

end
