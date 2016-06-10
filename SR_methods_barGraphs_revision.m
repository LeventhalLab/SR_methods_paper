%dellens
%make 3 bargraphs from reaching data, must have reaches, ones, ones and
%two, pawPref and RatID files in workspace, see comments

%bar graph reaches
figure;
hold;
%subplot(1,3,1);
meanR = mean(reaches_d8_12); %must have reaches file in workspace
semR = ((std(reaches_d8_12))/sqrt(length(reaches_d8_12)));
meanRiD = cat(1,ratIDs,meanR,semR,pawPref) %pawPref = 0 Left, 1 Right, %must have pawPref and ratIDs file in workspace
[~,d2] = sort(meanRiD(2,:));
meanRiDsor = meanRiD(:,d2)
bar(meanRiDsor(2,:),'r');
errorbar(meanRiDsor(2,:),meanRiDsor(3,:),'.');
set(gca,'XTickLabel',{meanRiDsor(1,:)});
set(gca, 'XTick', 1:11);
title('Reaches: Mean and SEM for Days 8 - 12');
xlabel('Rat');
ylabel('Reaches');
hold off;


%bar graph first reach success
%subplot(3,1,2);
figure;
hold;
meanOnes = mean(ones_d8_12); %must have ones data file in workspace
semOnes = ((std(ones_d8_12))/sqrt(length(ones_d8_12)));
meanOnesiD = cat(1,ratIDs,meanOnes,semOnes,pawPref)
[~,d2] = sort(meanOnesiD(2,:));
meanOnesIdSor = meanOnesiD(:,d2)
bar(meanOnesIdSor(2,:),'b');
errorbar(meanOnesIdSor(2,:),meanOnesIdSor(3,:),'.');
set(gca, 'XTick', 1:11);
set(gca,'XTickLabel',{meanOnesIdSor(1,:)});
title('First Reach Success: Mean and SEM for Days 8 - 12');
xlabel('Rat');
ylabel('First Reach Success (ratio)');
hold off;

%bar graph any reach success
%subplot(3,1,3);
figure;
hold;
meanAny = mean(onestwos_d8_12); %must have onestwos file in workspace
semAny = ((std(onestwos_d8_12))/sqrt(length(onestwos_d8_12)));
meanAnyId = cat(1,ratIDs,meanAny,semAny,pawPref)
[~,d2] = sort(meanAnyId(2,:));
meanAnyIdSor = meanAnyId(:,d2)
bar(meanAnyIdSor(2,:),'g')
errorbar(meanAnyIdSor(2,:),meanAnyIdSor(3,:),'.');
set(gca, 'XTick', 1:11);
set(gca,'XTickLabel',{meanAnyIdSor(1,:)});
title('Any Reach Success: Mean and SEM for Days 8 - 12');
xlabel('Rat');
ylabel('Any Reach Success (ratio)');
hold off;
