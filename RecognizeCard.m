function [cardType] = RecognizeCard(cardImage)
  width = length(cardImage(1, :, 1));
  height = length(cardImage(:, 1, 1));
  cardTypeCropped = cardImage(1:height*0.30, 1:width*0.175, :);
  cardType = cardTypeCropped;
end

