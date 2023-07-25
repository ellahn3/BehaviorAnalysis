function [myanalyzedData] = analyzingData(data)
% ANALYZINGDATA - Analyze data and calculate relative ratios for each component.
%   
% myanalyzedData = analyzingData(data)
%   This function analyzes the data stored in the 'data' structure and calculates the
%   relative ratios for each component. It takes the data organized with nested fields
%   for groups, variables, and components. For each group, variable, and component, the
%   function computes the relative ratio by dividing the first component value by the
%   sum of the first and second component values. The results are stored in the
%   'myanalyzedData' structure with the same data structure as the input.%
%
%   Input:
%     data - A structure containing data for different groups, variables, and components.
%
%   Output:
%     myanalyzedData - A nested structure containing the relative ratios for each component.
%
%   Author: Ella Hanzin 
%   Version: 1.0
%   Last Updated: 24-07-2023

%%
groups = fieldnames(data); % Get the names of the two groups from the data struct
names = fieldnames(data.(groups{1})); % Get the names of components within the variable we want to plot
n = length(names); % Number of components

% Loop through each group, variable, and component to calculate the relative ratio
for j=1:length(groups)
    for i=1:n
        TestName=names{i};% current variableName name
        myCurentComponents=fieldnames( data.(groups{1}).(TestName));
        for k=1:length(myCurentComponents)
            names_vec=fieldnames(data.(groups{1}).(TestName).(myCurentComponents{k}));
            fist_vec= data.(groups{j}).(TestName).(myCurentComponents{k}).(names_vec{1});
            second_vec= data.(groups{j}).(TestName).(myCurentComponents{k}).(names_vec{2});
            t=fist_vec./(fist_vec+second_vec);
            myanalyzedData.(groups{j}).(TestName).(myCurentComponents{k})=t;
        end
    end
end


end