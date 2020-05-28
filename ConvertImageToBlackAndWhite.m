function retval = ConvertImageToBlackAndWhite (image)
  
  image_hsv = rgb2hsv(image);

  image_hsv_v = image_hsv(:, :, 3);
  image_hsv_s = image_hsv(:, :, 2);

  image_hsv_v(image_hsv_v < 0.7 | image_hsv_s > 0.3) = 0;
  image_hsv(:, :, 3) = image_hsv_v;
  image_gray = rgb2gray(hsv2rgb(image_hsv));
  retval = im2bw(image_gray, 0.5);

end
