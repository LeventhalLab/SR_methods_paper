xticks = 3:3:12;
yticks_acc = 0:0.5:1;
y_ticks_count = 0:50:100;
tickLabelFont = 'arial';
tickLabelFontSize = 9;
axisLabelFont = 'arial';
axisLabelFontSize = 10;

figProps.m = 1;
figProps.n = 2;
figProps.width = 2.54 * 8.5;
figProps.height = 2.54 * 11;
figProps.panelWidth = ones(figProps.n,1) * 4;
figProps.panelHeight = ones(figProps.m) * 4;
figProps.colSpacing = 1;
figProps.rowSpacing = 1;
figProps.topMargin = 3;

[h_fig, h_axes] = createFigPanels5(figProps);
h_anyFig = openfig('/Users/dleventh/Box Sync/Leventhal Lab/Manuscripts/Skilled reaching methods/DKL review/anyReachSuccess_2.fig');
h_anySuccess_axes = get(h_anyFig,'children');
h_anySuccess = get(h_anySuccess_axes,'children');
any_succ_day = get(h_anySuccess, 'XData');
any_succ = get(h_anySuccess, 'YData');
any_succ_day = any_succ_day{1};
any_succ = cell2mat(any_succ);
any_succ = any_succ(3:end,:);   % first two rows are the means in the graph
mean_any_succ = mean(any_succ);
std_any_succ = std(any_succ,0,1);
SEM_any_succ = std_any_succ / sqrt(size(any_succ,1));
figure(h_fig)
axes(h_axes(1,1));
errorbar(any_succ_day,mean_any_succ,SEM_any_succ,'color','k');
set(gca,'ylim',[0 1],...
        'xlim',[0, max(any_succ_day)+1],...
        'xtick',xticks,...
        'ytick',yticks_acc,...
        'fontname',tickLabelFont,...
        'fontsize',tickLabelFontSize);

ylabel('success rate','fontname',axisLabelFont,'fontsize',axisLabelFontSize);
xlabel('training day','fontname',axisLabelFont,'fontsize',axisLabelFontSize);


h_firstFig = openfig('/Users/dleventh/Box Sync/Leventhal Lab/Manuscripts/Skilled reaching methods/DKL review/firstReachSuccess_2.fig');
h_firstSuccess_axes = get(h_firstFig,'children');
h_firstSuccess = get(h_firstSuccess_axes,'children');
first_succ_day = get(h_firstSuccess, 'XData');
first_succ_day = first_succ_day{1};
first_succ = get(h_firstSuccess, 'YData');
first_succ = cell2mat(first_succ);
first_succ = first_succ(3:end,:);   % first two rows are the means in the graph
mean_first_succ = mean(first_succ);
std_first_succ = std(first_succ,0,1);
SEM_first_succ = std_first_succ / sqrt(size(first_succ,1));
figure(h_fig)
axes(h_axes(1,1));
hold on
errorbar(first_succ_day,mean_first_succ,SEM_first_succ,,...
         'color','k',...
         'linestyle','--');
set(gca,'ylim',[0 1],...
        'xlim',[0, max(first_succ_day)+1],...
        'xtick',xticks,...
        'ytick',yticks_acc,...
        'fontname',tickLabelFont,...
        'fontsize',tickLabelFontSize);

ylabel('success rate','fontname',axisLabelFont,'fontsize',axisLabelFontSize);
xlabel('training day','fontname',axisLabelFont,'fontsize',axisLabelFontSize);

h_numReachFig = openfig('/Users/dleventh/Box Sync/Leventhal Lab/Manuscripts/Skilled reaching methods/DKL review/reaches_2.fig');
h_numReaches_axes = get(h_numReachFig,'children');
h_numReaches = get(h_numReaches_axes,'children');
num_reaches_day = get(h_numReaches, 'XData');
num_reaches_day = num_reaches_day{1};
num_reaches = get(h_numReaches, 'YData');
for ii = 3 : length(num_reaches)        % to make dimensions match for cell2mat
    num_reaches{ii} = num_reaches{ii}(1:12);
end
% num_reaches{1} = [num_reaches{1},0,0];   % to make dimensions match for cell2mat
% num_reaches{2} = [num_reaches{2},0,0];   % to make dimensions match for cell2mat
num_reaches = cell2mat(num_reaches);
num_reaches = num_reaches(3:end,:);   % first two rows are the means in the graph
mean_num_reaches = mean(num_reaches);
std_num_reaches = std(num_reaches,0,1);
SEM_num_reaches = std_num_reaches / sqrt(size(num_reaches,1));
figure(h_fig)
axes(h_axes(1,2));
errorbar(num_reaches_day,mean_num_reaches,SEM_num_reaches,'color','k');
set(gca,'ylim',[0 100],...
        'xlim',[0, max(num_reaches_day)+1],...
        'xtick',xticks,...
        'ytick',y_ticks_count,...
        'fontname',tickLabelFont,...
        'fontsize',tickLabelFontSize);

ylabel('number of reaches','fontname',axisLabelFont,'fontsize',axisLabelFontSize);
xlabel('training day','fontname',axisLabelFont,'fontsize',axisLabelFontSize);

figPath = '/Users/dleventh/Box Sync/Leventhal Lab/Manuscripts/Skilled reaching methods/Figures';
pdfName = fullfile(figPath,'SR_trainingResults.pdf');
export_fig
