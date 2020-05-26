function [card_number, card_type] = RecognizeCard(card_image)
  
  [height, width, ignored] = size(card_image);
  y = uint16(height * 0.04);
  height = uint16(height * 0.275);
  x = uint16(width * 0.03);
  width = uint16(width * 0.145);
  card_type_cropped = card_image(y:height, x:width, :);
  image_bw = ConvertImageToBlackAndWhite(card_type_cropped);
  image_bw = imcomplement(image_bw);
  image_stats = regionprops(image_bw, "boundingbox");
  for i = 1:2
    x = uint16(floor(image_stats(i).BoundingBox(2))) + 1;
    y = uint16(floor(image_stats(i).BoundingBox(1))) + 1;
    width = uint16(floor(image_stats(i).BoundingBox(4))) - 1;
    height = uint16(floor(image_stats(i).BoundingBox(3))) - 1;
    if i == 2
      card_number = image_bw(x: x + width, y: y + height, :);
    end
    if i == 1
      card_type = image_bw(x: x + width, y: y + height, :);
    end
  end
  card_number = imresize(card_number, [50, 50]);
  card_type = imresize(card_type, [50, 50]);
  
  type_possibility = intmax("uint16");
  most_possible_type = "";
  
  defined_types = dir("./resources/types/*.jpg");
  for i = 1:length(defined_types)
    type = imread(fullfile("./resources/types/", defined_types(i).name));
    type = imresize(type, [50, 50]);
    type = imcomplement(im2bw(type));
    possibility = sum(sum(abs(type - card_type)));
    if possibility < type_possibility
      type_possibility = possibility;
      most_possible_type = defined_types(i).name;
    end
  end
  
  number_possibility = intmax("uint16");
  most_possible_number = "";
  
  defined_numbers = dir("./resources/numbers/*.jpg");
  for i = 1:length(defined_numbers)
    number = imread(fullfile("./resources/numbers/", defined_numbers(i).name));
    number = imresize(number, [50, 50]);
    number = imcomplement(im2bw(number));
    possibility = sum(sum(abs(number - card_number)));
    if possibility < number_possibility
      number_possibility = possibility;
      most_possible_number = defined_numbers(i).name;
    end
  end

  if (length(image_stats) == 3)
    card_number = "ten";
  else
    card_number = most_possible_number(1: end - 4);
  end
  card_type = most_possible_type(1: end - 4);
    
end

