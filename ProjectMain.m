image = imread("images/4clubs.jpg");

t = ConvertImageToCardImageList(image);

for i = 1:length(t)
  rect = ConvertToRectangleCardImage(cell2mat(t(i)));
  [number, type] = RecognizeCard(rect);
end