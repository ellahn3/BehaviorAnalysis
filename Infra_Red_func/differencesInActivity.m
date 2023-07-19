function [] = differencesInActivity(dataT)
% differencesInActivity - Analyze differences in absolute activity levels between mice and plot accordingly.
%
%   This function takes dataT, which contains the normalized activity levels
%   for two groups (Ta and Tb). It calculates the mean absolute activity
%   levels for each mouse in both groups and plots them side by side.
%
%   Parameters:
%       dataT- cell array containing normalized activity data for the two groups.
%              dataT{1} is the first group, and dataT{2} is the second group.
%
%   Note: 'a.u.' stands for arbitrary units, as the data is assumed to be
%   normalized before being passed to this function.
%
%   Author: Shai Sabbah 
%   Editor: Ella Hanzin 
%   Version: 3.0
%   Last Updated: 01-07-2023

%% calculate the mean absolute activity levels for each mouse in both groups
for i = 1:2
    AdataMT{i} = mean(dataT{i}, 1);
end

%% figure and plot the mean absolute activity levels for each mouse
f7 = figure;
set(f7, 'color', [1 1 1]);
set(f7, 'position', [20 50 300 400]);
hold on;
plot([size(AdataMT{1}, 2) + 0.5, size(AdataMT{1}, 2) + 0.5], [0, 30], '--', 'Color', 'k');
plot(1:(size(AdataMT{1}, 2) + size(AdataMT{2}, 2)), [AdataMT{1}, AdataMT{2}], 'o', 'LineWidth', 2, 'Color', '#0072BD', 'MarkerSize', 10);

% labels and axis properties
ylabel('Mean absolute activity (a.u.)', 'FontSize', 18);
xlabel('Mouse #', 'FontSize', 18);
box off
ax = gca;
ax.FontSize = 16;
end
