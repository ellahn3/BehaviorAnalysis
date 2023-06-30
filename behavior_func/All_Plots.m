function [] = All_Plots(data)
%ploting for all the tests
%   Detailed explanation goes here

f1=figure;
set(f1, 'color', [1 1 1]);
set(f1,'position',[300 50 900 700]);
set(f1,'name',"All_Tests");
%% Suger pref
subplot(4, 2, 1);
hold on
plot(ones(size(data.CT13.SP.Right(1,:) ,1),1),data.CT13.SP.Right(1,:),'ro','MarkerSize',10);
plot(2.*ones(size(data.T24.SP.Right(1,:),1),1),data.T24.SP.Right(1,:),'bo','MarkerSize',10);
xlim([0 3]);
xticks([1 2])
xticklabels({'CT13','T24'})
xlabel('cycle')
ylabel('consumed/total consumed(%) ')
errorbar(1.1,mean(data.CT13.SP.Right(1,:)),std(data.CT13.SP.Right(1,:)),'ro','MarkerSize',10,'LineWidth',2);
errorbar(2.1,mean(data.T24.SP.Right(1,:)),std(data.T24.SP.Right(1,:)),'bo','MarkerSize',10,'LineWidth',2);
title('sugar preference test-Right')
% Permutation t-test
% [p, observeddifference, effectsize]=permutationTest(data.CT13.SP.Right(1,:),data.T24.SP.Right(1,:),10000)  ;
% str={'p=' p 'observeddifference=' observeddifference 'effectsize=' effectsize};
% annotation('textbox',[.7 .5 .1 .2],'String',str,'FitBoxToText','on');

subplot(4, 2, 2);
hold on
plot(ones(size(data.CT13.SP.Left(1,:) ,1),1),data.CT13.SP.Left(1,:),'ro','MarkerSize',10);
plot(2.*ones(size(data.T24.SP.Left(1,:),1),1),data.T24.SP.Left(1,:),'bo','MarkerSize',10);
xlim([0 3]);
xticks([1 2])
xticklabels({'CT13','T24'})
xlabel('cycle')
ylabel('consumed/total consumed(%) ')
errorbar(1.1,mean(data.CT13.SP.Left(1,:)),std(data.CT13.SP.Left(1,:)),'ro','MarkerSize',10,'LineWidth',2);
errorbar(2.1,mean(data.T24.SP.Left(1,:)),std(data.T24.SP.Left(1,:)),'bo','MarkerSize',10,'LineWidth',2);
title('sugar preference test-Left')
% Permutation t-test
% [p, observeddifference, effectsize]=permutationTest(data.CT13.SP.Left(1,:),data.T24.SP.Left(1,:),10000);
% str={'p=' p 'observeddifference=' observeddifference 'effectsize=' effectsize};
% annotation('textbox',[.7 .5 .1 .2],'String',str,'FitBoxToText','on');

%% Open Feild test plots
subplot(4, 2, 3);
hold on
plot(ones(size(data.CT13.OF.duration(1,:) ,1),1),data.CT13.OF.duration(1,:),'ro','MarkerSize',10);
plot(2.*ones(size(data.T24.OF.duration(1,:),1),1),data.T24.OF.duration(1,:),'bo','MarkerSize',10);
xlim([0 3]);
xticks([1 2])
xticklabels({'CT13','T24'})
xlabel('cycle')
ylabel('Center/total time(%) ')
errorbar(1.1,mean(data.CT13.OF.duration(1,:)),std(data.CT13.OF.duration(1,:)),'ro','MarkerSize',10,'LineWidth',2);
errorbar(2.1,mean(data.T24.OF.duration(1,:)),std(data.T24.OF.duration(1,:)),'bo','MarkerSize',10,'LineWidth',2);
title('OF Duration CT13 VS T24')
 % Permutation t-test
% [p, observeddifference, effectsize]=permutationTest(data.CT13.OF.duration(1,:),data.T24.OF.duration(1,:),10000); 
% str={'p=' p 'observeddifference=' observeddifference 'effectsize=' effectsize};
% annotation('textbox',[.7 .5 .1 .2],'String',str,'FitBoxToText','on');

subplot(4, 2, 4);
hold on
plot(ones(size(data.CT13.OF.distance(1,:) ,1),1),data.CT13.OF.distance(1,:),'ro','MarkerSize',10);
plot(2.*ones(size(data.T24.OF.distance(1,:),1),1),data.T24.OF.distance(1,:),'bo','MarkerSize',10);
xlim([0 3]);
xticks([1 2])
xticklabels({'CT13','T24'})
xlabel('cycle')
ylabel('Periphry/total time(%) ')
errorbar(1.1,mean(data.CT13.OF.distance(1,:)),std(data.CT13.OF.distance(1,:)),'ro','MarkerSize',10,'LineWidth',2);
errorbar(2.1,mean(data.T24.OF.distance(1,:)),std(data.T24.OF.distance(1,:)),'bo','MarkerSize',10,'LineWidth',2);
title('OF Distance CT13 VS T24')
% Permutation t-test
% [p, observeddifference, effectsize]=permutationTest(data.CT13.OF.distance(1,:),data.T24.OF.distance(1,:),10000);  
% str={'p=' p 'observeddifference=' observeddifference 'effectsize=' effectsize};
% annotation('textbox',[.7 .5 .1 .2],'String',str,'FitBoxToText','on');
hold off
%% EPM Test
subplot(4, 2, 5);
hold on
plot(ones(size(data.CT13.EPM.duration(1,:) ,1),1),data.CT13.EPM.duration(1,:),'ro','MarkerSize',10);
plot(2.*ones(size(data.T24.EPM.duration(1,:),1),1),data.T24.EPM.duration(1,:),'bo','MarkerSize',10);
xlim([0 3]);
xticks([1 2])
xticklabels({'CT13','T24'})
xlabel('cycle')
ylabel('openHand/total duration(%) ')
errorbar(1.1,mean(data.CT13.EPM.duration(1,:)),std(data.CT13.EPM.duration(1,:)),'ro','MarkerSize',10,'LineWidth',2);
errorbar(2.1,mean(data.T24.EPM.duration(1,:)),std(data.T24.EPM.duration(1,:)),'bo','MarkerSize',10,'LineWidth',2);
title('EPM Duration CT13 VS T24')
% Permutation t-test
% [p, observeddifference, effectsize]=permutationTest(data.CT13.EPM.duration(1,:),data.T24.EPM.duration(1,:),10000); 
% str={'p=' p 'observeddifference=' observeddifference 'effectsize=' effectsize};
% annotation('textbox',[.7 .5 .1 .2],'String',str,'FitBoxToText','on');
hold off

subplot(4, 2, 6);
hold on
plot(ones(size(data.CT13.EPM.distance(1,:) ,1),1),data.CT13.EPM.distance(1,:),'ro','MarkerSize',10);
plot(2.*ones(size(data.T24.EPM.distance(1,:),1),1),data.T24.EPM.distance(1,:),'bo','MarkerSize',10);
xlim([0 3]);
xticks([1 2])
xticklabels({'CT13','T24'})
xlabel('cycle')
ylabel('openHand/total distance(%) ')
errorbar(1.1,mean(data.CT13.EPM.distance(1,:)),std(data.CT13.EPM.distance(1,:)),'ro','MarkerSize',10,'LineWidth',2);
errorbar(2.1,mean(data.T24.EPM.distance(1,:)),std(data.T24.EPM.distance(1,:)),'bo','MarkerSize',10,'LineWidth',2);
title('EPM Distance CT13 VS T24')
% Permutation t-test
% [p, observeddifference, effectsize]=permutationTest(data.CT13.EPM.distance(1,:),data.T24.EPM.distance(1,:),10000); 
% str={'p=' p 'observeddifference=' observeddifference 'effectsize=' effectsize};
% annotation('textbox',[.7 .5 .1 .2],'String',str,'FitBoxToText','on');
hold off
%% forse swiming test

subplot(4, 2, 7);
hold on
plot(ones(size(data.CT13.FS.duration(1,:) ,1),1),data.CT13.FS.duration(1,:),'ro','MarkerSize',10);
plot(2.*ones(size(data.T24.FS.duration(1,:),1),1),data.T24.FS.duration(1,:),'bo','MarkerSize',10);
xlim([0 3]);
xticks([1 2])
xticklabels({'CT13','T24'})
xlabel('cycle')
ylabel('inactive/active+inactive(%) ')
errorbar(1.1,mean(data.CT13.FS.duration(1,:)),std(data.CT13.FS.duration(1,:)),'ro','MarkerSize',10,'LineWidth',2);
errorbar(2.1,mean(data.T24.FS.duration(1,:)),std(data.T24.FS.duration(1,:)),'bo','MarkerSize',10,'LineWidth',2);
title('FST Duration CT13 VS T24')
% Permutation t-test
% [p, observeddifference, effectsize]=permutationTest(data.CT13.FS.duration(1,:),data.T24.FS.duration(1,:),10000) ; 
% str={'p=' p 'observeddifference=' observeddifference 'effectsize=' effectsize};
% annotation('textbox',[.7 .5 .1 .2],'String',str,'FitBoxToText','on');
hold off

subplot(4, 2, 8);
hold on
plot(ones(size(data.CT13.FS.frequency(1,:) ,1),1),data.CT13.FS.frequency(1,:),'ro','MarkerSize',10);
plot(2.*ones(size(data.T24.FS.frequency(1,:),1),1),data.T24.FS.frequency(1,:),'bo','MarkerSize',10);
xlim([0 3]);
xticks([1 2])
xticklabels({'CT13','T24'})
xlabel('cycle')
ylabel('inactive/active+inactive(%) ')
errorbar(1.1,mean(data.CT13.FS.frequency(1,:)),std(data.CT13.FS.frequency(1,:)),'ro','MarkerSize',10,'LineWidth',2);
errorbar(2.1,mean(data.T24.FS.frequency(1,:)),std(data.T24.FS.frequency(1,:)),'bo','MarkerSize',10,'LineWidth',2);
title('FST Frequency CT13 VS T24')
% Permutation t-test
% [p, observeddifference, effectsize]=permutationTest(data.CT13.FS.frequency(1,:),data.T24.FS.frequency(1,:),10000);  
% str={'p=' p 'observeddifference=' observeddifference 'effectsize=' effectsize};
% annotation('textbox',[.7 .5 .1 .2],'String',str,'FitBoxToText','on');
hold off
end