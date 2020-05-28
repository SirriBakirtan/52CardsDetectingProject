function retval = GetCardsArray (image, image_bw)
  
  image_stats = regionprops(image_bw, "boundingbox");
  threshhold = uint16(length(image_bw(:, 1))) / 10;
  cards = {};
  for i = 1:length(image_stats)
    if image_stats(i).BoundingBox(4) > threshhold
      x = uint16(floor(image_stats(i).BoundingBox(2)));
      y = uint16(floor(image_stats(i).BoundingBox(1)));
      width = uint16(floor(image_stats(i).BoundingBox(4)));
      height = uint16(floor(image_stats(i).BoundingBox(3)));
      cards{end + 1} = image(x: x + width, y: y + height, :);
    end
  end
  
  retval = cards;
  
end
    
