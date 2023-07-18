function [] = differencesInActivity(dataT)
%analyze differences in absolute activity levels between mice
%   getting dataT an plotting accordingly

for i=1:2
    AdataMT{i}=mean(dataT{i},1);
end
f7=figure;
set(f7,'color', [1 1 1]);
set(f7,'position',[20 50 300 400]);
hold on;
plot([size(AdataMT{1},2)+0.5 size(AdataMT{1},2)+0.5],[0 30],'--','Color','k');
plot(1:(size(AdataMT{1},2)+size(AdataMT{2},2)),[AdataMT{1},AdataMT{2}],'o','LineWidth',2,'Color','#0072BD','MarkerSize',10);
ylabel('Mean absolute activity (a.u.)','FontSize',18);
xlabel('Mouse #','FontSize',18);
box off
ax = gca;
ax.FontSize=16;
end