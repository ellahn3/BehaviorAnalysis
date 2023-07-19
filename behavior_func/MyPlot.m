function [] = MyPlot(group1_data,group2_data,groups,variableName,component,ylabelText)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
plot(ones(size(group1_data ,1),1),group1_data,'o','MarkerSize',10,'MarkerEdgeColor','#A2142F');
plot(2.*ones(size(group2_data,1),1),group2_data,'o','MarkerSize',10,'MarkerEdgeColor','#0072BD');
xlim([0 3]);
xticks([1 2])
ylim([0 1]);
xticklabels(groups)
xlabel('Group')
ylabel(ylabelText)
e1=errorbar(1.1,mean(group1_data),std(group1_data),'o','MarkerSize',10,'LineWidth',2,'MarkerEdgeColor','#A2142F');
e1.Color='#A2142F';
e2=errorbar(2.1,mean(group2_data),std(group2_data),'o','MarkerSize',10,'LineWidth',2,'MarkerEdgeColor','#0072BD');
e2.Color='#0072BD';
title1 = " " + variableName + " - " + component + " Comparison";
title(title1, 'FontSize', 14)
% performing a permutation t-test for the second component
[p, observedDifference, effectSize] = permutationTest(group1_data, group2_data, 10000);

subtitleText2 = "p= " + num2str(p) + newline + "observed difference= " + num2str(observedDifference) + newline + "effect size= " + num2str(effectSize);
subtitle(subtitleText2, 'FontSize', 9)

end