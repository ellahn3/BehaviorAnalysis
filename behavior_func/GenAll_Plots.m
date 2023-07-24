function [] = GenAll_Plots(data,yaxlab)
% GENALL_PLOTS - Generate all plots for data comparison.
%   This function generates all plots for data comparison. It takes the data stored in
%   the 'data' structure and the ylabel texts stored in the 'yaxlab' structure for each
%   test and component. The function creates grouped bar plots with error bars to
%   compare the means of different groups for each test and component combination.
%   The 'data' structure should be organized with nested fields for groups, tests, and
%   components, while the 'yaxlab' structure should provide ylabel texts corresponding
%   to each test and component being compared.
%
%   GenAll_Plots(data, yaxlab)
%   Inputs:
%     data - A structure containing data for different tests, components, and groups.
%     yaxlab - A structure containing ylabel texts for different tests and components.
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
    MyPlot(group1_comp1_data, group2_comp1_data, groupNames, testName, componentNames{1}, yaxlab.(testName){1})

    subplot(2, numTests, i + numTests);
    hold on
    MyPlot(group1_comp2_data, group2_comp2_data, groupNames, testName, componentNames{2}, yaxlab.(testName){2})
end

end
