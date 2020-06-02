imageAddress = "";
image = imread(imageAddress);

cardList = ConvertImageToCardImageList(image);
for i = 1:length(cardList)
  rect = ConvertToRectangleCardImage(cell2mat(cardList(i)));
  [number, type] = RecognizeCard(rect);
  disp([number, " of ", type]);
end