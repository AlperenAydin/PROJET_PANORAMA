%%programme pour le detecteur de Harris

close all; clear all;

image = imread('keble_a.jpg' );
im = rgb2gray(image);

[Ix, Iy] = gradient(double(im));


sigma = 2;

W = fspecial('gaussian', 10, sigma);
A = conv2(Ix.^2, W, 'same');
B = conv2(Iy.^2, W, 'same');
C = conv2(Ix.*Iy,W, 'same');
k = 0.04;

Harris = A.*B - C.^2 - k*(A+B); 

threshold = 5e5;
[i, j] = find(Harris > threshold);

%affichage de l'image avec les coins
figure(); hold on;
imagesc(image), colormap gray, plot(j, i, 'or');



