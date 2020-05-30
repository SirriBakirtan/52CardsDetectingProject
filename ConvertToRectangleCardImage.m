function [output] = ConvertToRectangleCardImage(Image)
row = size(Image,1);
col = size(Image,2);

if(row < col)
    Image = imrotate(Image,90);
end

binarizeImg = ConvertImageToBlackAndWhite(Image);

kernel = ones(3,3)/9;
FilteredImage = conv2(binarizeImg,kernel,'same');

corners = pgonCorners(FilteredImage,4);
% imshow(binarizeImg);
% hold on;
% plot( corners(:,2),corners(:,1),'yo','MarkerFaceColor','r',...
%                                 'MarkerSize',12,'LineWidth',2);
% hold off;

X = corners(:,2);
Y = corners(:,1);

x=[1;410;410;1];
y=[1;1;497;497];

A=zeros(8,8);
A(1,:)=[X(1),Y(1),1,0,0,0,-1*X(1)*x(1),-1*Y(1)*x(1)];
A(2,:)=[0,0,0,X(1),Y(1),1,-1*X(1)*y(1),-1*Y(1)*y(1)];

A(3,:)=[X(2),Y(2),1,0,0,0,-1*X(2)*x(2),-1*Y(2)*x(2)];
A(4,:)=[0,0,0,X(2),Y(2),1,-1*X(2)*y(2),-1*Y(2)*y(2)];

A(5,:)=[X(3),Y(3),1,0,0,0,-1*X(3)*x(3),-1*Y(3)*x(3)];
A(6,:)=[0,0,0,X(3),Y(3),1,-1*X(3)*y(3),-1*Y(3)*y(3)];

A(7,:)=[X(4),Y(4),1,0,0,0,-1*X(4)*x(4),-1*Y(4)*x(4)];
A(8,:)=[0,0,0,X(4),Y(4),1,-1*X(4)*y(4),-1*Y(4)*y(4)];

v=[x(1);y(1);x(2);y(2);x(3);y(3);x(4);y(4)];

u=A\v;

U=reshape([u;1],3,3)';

T = projective2d(U');

P2 = flip(imwarp(Image,T));
image_bw = ConvertImageToBlackAndWhite(P2);
retval = GetCardsArray(P2, image_bw);
retval{1}=imcrop(imresize(retval{1},[450 450]),[5 5 440 440]);
output =retval{1};
end

