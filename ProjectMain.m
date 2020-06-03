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