function [retval] = ConvertImageToCardImageList(image)

  image_bw = convertbw(image);
  retval = getcardsarray(image, image_bw);

end

