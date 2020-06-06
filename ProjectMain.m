%% Run All Files.

defined_types = dir("./images/*.jpg");
TotalCards = string([size(defined_types,1),2]);
for i = 1:length(defined_types)
    image = imread(fullfile("./images/", defined_types(i).name));
    cardList = ConvertImageToCardImageList(image);
    for j = 1:length(cardList)
      rect = ConvertToRectangleCardImage(cell2mat(cardList(j)));
      [number, type] = RecognizeCard(rect);
      TotalCards(i,1) = append(number,type);
    end
    fileCardName = string(defined_types(i).name(1:size(defined_types(i).name,2)-4));
    if strcmp(fileCardName,"green_close")
        TotalCards(i,2) = "9diamonds"; 
    else
        TotalCards(i,2) = fileCardName;
    end
end

Predicted = TotalCards(:,1);
Actual = TotalCards(:,2);
Chart = confusionchart(Actual,Predicted);
ChartValues = Chart.NormalizedValues;

for i =1:size(ChartValues,1)
    recall(i)=ChartValues(i,i)/sum(ChartValues(i,:));
end

recall(isnan(recall))=[];
Recall=sum(recall)/size(ChartValues,1);

for i =1:size(ChartValues,1)
    precision(i)=ChartValues(i,i)/sum(ChartValues(:,i));
end

precision(isnan(precision))=[];
Precision=sum(precision)/size(ChartValues,1);
F_score=2*Recall*Precision/(Precision+Recall);

%% Enter image address to test.

% imageAddress = "./images/8spades.jpg";
% image = imread(imageAddress);
% 
% cardList = ConvertImageToCardImageList(image);
% for i = 1:length(cardList)
%   rect = ConvertToRectangleCardImage(cell2mat(cardList(i)));
%   [number, type] = RecognizeCard(rect);
%   disp([number, " of ", type]);
% end