function [] = plotGroupComparison_rawData(data, TestType, ylabelText)
% PLOTGROUPCOMPARISON_RAWDATA - Plot group comparison for raw data.
%   
% plotGroupComparison_rawData(data, TestType, ylabelText)
%   This function plots group comparisons for raw data based on a specific test type.
%   It takes the raw data stored in the 'data' structure, the type of test to be
%   plotted, and the corresponding ylabel texts for each component. The function
%   creates a subplot for each component within the test and calls the 'MyPlot_rawData'
%   function to generate grouped bar plots with error bars, comparing the means of
%   different groups. The 'data' structure should be organized with nested fields for
%   groups, tests, and components.
%
%   Inputs:
%     data - A structure containing raw data for different groups and tests.
%     TestType - A string representing the type of test to be plotted.
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
components=fieldnames(data.(groups{1}).(TestType));% the names of components within the variable we want to plot
n=length(components);% Number of components
%% ploting
figure1 = figure;%  figure for the plot
set(figure1, 'color', [1 1 1]);
set(figure1, 'position', [300 50 700 500]); % ['start from right', 'start from bottom', 'finish left', 'finish top']
set(figure1, 'name', TestType);
for i=1:n%over right and left
    myCurentComponents_g1=data.(groups{1}).(TestType).(components{i});
    myCurentComponents_g2=data.(groups{2}).(TestType).(components{i});
    subplot(1, n, i);
    hold on
    MyPlot_rawData(myCurentComponents_g1,myCurentComponents_g2,groups,TestType,components{i},ylabelText{i})
end

end
