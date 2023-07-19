function [] = PlotTaVSTbn48(data,Ta,Tb,beginT24)
% PlotTaVSTbn48 - Plots mean Ta and Tb for each light cycle against 24-hour periods.
%
%   The function takes data from the input table and performs preprocessing to
%   select relevant columns and remove preceeding measurements before starting
%   the cycle from 8 am. It then normalizes activity levels for each cycle separately.
%   The function plots mean Ta and Tb for each light cycle with each row corresponding
%   to 24 hours. It prepares the light cycle according to the specified Ta and Tb values.
%   Parameters:
%       data- table containing the data to be plotted.
%       Ta- string representing the Ta light cycle.
%       Tb- string representing the Tb light cycle.
%       beginT24- The number of days with baseline T24.
%
%
%   Note: This function generates two separate plots, one for Ta and the other
%   for Tb, with each row representing 48-hour periods. The function also
%   includes light cycle preparation, smoothing, and data reshaping for plotting.
%
%   See also:
%       readtable, reshape, smoothdata, max, find, contains, area, bar
%
%   Author: Ella Hanzin
%   Version: 1.0
%   Last Updated: 09-Jul-2023

%% prep for data analysis
%take from file the relevent columns 
dataM=table2array(data(:,2:16));%the data
datetimeM=table2array(data(:,1));%the time recordings

%set starting time from when to record
startTime=find(contains(string(datetimeM),'08:00'));
dataM(1:startTime(1)-1,:)=[];         % remove all preceeding measurements in order to start the cycle from 8am
datetimeM(1:startTime(1)-1,:)=[];         % remove all preceeding measurements in order to start the cycle from 8am


%%%%%%%%%%%%%  Change according to the relevant light cycles %%%%%%%%%%%%%%
%when you bave a base line of days that you had T24
%beginT24=0;                 % number of days with baseline T24 

dataMTa=dataM(:,[6,9,10]);       % individual mice Ta
dataMTb=dataM(:,[2,3,5]);       % individual mice Tb

dataT={dataMTa,dataMTb};


%% plot mean Tb and Ta with 48 hours per row
%plots that show the movment in each cabinet(mean of each cabinet activity)
Lcycle={Ta,Tb}; %Ta='CT13';Tb='CT24';
%% Normalize activity levels for each cycle seperatly
n48=floor(size(dataM,1)/2880); % number of 48-h periods (number of raws in actogram)

% calculating mean acativity
for i=1:2
    meanT{i}=mean(dataT{i},2);
    meanT{i}=meanT{i}(1:floor(n48*2880));  % 2880 is the number of minutes in 48 hours
    meanTr{i}=reshape(meanT{i},2880,[]);  % for 48-h periods
end
%%
for i=1:2
    T=Lcycle{i};
    switch T
        case 'T7'
            numMin=210;
        case  'T6'
            numMin=180;
        case 'T9'
            numMin=270;
        case 'T24'
            numMin=720;
        case 'CT13'
            numMin=720;
        case 'CT16'
            numMin=720;
        case 'CT18'
            numMin=720;
        case 'CT20'
            numMin=720;
    end
    cycle{i}=[];
%     for j=1:beginT24(i)       % T24 for the first 3 days
%         cycle{i}=[cycle{i},zeros(1,720),ones(1,720)];
%     end
%     for j=1:900     % cycle for rest of the days
%         cycle{i}=[cycle{i},zeros(1,numMin),ones(1,numMin)];
%     end
    for j=1:beginT24(i)       % T24 for the first 'beginT24' days
        cycle{i}=[cycle{i},zeros(1,720),ones(1,720)];
    end
    switch T
        case 'T24'
            for j=1:900     % Ta for rest of the days
                cycle{i}=[cycle{i},zeros(1,numMin),ones(1,numMin)];
            end
        case 'CT13'
            for j=1:900     % Ta for rest of the days
                cycle{i}=[cycle{i},zeros(1,60),ones(1,120),zeros(1,540),ones(1,numMin)];    % for non-inverse cycle
            end 
        case 'CT16'
            for j=1:900     % Ta for rest of the days
                cycle{i}=[cycle{i},zeros(1,240),ones(1,120),zeros(1,360),ones(1,numMin)];    % for non-inverse cycle
            end 
        case 'CT18'
            for j=1:900     % Ta for rest of the days
                cycle{i}=[cycle{i},zeros(1,360),ones(1,120),zeros(1,240),ones(1,numMin)];   % for non-inverse cycle
            end 
        case 'CT20'
            for j=1:900     % Ta for rest of the days
                cycle{i}=[cycle{i},zeros(1,480),ones(1,120),zeros(1,120),ones(1,numMin)];   % for non-inverse cycle
            end
        otherwise
            for j=1:900     % Ta for rest of the days
                cycle{i}=[cycle{i},zeros(1,numMin),ones(1,numMin)];
            end
    end
    cycle{i}(floor(n48*2880)+1:end)=[];
    cycle2{i}=reshape(cycle{i},2880,[]);
    
    %smoothMeanTr{i}=smoothdata(meanTr{i},'movmedian',60);
    smoothMeanTr{i}=meanTr{i};          %%%%%%%%%% NO SMOOTHING %%%%%%%%%%
    smoothMeanTr{i}=reshape(smoothMeanTr{i},2880,[]);    % for 48-h periods
    
    circdata=smoothMeanTr{i}';
    numreps = size(circdata,1);
    axPos = fliplr(linspace(.04, .95, numreps));
    rowh = axPos(1) - axPos(2) - .005;
    Ymax = max(max(circdata));
    %figure 6 and 7: T24 cycle for each closet
    f4=figure(i+10);
    set(f4, 'color', [1 1 1]);
    %set(f4,'position',[50 0 380 750]);
    set(gca,'XColor', 'none','YColor','none');
    hold on;
    cycle2{i}=cycle2{i}.*Ymax.*0.7;
    for nn=1:numreps
        ax=axes('Position',[.05 axPos(nn) .90 rowh],'Color','none',...
            'XTick',[],'YTick',[]); axis off; hold on;
        if contains(T,'CT13') && nn>=beginT24(i)
            area(cycle2{i}(:,nn),'FaceColor','y','LineStyle','none');%yellow ereas
            area(cycle2{i}(1:numMin,nn),'FaceColor','c','LineStyle','none');%blue ereas
        else
            area(cycle2{i}(:,nn),'FaceColor','y','LineStyle','none');%yellow ereas
        end
        axis(ax,'tight')
    end
    
    for nn=1:numreps
        axes('Position',[.05 axPos(nn) .90 rowh],'Color','none',...
            'XTick',[],'YTick',[]); axis off; hold on;
        bar(circdata(nn,:),'k')
        set(gca,'YLim',[0 Ymax*0.7]);
    end
end


end