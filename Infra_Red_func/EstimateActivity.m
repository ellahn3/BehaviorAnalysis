function [] = EstimateActivity(dataT)
%Estimate and plot variation in activity over time
%   getting dataT an plotting accordingly

for i=1:2
    for j=1:size(dataT{i},2)
        Ts{j,i}=reshape(dataT{i}(:,j),1440,[]);    % for 24-h periods
        AveTs{i}(j,:)=mean(Ts{j,i},1);    % average activity per day over the measurement duration
    end
    meanAveTs{i}=mean(AveTs{i},1);
    seAveTs{i}=std(AveTs{i},1)./sqrt(j);
end

f6=figure;
set(f6,'color', [1 1 1]);
set(f6,'position',[20 50 200 300]);
hold on;
shadedErrorBar(1:size(meanAveTs{1},2),meanAveTs{1},seAveTs{1},'r');
shadedErrorBar(1:size(meanAveTs{2},2),meanAveTs{2},seAveTs{2},'b');
plot(1:size(meanAveTs{1},2),meanAveTs{1},'-','LineWidth',2,'Color','r');
plot(1:size(meanAveTs{2},2),meanAveTs{2},'-','LineWidth',2,'Color','b');
ax=gca;
ax.XTick=(0:10:size(meanAveTs{1},2));
ax.FontSize=10;
ylabel('Activity (a.u.)','FontSize',18);
xlabel('Time (days)','FontSize',18);
box off
end