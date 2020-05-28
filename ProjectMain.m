image = imread("images/Aclubs.jpg");

cardList = ConvertImageToCardImageList(image);
for i = 1:length(cardList)
  rect = ConvertToRectangleCardImage(cell2mat(cardList(i)));
  imshow(rect);
  [number, type] = RecognizeCard(rect);
end
