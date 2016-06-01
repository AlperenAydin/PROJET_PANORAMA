close all;
clearvars;

%%chargement des images puis on les mets en niv de gris
I1 = rgb2gray(imread('keble_a.jpg'));
I2 = rgb2gray(imread('keble_b.jpg'));

I1 = im2double(I1);
I2 = im2double(I2);

P = Pano(I1,I2);

imagesc(P);
