function [] = All_Plots(data)


f1=figure;
set(f1, 'color', [1 1 1]);
set(f1,'position',[150 50 1300 700]);
set(f1,'name',"All_Tests");
%% Suger pref
subplot(2, 4, 1);
hold on
plot(ones(size(data.CT13.SP.Right(1,:) ,1),1),data.CT13.SP.Right(1,:),'o','MarkerSize',10,'MarkerEdgeColor','#A2142F');
plot(2.*ones(size(data.T24.SP.Right(1,:),1),1),data.T24.SP.Right(1,:),'o','MarkerSize',10,'MarkerEdgeColor','#0072BD');
xlim([0 3]);
xticks([1 2])
ylim([0 1]);
xticklabels({'CT13','T24'})
xlabel('cycle')
ylabel('consumed/total consumed(%) ')
e1=errorbar(1.1,mean(data.CT13.SP.Right(1,:)),std(data.CT13.SP.Right(1,:)),'o','MarkerSize',10,'LineWidth',2,'MarkerEdgeColor','#A2142F');
e1.Color='#A2142F';
e2=errorbar(2.1,mean(data.T24.SP.Right(1,:)),std(data.T24.SP.Right(1,:)),'o','MarkerSize',10,'LineWidth',2,'MarkerEdgeColor','#0072BD');
e2.Color='#0072BD';
title('Right side sugar preference test','FontSize',14)

subplot(2, 4, 5);
hold on
plot(ones(size(data.CT13.SP.Left(1,:) ,1),1),data.CT13.SP.Left(1,:),'o','MarkerSize',10,'MarkerEdgeColor','#A2142F');
plot(2.*ones(size(data.T24.SP.Left(1,:),1),1),data.T24.SP.Left(1,:),'o','MarkerSize',10,'MarkerEdgeColor','#0072BD');
xlim([0 3]);
xticks([1 2])
ylim([0 1]);
xticklabels({'CT13','T24'})
xlabel('cycle')
ylabel('consumed/total consumed(%) ')
e1 =errorbar(1.1,mean(data.CT13.SP.Left(1,:)),std(data.CT13.SP.Left(1,:)),'o','MarkerSize',10,'LineWidth',2,'MarkerEdgeColor','#A2142F');
e1.Color='#A2142F';
e2=errorbar(2.1,mean(data.T24.SP.Left(1,:)),std(data.T24.SP.Left(1,:)),'o','MarkerSize',10,'LineWidth',2,'MarkerEdgeColor','#0072BD');
e2.Color='#0072BD';
title('Left side sugar preference test','FontSize',14)

%% Open Feild test plots
subplot(2, 4, 3);
hold on
plot(ones(size(data.CT13.OF.duration(1,:) ,1),1),data.CT13.OF.duration(1,:),'o','MarkerSize',10,'MarkerEdgeColor','#A2142F');
plot(2.*ones(size(data.T24.OF.duration(1,:),1),1),data.T24.OF.duration(1,:),'o','MarkerSize',10,'MarkerEdgeColor','#0072BD');
xlim([0 3]);
xticks([1 2])
ylim([0 1]);
xticklabels({'CT13','T24'})
xlabel('cycle')
ylabel('Center/total time(%) ')
e1=errorbar(1.1,mean(data.CT13.OF.duration(1,:)),std(data.CT13.OF.duration(1,:)),'o','MarkerSize',10,'LineWidth',2,'MarkerEdgeColor','#A2142F');
e1.Color='#A2142F';
e2=errorbar(2.1,mean(data.T24.OF.duration(1,:)),std(data.T24.OF.duration(1,:)),'o','MarkerSize',10,'LineWidth',2,'MarkerEdgeColor','#0072BD');
e2.Color='#0072BD';
title('Duration OFT CT13 VS T24','FontSize',14)


subplot(2, 4, 7);
hold on
plot(ones(size(data.CT13.OF.distance(1,:) ,1),1),data.CT13.OF.distance(1,:),'o','MarkerSize',10,'MarkerEdgeColor','#A2142F');
plot(2.*ones(size(data.T24.OF.distance(1,:),1),1),data.T24.OF.distance(1,:),'o','MarkerSize',10,'MarkerEdgeColor','#0072BD');
xlim([0 3]);
xticks([1 2])
ylim([0 1]);
xticklabels({'CT13','T24'})
xlabel('cycle')
ylabel('Periphry/total time(%) ')
e1=errorbar(1.1,mean(data.CT13.OF.distance(1,:)),std(data.CT13.OF.distance(1,:)),'o','MarkerSize',10,'LineWidth',2,'MarkerEdgeColor','#A2142F');
e1.Color='#A2142F';
e2=errorbar(2.1,mean(data.T24.OF.distance(1,:)),std(data.T24.OF.distance(1,:)),'o','MarkerSize',10,'LineWidth',2,'MarkerEdgeColor','#0072BD');
e2.Color='#0072BD';
title('Distance OFT CT13 VS T24','FontSize',14)

%% EPM Test
subplot(2, 4, 2);
hold on
plot(ones(size(data.CT13.EPM.duration(1,:) ,1),1),data.CT13.EPM.duration(1,:),'o','MarkerSize',10,'MarkerEdgeColor','#A2142F');
plot(2.*ones(size(data.T24.EPM.duration(1,:),1),1),data.T24.EPM.duration(1,:),'o','MarkerSize',10,'MarkerEdgeColor','#0072BD');
xlim([0 3]);
xticks([1 2])
ylim([0 1]);
xticklabels({'CT13','T24'})
xlabel('cycle')
ylabel('openHand/total duration(%) ')
e1=errorbar(1.1,mean(data.CT13.EPM.duration(1,:)),std(data.CT13.EPM.duration(1,:)),'o','MarkerSize',10,'LineWidth',2,'MarkerEdgeColor','#A2142F');
e1.Color='#A2142F';
e2=errorbar(2.1,mean(data.T24.EPM.duration(1,:)),std(data.T24.EPM.duration(1,:)),'o','MarkerSize',10,'LineWidth',2,'MarkerEdgeColor','#0072BD');
e2.Color='#0072BD';
title('Duration EPM CT13 VS T24','FontSize',14)


subplot(2, 4, 6);
hold on
plot(ones(size(data.CT13.EPM.distance(1,:) ,1),1),data.CT13.EPM.distance(1,:),'o','MarkerSize',10,'MarkerEdgeColor','#A2142F');
plot(2.*ones(size(data.T24.EPM.distance(1,:),1),1),data.T24.EPM.distance(1,:),'o','MarkerSize',10,'MarkerEdgeColor','#0072BD');
xlim([0 3]);
xticks([1 2])
ylim([0 1]);
xticklabels({'CT13','T24'})
xlabel('cycle')
ylabel('openHand/total distance(%) ')
e1=errorbar(1.1,mean(data.CT13.EPM.distance(1,:)),std(data.CT13.EPM.distance(1,:))...
    ,'o','MarkerSize',10,'LineWidth',2,'MarkerEdgeColor','#A2142F');
e1.Color='#A2142F';
e2=errorbar(2.1,mean(data.T24.EPM.distance(1,:)),std(data.T24.EPM.distance(1,:))...
    ,'o','MarkerSize',10,'LineWidth',2,'MarkerEdgeColor','#0072BD');
e2.Color='#0072BD';
title('Distance EPM CT13 VS T24','FontSize',14)

%% forse swiming test

subplot(2, 4, 4);
hold on
plot(ones(size(data.CT13.FS.duration(1,:) ,1),1),data.CT13.FS.duration(1,:),'o','MarkerSize',10,'MarkerEdgeColor','#A2142F');
plot(2.*ones(size(data.T24.FS.duration(1,:),1),1),data.T24.FS.duration(1,:),'o','MarkerSize',10,'MarkerEdgeColor','#0072BD');
xlim([0 3]);
xticks([1 2])
ylim([0 1]);
xticklabels({'CT13','T24'})
xlabel('cycle')
ylabel('inactive/active+inactive(%) ')
e1=errorbar(1.1,mean(data.CT13.FS.duration(1,:)),std(data.CT13.FS.duration(1,:)),'o','MarkerSize',10,'LineWidth',2,'MarkerEdgeColor','#A2142F');
e1.Color='#A2142F';
e2=errorbar(2.1,mean(data.T24.FS.duration(1,:)),std(data.T24.FS.duration(1,:)),'o','MarkerSize',10,'LineWidth',2,'MarkerEdgeColor','#0072BD');
e2.Color='#0072BD';
title('Duration FST CT13 VS T24','FontSize',14)

subplot(2, 4, 8);
hold on
plot(ones(size(data.CT13.FS.frequency(1,:) ,1),1),data.CT13.FS.frequency(1,:),'o','MarkerSize',10,'MarkerEdgeColor','#A2142F');
plot(2.*ones(size(data.T24.FS.frequency(1,:),1),1),data.T24.FS.frequency(1,:),'o','MarkerSize',10,'MarkerEdgeColor','#0072BD');
xlim([0 3]);
xticks([1 2])
ylim([0 1]);
xticklabels({'CT13','T24'})
xlabel('cycle')
ylabel('inactive/active+inactive(%) ')
e1=errorbar(1.1,mean(data.CT13.FS.frequency(1,:)),std(data.CT13.FS.frequency(1,:))...
    ,'o','MarkerSize',10,'LineWidth',2,'MarkerEdgeColor','#A2142F');
e1.Color='#A2142F';
e2=errorbar(2.1,mean(data.T24.FS.frequency(1,:)),std(data.T24.FS.frequency(1,:))...
    ,'o','MarkerSize',10,'LineWidth',2,'MarkerEdgeColor','#0072BD');
e2.Color='#0072BD';
title('Frequency FST CT13 VS T24','FontSize',14)
hold off
end