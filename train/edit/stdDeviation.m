I = imread('data/input_23.jpg');
I = imresize(I, 0.2);
[h,s,v] = rgb2hsv(I);
h = imresize(h, [400 400]);
s = imresize(s, [400 400]);
v = imresize(v, [400 400]);

figure; imshow(h);
figure; imshow(s);
figure; imshow(v);

figure; surf(h); colormap default
figure; surf(s); colormap default
figure; surf(v); colormap default

