%%programme pour le detecteur de Harris

close all; clear all;

im = im2double(rgb2gray( imread('keble_a.jpg' ) ));

[Ix, Iy] = gradient(im);

figure(); colormap gray;
subplot(121);
imagesc(Ix);
subplot(122);
imagesc(Iy);

sigma = 1;



W =  fspecial('gaussian', 9, 1);
A = conv2(Ix.^2, W);
B = conv2(Iy.^2, W);
C = conv2(Ix.*Iy, W);

[h,w] = size(A);
Harris = zeros(h,w); 
