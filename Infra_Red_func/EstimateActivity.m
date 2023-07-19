function [] = EstimateActivity(dataT)
% EstimateActivity - Estimate and plot variation in activity over time.
%
%   This function takes dataT, which contains the normalized activity levels
%   for two groups (e.g., Ta and Tb) and estimates the variation in activity
%   over time for each group. It then plots the average activity per day
%   over the measurement duration along with the standard error of the mean.
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
%   Version: 4.0
%   Last Updated: 02-07-2023

%% initialize variables to store data for each group
for i = 1:2
    for j = 1:size(dataT{i}, 2)
        Ts{j, i} = reshape(dataT{i}(:, j), 1440, []);% reshape data for 24-hour periods
        AveTs{i}(j, :) = mean(Ts{j, i}, 1);        % the average activity per day over the measurement duration
    end
    % mean and standard error of the mean for each group
    meanAveTs{i} = mean(AveTs{i}, 1);
    seAveTs{i} = std(AveTs{i}, 1) ./ sqrt(j);
end

%% create the figure and plot the estimated variation in activity over time
f6 = figure;
set(f6, 'color', [1 1 1]);
set(f6, 'position', [20 50 200 300]);
hold on;
shadedErrorBar(1:size(meanAveTs{1}, 2), meanAveTs{1}, seAveTs{1}, 'r');% function to plot mean and standard error of the mean with shaded area
shadedErrorBar(1:size(meanAveTs{2}, 2), meanAveTs{2}, seAveTs{2}, 'b');% function to plot mean and standard error of the mean with shaded area
%% plot the mean as solid lines for better visibility
plot(1:size(meanAveTs{1}, 2), meanAveTs{1}, '-', 'LineWidth', 2, 'Color', '#A2142F');
plot(1:size(meanAveTs{2}, 2), meanAveTs{2}, '-', 'LineWidth', 2, 'Color', '#0072BD');

% labels and axis properties
ax = gca;
ax.XTick = (0:10:size(meanAveTs{1}, 2));
ax.FontSize = 10;
ylabel('Activity (a.u.)', 'FontSize', 18);
xlabel('Time (days)', 'FontSize', 18);
box off
end
