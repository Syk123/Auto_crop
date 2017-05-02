I = imread('data/input_15.jpg');
[h,s,v] = rgb2hsv(I);
I = v;
[ri, ci] = size(I);
I = imgaussfilt(I,4);
I = imresize(I, [400 400]);
[r,c] = size(I);
I = medfilt2(I, [10 10]);
a = ones(1, 40);
b = -ones(1,40);
z = zeros(1,40);
figure; imshow(I, []);
oper = [a; z; b];
[sy, sHeight] = find_point_length(I,oper,r, ri);
[sx, sWidth] = find_point_length(I, oper', c, ci);


