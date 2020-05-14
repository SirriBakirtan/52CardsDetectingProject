function [newGrayScaleImage] = ConvertToRectangleCardImage(Image)

props = regionprops(Image, 'BoundingBox');
boundingBox = props.BoundingBox;
xLeft = boundingBox(1);
yTop = boundingBox(2);
width = boundingBox(3);
height = boundingBox(4);
boundingBox2 = [xLeft, yTop, width, height];

% Crop the image
newGrayScaleImage = imcrop(Image, boundingBox2);
imshow(newGrayScaleImage);

end

