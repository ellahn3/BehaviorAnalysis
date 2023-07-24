function [] = PlotTaVSTbn24(data,Ta,Tb,beginT24,colors)
% PlotTaVSTbn24 - Plots mean Ta and Tb for each light cycle against 24-hour periods.
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
%   for Tb, with each row representing 24-hour periods. The function also
%   includes light cycle preparation, smoothing, and data reshaping for plotting.
%
%   See also:
%       readtable, reshape, smoothdata, max, find, contains, area, bar
%
%   Author: Ella Hanzin
%   Version: 1.0
%   Last Updated: 09-Jul-2023

%% prep
%take from file the relevent columns
dataM=table2array(data(:,2:16));%the data
datetimeM=table2array(data(:,1));%the time recordings

%set starting time from when to record
startTime=find(contains(string(datetimeM),'08:00'));
dataM(1:startTime(1)-1,:)=[];         % remove all preceeding measurements in order to start the cycle from 8am
datetimeM(1:startTime(1)-1,:)=[];         % remove all preceeding measurements in order to start the cycle from 8am

%%%%%%%%%%%%%  Change according to the relevant light cycles %%%%%%%%%%%%%%
%beginT24=0;                 % number of days with baseline T24 
dataMTa=dataM(:,[6,9,10]);       % individual mice Ta
dataMTb=dataM(:,[2,3,5]);       % individual mice Ta
%take from file the relevent columns
dataT={dataMTa,dataMTb};

%% Normalize activity levels for each cycle seperatly
n24=floor(size(dataM,1)/1440); % number of 24-h periods (number of raws in actogram)
for i=1:2
    maxdataT{i}=max(dataT{i},[],1);
    dataT{i}=dataT{i}./maxdataT{i};        % normalize maxdataMTa to max
    dataT{i}=dataT{i}(1:floor(n24*1440),:);  % 1440 is the number of minutes in 24 hours
end

%% plot mean Ta and Tb with each raw corresponding to 24 hours

Lcycle={Ta,Tb};
for i=1:2
    T=Lcycle{i};
    % prepare light cycle
    meanT{i}=mean(dataT{i},2);
    %smoothMeanT{i}=smoothdata(meanT{i},'movmedian',60);
    smoothMeanT{i}=meanT{i};        %%%%% NO SMOOTHING %%%%%%%%%%%
    smoothMeanT{i}=reshape(smoothMeanT{i},1440,[]);    % for 24-h periods
    
    if contains(T,'T7')
        numMin=210;
    elseif contains(T,'T6')
        numMin=180;
    elseif contains(T,'T9')
        numMin=270;
    elseif contains(T,'T24')
        numMin=720;
    elseif contains(T,'CT13')
        numMin=720;
    elseif contains(T,'CT16')
        numMin=720;
    elseif contains(T,'CT18')
        numMin=720;
    elseif contains(T,'CT20')
        numMin=720;
    end
    cycle{i}=[];

    % for non-inverse light cycle
    for j=1:beginT24(i)       % T24 for the first 'beginT24' days
        cycle{i}=[cycle{i},zeros(1,720),ones(1,720)];
    end
    
    if contains(T,'T24')
        for j=1:900     % Ta for rest of the days
            cycle{i}=[cycle{i},zeros(1,numMin),ones(1,numMin)];
        end

    
    elseif contains(T,'CT13')
     for j=1:900     % Ta for rest of the days
        %cycle{i}=[cycle{i},ones(1,numMin),zeros(1,60),ones(1,120),zeros(1,540)];
        cycle{i}=[cycle{i},zeros(1,60),ones(1,120),zeros(1,540),ones(1,numMin)];    % for non-inverse cycle
     end   
     
     elseif contains(T,'CT16')
     for j=1:900     % Ta for rest of the days
        %cycle{i}=[cycle{i},ones(1,numMin),zeros(1,60),ones(1,120),zeros(1,540)];
        cycle{i}=[cycle{i},zeros(1,240),ones(1,120),zeros(1,360),ones(1,numMin)];    % for non-inverse cycle
     end 
        
     elseif contains(T,'CT18')
     for j=1:900     % Ta for rest of the days
        %cycle{i}=[cycle{i},ones(1,numMin),zeros(1,360),ones(1,120),zeros(1,240)];
        cycle{i}=[cycle{i},zeros(1,360),ones(1,120),zeros(1,240),ones(1,numMin)];   % for non-inverse cycle
     end 
     
     elseif contains(T,'CT20')
     for j=1:900     % Ta for rest of the days
        %cycle{i}=[cycle{i},ones(1,numMin),zeros(1,480),ones(1,120),zeros(1,120)];
        cycle{i}=[cycle{i},zeros(1,480),ones(1,120),zeros(1,120),ones(1,numMin)];   % for non-inverse cycle
     end 
        
    else  
        % for non-inverse light cycle 
        for j=1:900     % Ta for rest of the days
        cycle{i}=[cycle{i},zeros(1,numMin),ones(1,numMin)];
        end
        
    end
    
    cycle{i}(floor(n24*1440)+1:end)=[];
    cycle2{i}=reshape(cycle{i},1440,[]);
    
    circdata{i}=smoothMeanT{i}';
    numreps = size(circdata{i},1);
    axPos = fliplr(linspace(.04, .95, numreps));
    rowh = axPos(1) - axPos(2) - .005;
    Ymax = max(max(circdata{i}));
    
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
            area(cycle2{i}(:,nn),'FaceColor',colors(1),'LineStyle','none');%yellow ereas
            area(cycle2{i}(1:numMin,nn),'FaceColor',colors(2),'LineStyle','none');%blue ereas
        else
            area(cycle2{i}(:,nn),'FaceColor',colors(1),'LineStyle','none');%yellow ereas
        end
        axis(ax,'tight')
    end
    
    for nn=1:numreps
        axes('Position',[.05 axPos(nn) .90 rowh],'Color','none',...
            'XTick',[],'YTick',[]); axis off; hold on;
        bar(circdata{i}(nn,:),'k')
        set(gca,'YLim',[0 Ymax*0.65]);
    end
end
end






