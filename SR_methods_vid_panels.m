% script to make video panel figure
%%
figProps.m = 5;
figProps.n = 2;
figProps.width = 2.54 * 8.5;
figProps.height = 2.54 * 11;
panelSize = 4.1;
figProps.panelWidth = ones(figProps.n,1) * (panelSize+0.2);
figProps.panelHeight = ones(figProps.m,1) * panelSize;
figProps.colSpacing = .01;
figProps.rowSpacing = ones(figProps.n-1,1) * 0;
figProps.topMargin = 3;

[h_fig,h_axes] = createFigPanels5(figProps);
textPos = [20,40];
%%
ratID = 'R0055';
sessionName = [ratID '_20150116a'];
timeList = [0.65,1.0,1.05,1.15,1.30];

ROI = [750,450,500,500
	   1500,400,500,500];
vidRoot = '/Volumes/RecordingsLeventhal3/SkilledReaching/';
ratDir = fullfile(vidRoot, ratID,[ratID '-rawdata']);
sessionDir = fullfile(ratDir, sessionName);
vidFile = fullfile(sessionDir, 'R0055_20150116_14-38-10_047.avi');

video = VideoReader(vidFile);

frames = cell(1,2);
for iView = 1 : 2
    frames{iView} = uint8(zeros(ROI(iView,4)+1,ROI(iView,3)+1,3,length(timeList)));
end

for iFrame = 1 : length(timeList)
    video.CurrentTime = timeList(iFrame);
    image = readFrame(video);

%     figure(iFrame);
%     imshow(image);
    
    for iView = 1 : 2
        frames{iView}(:,:,:,iFrame) = image(ROI(iView,2):ROI(iView,2) + ROI(iView,4),...
                                            ROI(iView,1):ROI(iView,1) + ROI(iView,3),:);
        axes(h_axes(iFrame,iView));
        imshow(frames{iView}(:,:,:,iFrame))
        
        if iView == 1
            timeStr = sprintf('%0.2f',video.CurrentTime);
            textStr = [timeStr ' s'];
            text(textPos(1),textPos(2),textStr,...
                 'fontname','arial',...
                 'fontsize',10,...
                 'color','w');
        end
    end
    
    
    
end

figPath = '/Users/dleventh/Box Sync/Leventhal Lab/Manuscripts/Skilled reaching methods/Figures';
pdfName = fullfile(figPath,'SR_vid_panels');
print(pdfName,'-dpdf');
