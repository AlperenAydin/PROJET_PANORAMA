%%programme pour le detecteur de Harris

close all; clear all;

im = rgb2gray( imread('keble_a.jpg' ) );

[Ix, Iy] = gradient(double(im));


sigma = 1;

W = fspecial('gaussian', 10, sigma);
A = conv2(Ix.^2, W, 'same');
B = conv2(Iy.^2, W, 'same');
C = conv2(Ix.*Iy,W, 'same');
k = 0.04;

Harris = A.*B - C.^2 - k*(A+B); 
imagesc(Harris);
