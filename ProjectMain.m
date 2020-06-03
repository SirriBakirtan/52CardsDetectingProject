% Run All Files.
% counter = 0;
% defined_types = dir("./images/*.jpg");
% for i = 1:length(defined_types)
%     image = imread(fullfile("./images/", defined_types(i).name));
%     cardList = ConvertImageToCardImageList(image);
%     for j = 1:length(cardList)
%       rect = ConvertToRectangleCardImage(cell2mat(cardList(j)));
%      [number, type] = RecognizeCard(rect);
%      disp([number, " of ", type,"=",defined_types(i).name]);
%    end
% end

% Enter image address to test.
imageAddress = "";
image = imread(imageAddress);

cardList = ConvertImageToCardImageList(image);
for i = 1:length(cardList)
  rect = ConvertToRectangleCardImage(cell2mat(cardList(i)));
  [number, type] = RecognizeCard(rect);
  disp([number, " of ", type]);
end