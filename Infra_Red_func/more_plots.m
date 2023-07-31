function [] = more_plots(data, Ta, Tb)
% MORE_PLOTS - Generate various plots to analyze and compare data.
%   
% more_plots(data, Ta, Tb)
%   This function generates various plots to analyze and compare the activity data.
%   It performs preprocessing on the data, calculates mean activity for each mouse,
%   normalizes activity levels, and estimates and plots variation in activity over time.
%   The generated plots provide insights into the relative activity levels between mice
%   and the comparison of activity between cages in the closet.
%
%   Inputs:
%     data - A table containing the activity data and time recordings.
%     Ta - A string representing the name of cage type A.
%     Tb - A string representing the name of cage type B.
%
%   Author: Ella Hanzin 
%   Version: 1.0
%   Last Updated: JUNE 2023


%% Preprocessing
% Extract relevant columns from the data table
dataM = table2array(data(:, 2:16)); % The activity data
datetimeM = table2array(data(:, 1)); % The time recordings

% Set the starting time from when to record (assuming 8:00 AM)
startTime = find(contains(string(datetimeM), '08:00'));
dataM(1:startTime(1) - 1, :) = []; % Remove all preceding measurements to start the cycle from 8 AM
datetimeM(1:startTime(1) - 1, :) = []; % Remove all preceding measurements to start the cycle from 8 AM

% Configuration for the relevant light cycles (Change according to the data)
beginT24 = 0; % Number of days with baseline T24
dataMTa = dataM(:, [6, 9, 10]); % Individual mice activity for cage type A
dataMTb = dataM(:, [2, 3, 5]); % Individual mice activity for cage type B
dataT = {dataMTa, dataMTb}; % Grouping data for each cage type

%% Analyze differences in absolute activity levels between mice
% Create figure 1: A figure that compares the mean activity for each mouse
for i = 1:2
    AdataMT{i} = mean(dataT{i}, 1);
end

% Plot figure 1
f7 = figure('Name', 'more_plots');
set(f7, 'color', [1 1 1]);
set(f7, 'position', [300 50 1050 500]); % ['start from right', 'start from bottom', 'finish left', 'finish top']

subplot(1, 2, 1)
hold on;
plot(1:(size(AdataMT{1}, 2)), AdataMT{1}, 'o', 'LineWidth', 2, 'Color', '#A2142F', 'MarkerSize', 10);
plot((size(AdataMT{1}, 2)) + 1:(size(AdataMT{1}, 2)) + size(AdataMT{2}, 2), AdataMT{2}, 'o', 'LineWidth', 2, 'Color', '#0072BD', 'MarkerSize', 10);
ylabel('Mean absolute activity (a.u.)', 'FontSize', 14);
xlabel('Mouse #', 'FontSize', 14);
title('Movement for each cage', 'FontSize', 18);
legend(Ta, Tb)
box off

%% Normalize activity levels for each cycle separately
n48 = floor(size(dataM, 1) / 2880); % Number of 48-h periods (number of rows in actogram)
n24 = floor(size(dataM, 1) / 1440); % Number of 24-h periods (number of rows in actogram)

for i = 1:2
    maxdataT{i} = max(dataT{i}, [], 1);
    dataT{i} = dataT{i} ./ maxdataT{i}; % Normalize maxdataMTa to max
    dataT{i} = dataT{i}(1:floor(n24 * 1440), :); % 1440 is the number of minutes in 24 hours
end

%% Estimate and plot variation in activity over time
for i = 1:2
    for j = 1:size(dataT{i}, 2)
        Ts{j, i} = reshape(dataT{i}(:, j), 1440, []); % Reshape data for 24-h periods
        AveTs{i}(j, :) = mean(Ts{j, i}, 1); % Average activity per day over the measurement duration
    end
    meanAveTs{i} = mean(AveTs{i}, 1);
    seAveTs{i} = std(AveTs{i}, 1) ./ sqrt(j);
end

% Plot figure 2: Comparing activity between cages in the closet
subplot(1, 2, 2)
hold on;
shadedErrorBar(1:size(meanAveTs{1}, 2), meanAveTs{1}, seAveTs{1}, 'r');
shadedErrorBar(1:size(meanAveTs{2}, 2), meanAveTs{2}, seAveTs{2}, 'b');
plot(1:size(meanAveTs{1}, 2), meanAveTs{1}, '-', 'LineWidth', 2, 'Color', '#A2142F'); % Ta
plot(1:size(meanAveTs{2}, 2), meanAveTs{2}, '-', 'LineWidth', 2, 'Color', '#0072BD'); % Tb
ax = gca;
ax.XTick = (0:10:size(meanAveTs{1}, 2));
ax.FontSize = 10;
ylabel('Activity (a.u.)', 'FontSize', 14);
xlabel('Time (days)', 'FontSize', 14);
title('Comparing movement between cages in closet', 'FontSize', 18);
legend('shadedErrorBar CT13','mean CT13','shadedErrorBar T24','mean T24')
box off

end
