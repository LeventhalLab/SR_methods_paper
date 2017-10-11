%dellens
%make 3 bargraphs from reaching data
ind_reach_data_file = fullfile('/Users/dleventh/Documents/Leventhal lab github/SR_methods_paper','rev_data_4.mat');
load(ind_reach_data_file)
numReach_ylim = [0,100];
acc_ylim = [0,1];
acc_ticks = [0,0.5,1];
reach_ticks = [0,50,100];
tickLabelFont = 'arial';
tickLabelFontSize = 9;
axisLabelFont = 'arial';
axisLabelFontSize = 10;

figProps.m = 3;
figProps.n = 1;
figProps.width = 2.54 * 8.5;
figProps.height = 2.54 * 11;
panelWidth = 8;
panelHeight = 5;
figProps.panelWidth = ones(figProps.n,1) * panelSize;
figProps.panelHeight = ones(figProps.m,1) * panelHeight;
figProps.colSpacing = 1.5;
figProps.rowSpacing = 0.5 * ones(figProps.m-1,1);
figProps.topMargin = 5;

rtFaceColor = 'w'; ltFaceColor = 'k';
[h_fig, h_axes] = createFigPanels5(figProps);

rtPaws = logical(meanRiDsor(4,:));
rtIdx = find(rtPaws);
ltIdx = find(~rtPaws);
%bar graph any reach success
%subplot(3,1,3);
axes(h_axes(1,1));
hold;
meanAny = mean(onestwos_d8_12);
semAny = ((std(onestwos_d8_12))/sqrt(length(onestwos_d8_12)));
meanAnyId = cat(1,ratIDs,meanAny,semAny,pawPref);
[d1,d2] = sort(meanAnyId(2,:),'descend');
meanAnyIdSor = meanAnyId(:,d2);
anySucc_bar_left = bar(ltIdx,meanAnyIdSor(2,~rtPaws),'k');
anySucc_bar_right = bar(rtIdx,meanAnyIdSor(2,rtPaws),'k');
anySucc_bar_left.FaceColor = ltFaceColor;
anySucc_bar_right.FaceColor = rtFaceColor;
errorbar(meanAnyIdSor(2,:),meanAnyIdSor(3,:),'.','color','k');
set(gca, 'XTick', 1:11);
% set(gca,'XTickLabel',{meanAnyIdSor(1,:)});
set(gca,'XTickLabel',{});
% title('Any Reach Success: Mean and SEM for Days 8 - 12');
% xlabel('Rat','fontname',axisLabelFont,'fontsize',axisLabelFontSize);
ylabel('Success Rate','fontname',axisLabelFont,'fontsize',axisLabelFontSize);
set(gca,'ylim',acc_ylim);
set(gca, 'YTick', acc_ticks);
l = legend('left paw','right paw');
l.Box = 'off';
hold off;




%bar graph first reach success
%subplot(3,1,2);
axes(h_axes(2,1))
hold;
meanOnes = mean(ones_d8_12);
semOnes = ((std(ones_d8_12))/sqrt(length(ones_d8_12)));
meanOnesiD = cat(1,ratIDs,meanOnes,semOnes,pawPref);
% [d1,d2] = sort(meanOnesiD(2,:),'descend');
meanOnesIdSor = meanOnesiD(:,d2);
firstSucc_bar_left = bar(ltIdx,meanOnesIdSor(2,~rtPaws),'k');
firstSucc_bar_right = bar(rtIdx,meanOnesIdSor(2,rtPaws),'k');
firstSucc_bar_left.FaceColor = ltFaceColor;
firstSucc_bar_right.FaceColor = rtFaceColor;
errorbar(meanOnesIdSor(2,:),meanOnesIdSor(3,:),'.','color','k');
set(gca, 'XTick', 1:11);
% set(gca,'XTickLabel',{meanOnesIdSor(1,:)});
set(gca,'XTickLabel',{});
% title('First Reach Success: Mean and SEM for Days 8 - 12');
% xlabel('Rat','fontname',axisLabelFont,'fontsize',axisLabelFontSize);
ylabel('1st Reach Success Rate','fontname',axisLabelFont,'fontsize',axisLabelFontSize);
set(gca,'ylim',acc_ylim);
set(gca, 'YTick', acc_ticks);
hold off;


%bar graph reaches
axes(h_axes(3,1));
hold;
%subplot(3,1,1);
meanR = mean(reaches_d8_12);
semR = ((std(reaches_d8_12))/sqrt(length(reaches_d8_12)));
meanRiD = cat(1,ratIDs,meanR,semR,pawPref) %pawPref = 0 Left, 1 Right
% [d1,d2] = sort(meanRiD(2,:),'descend');
meanRiDsor = meanRiD(:,d2)
reaches_bar_left = bar(ltIdx,meanRiDsor(2,~rtPaws),'k');
reaches_bar_right = bar(rtIdx,meanRiDsor(2,rtPaws),'k');
reaches_bar_left.FaceColor = ltFaceColor;
reaches_bar_right.FaceColor = rtFaceColor;
errorbar(meanRiDsor(2,:),meanRiDsor(3,:),'.','color','k');
% set(gca,'XTickLabel',{meanRiDsor(1,:)});
set(gca,'XTickLabel',{});
set(gca, 'XTick', 1:11);
% title('Reaches: Mean and SEM for Days 8 - 12');
xlabel('Rat','fontname',axisLabelFont,'fontsize',axisLabelFontSize);
ylabel('Reaches/Session','fontname',axisLabelFont,'fontsize',axisLabelFontSize);
set(gca,'ylim',numReach_ylim);
set(gca, 'YTick', reach_ticks);
hold off;

figPath = '/Users/dleventh/Box Sync/Leventhal Lab/Manuscripts/Skilled reaching methods/Figures';
pdfName = fullfile(figPath,'ind_training_results');
print(pdfName,'-dpdf');
