function [] = FST_Plot(data)
f1=figure;
set(f1, 'color', [1 1 1]);
set(f1,'position',[300 50 700 500]);%['start from right','start from bottom','finish left','finish top']
set(f1,'name',"FST_Plot");
subplot(1,2,1)
hold on
plot(ones(size(data.CT13.FS.duration(1,:) ,1),1),data.CT13.FS.duration(1,:),'o','MarkerSize',10,'MarkerEdgeColor','#A2142F');
plot(2.*ones(size(data.T24.FS.duration(1,:),1),1),data.T24.FS.duration(1,:),'o','MarkerSize',10,'MarkerEdgeColor','#0072BD');
xlim([0 3]);
xticks([1 2])
ylim([0 1]);
xticklabels({'CT13','T24'})
xlabel('cycle')
ylabel('duration in move/total duration')
e1=errorbar(1.1,mean(data.CT13.FS.duration(1,:)),std(data.CT13.FS.duration(1,:)),'o','MarkerSize',10,'LineWidth',2,'MarkerEdgeColor','#A2142F');
e1.Color='#A2142F';
e2=errorbar(2.1,mean(data.T24.FS.duration(1,:)),std(data.T24.FS.duration(1,:)),'o','MarkerSize',10,'LineWidth',2,'MarkerEdgeColor','#0072BD');
e2.Color='#0072BD';
title('Duration FST CT13 VS T24','FontSize',14)
% Permutation t-test
[p, observeddifference, effectsize]=permutationTest(data.CT13.FS.duration(1,:),data.T24.FS.duration(1,:),10000); 


s="p= "+num2str(p)+newline+"observeddifference= "+num2str(observeddifference)+newline+"effectsize= "+num2str(effectsize);
subtitle(s,"FontSize",9)
%%
subplot(1,2,2)
hold on
plot(ones(size(data.CT13.FS.frequency(1,:) ,1),1),data.CT13.FS.frequency(1,:),'o','MarkerSize',10,'MarkerEdgeColor','#A2142F');
plot(2.*ones(size(data.T24.FS.frequency(1,:),1),1),data.T24.FS.frequency(1,:),'o','MarkerSize',10,'MarkerEdgeColor','#0072BD');
xlim([0 3]);
xticks([1 2])
ylim([0 1]);
xticklabels({'CT13','T24'})
xlabel('cycle')
ylabel('frequency move/total')
e1=errorbar(1.1,mean(data.CT13.FS.frequency(1,:)),std(data.CT13.FS.frequency(1,:))...
    ,'o','MarkerSize',10,'LineWidth',2,'MarkerEdgeColor','#A2142F');
e1.Color='#A2142F';
e2=errorbar(2.1,mean(data.T24.FS.frequency(1,:)),std(data.T24.FS.frequency(1,:))...
    ,'o','MarkerSize',10,'LineWidth',2,'MarkerEdgeColor','#0072BD');
e2.Color='#0072BD';
title('Frequency FST CT13 VS T24','FontSize',14)
% Permutation t-test
[p, observeddifference, effectsize]=permutationTest(data.CT13.FS.frequency(1,:),data.T24.FS.frequency(1,:),10000); 
s="p= "+num2str(p)+newline+"observeddifference= "+num2str(observeddifference)+newline+"effectsize= "+num2str(effectsize);
subtitle(s,"FontSize",9)


