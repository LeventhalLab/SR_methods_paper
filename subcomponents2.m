scores = [0 0 0; 0.003676471 0.013480392 0.00372549; 0.00245098 0.007352941 0.00245098; 0.012254902 0.012254902 0.012254902; 0.003676471 0.003676471 0.003676471; 0.151960784 0.151960784 0.151960784; 0.066176471 0.066176471 0.066176471; 0.085784314 0.085784314 0.085784314; 0.075980392 0.095588235 0.0775; 0.301470588 0.517156863 0.384375; 0.056372549 0.301470588 0.074675325];   
sem = [0 0 0; 0.002737585 0.005582952 0.002737585; 0.001730974 0.003862942 0.001730974; 0.005426294 0.005426294 0.005426294; 0.00211739 0.00211739 0.00211739; 0.016141052 0.016141052 0.016141052; 0.012389391 0.012389391 0.012389391; 0.009343724 0.009343724 0.009343724; 0.013068248 0.013176936 0.013046468; 0.030770381 0.03375683 0.028700121; 0.011630474 0.01314266 0.011409877];
% Orient, Lift, Digits Close, Aim, Advance, Digits Open, Pronation, Grasp,
% Supination I, Supination II, Release

figure
hold on 
hb = bar(scores); 
lh = legend('Best','Worst','Projected');

% Find center of each bar
numgroups = size(scores, 1); 
numbars = size(scores, 2); 
groupwidth = min(0.8, numbars/(numbars+1.5));
for i = 1:numbars
      x = (1:numgroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*numbars);  % Aligning error bar with individual bar
      errorbar(x, scores(:,i), sem(:,i), 'k', 'linestyle', 'none');
end

%% DKL mods
tickLabelFont = 'arial';
tickLabelFontSize = 9;
axisLabelFont = 'arial';
axisLabelFontSize = 10;

yticks = [0,0.5,1];
subcompNames = {'Orient','Lift','Digits close','Aim','Advance','Digits open', 'Pronation',...
    'Grasp','Supination I','Supination II','Release'};
ylim = [0,1];

DKLscores = [0	0.007352941	0	0.012254902	0	0.151960784	0.066176471	0.144607843	0.0775	0.384375	0.060344828];
DKLstdev  = [0	0.060334478	0	0.077502987	0	0.230540334	0.176955891	0.227256811	0.188204289	0.463178365	0.163353217];
DKLsem    = [0	0.004224258	0	0.005426294	0	0.016141052	0.012389391	0.015911159	0.013308053	0.036617465	0.012383775];
x_val = 1:length(DKLscores);

h_fig = figure;
set(gcf,'units','centimeters','position',[1 1 9 6])

h_bar = bar(x_val,DKLscores);
set(h_bar,'edgecolor','k',...
          'facecolor','k');
hold on
h_ebars = errorbar(x_val,DKLscores,DKLsem,'linestyle','none','color','k');
ylabel('Movement Score',...
       'fontsize',axisLabelFontSize,...
       'fontname',axisLabelFont);
   
set(gca,'ylim',ylim,...
    'ytick',yticks,...
    'xticklabel',subcompNames,...
    'xticklabelrotation',45,...
    'fontname',tickLabelFont,...
    'fontsize',tickLabelFontSize);

figPath = '/Users/dleventh/Box Sync/Leventhal Lab/Manuscripts/Skilled reaching methods/Figures';
pdfName = fullfile(figPath,'movement_analysis.pdf');
print(pdfName,'-dpdf');