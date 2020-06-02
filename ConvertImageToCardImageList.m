function [retval] = ConvertImageToCardImageList(image)

  image = imsharpen(image);
  image_bw = ConvertImageToBlackAndWhite(image);
  retval = GetCardsArray(image, image_bw);

end

