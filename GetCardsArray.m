function retval = GetCardsArray (image, image_bw)
  
  image_bw = imfill(image_bw,'holes');
  image_stats = regionprops(image_bw, "boundingbox");
  threshhold = uint16(length(image_bw(:, 1))) / 10;
  cards = {};
  for i = 1:length(image_stats)
    if image_stats(i).BoundingBox(4) > threshhold
      x = uint16(floor(image_stats(i).BoundingBox(2)));
      y = uint16(floor(image_stats(i).BoundingBox(1)));
      width = uint16(floor(image_stats(i).BoundingBox(4)));
      height = uint16(floor(image_stats(i).BoundingBox(3)));
      cards{end + 1} = image((x+1): (x+1) + (width-1), (y+1): (y+1) + (height-1), :);
    end
  end
  
  retval = cards;
  
end
    
