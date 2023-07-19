function [] = GenAll_Plots(data)
% GenAll_Plots - Generates comparison plots for multiple tests and
% components on one figure
%
%   The function creates a figure containing multiple subplots to compare the data
%   between two groups for different tests and components. Each subplot represents
%   a specific test-component combination and displays data points for each group
%   with error bars representing the mean and standard deviation. The x-axis is 
%   labeled with the names of the tests, and the y-axis is labeled with the 
%   measurement unit (percentage in this case).
%
%   Parameters:
%       data: A struct containing information about the two groups and their tests
%             and components. The data should be organized in a specific structure 
%             for this function to work correctly.
%
%   Note: This function assumes that the input data struct 'data' contains two 
%   groups, each with fields representing different tests. For each test, there
%   should be two components containing the data to be compared between the 
%   groups. Users can customize the input data structure to match their specific
%   needs and ensure that the data is appropriately organized for group 
%   comparisons and statistical analysis.
%
%   Author: Ella Hanzin 
%   Version: 1.0
%   Last Updated: 19-07-2023

%%
groupNames = fieldnames(data);
testNames = fieldnames(data.(groupNames{1}));
figure1 = figure;
set(figure1, 'color', [1 1 1]);
set(figure1, 'position', [150 50 1300 700]);
set(figure1, 'name', "All_Tests");
numTests = length(testNames);


for i=1:numTests
testName = testNames{i};
    componentNames = fieldnames(data.(groupNames{1}).(testName));
    group1_comp1_data = data.(groupNames{1}).(testName).(componentNames{1});
    group1_comp2_data = data.(groupNames{1}).(testName).(componentNames{2});
    group2_comp1_data = data.(groupNames{2}).(testName).(componentNames{1});
    group2_comp2_data = data.(groupNames{2}).(testName).(componentNames{2});
    
    subplot(2, numTests, i);
    hold on
    MyPlot(group1_comp1_data, group2_comp1_data, groupNames, testName, componentNames{1}, '%')
    
    subplot(2, numTests, i + numTests);
    hold on
    MyPlot(group1_comp2_data, group2_comp2_data, groupNames, testName, componentNames{2}, '%')
end

end
