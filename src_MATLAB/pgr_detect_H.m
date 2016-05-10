%%programme pour le detecteur de Harris

close all; clear all;

im = double(rgb2gray( imread('keble_a.jpg' ) ));

[gradX, gradY] = gradient(im);

figure(); colormap gray;
subplot(121);
imagesc(gradX);
subplot(122);
imagesc(gradY);