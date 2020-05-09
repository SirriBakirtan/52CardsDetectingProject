clear all;
close all;

image = imread('images\3cards_extreme.jpg');
imageOrg = imrotate(image,-90);
% subplot(2,2,1);
 imshow(imageOrg);
% title('Original');
imageGray = rgb2gray(imageOrg);
% subplot(2,2,2)
figure
 imshow(imageGray);
% title('Gray Scale');

edge_canny = edge(imageGray,'canny');
figure
imshow(edge_canny);

r=imageGray>160;
sq=ones(3,3);
re=imerode(r,sq);
rd=imdilate(r,sq);
r_grad=rd&~re;
figure
imshow(r_grad);

[H,T,R] = hough(r_grad);
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
x = T(P(:,2));
y = R(P(:,1));
plot(x,y,'s','color','white');

% Find lines and plot them
lines = houghlines(r_grad,T,R,P,'FillGap',5,'MinLength',7);
figure, imshow(r_grad), hold on
max_len = 0;
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
    % plot beginnings and ends of lines
    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
    % determine the endpoints of the longest line segment
    len = norm(lines(k).point1 - lines(k).point2);
    if ( len > max_len)
        max_len = len;
        xy_long = xy;
    end
end
% highlight the longest line segment
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');


