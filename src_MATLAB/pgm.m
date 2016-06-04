close all;
clearvars;

%%chargement des images puis on les mets en niv de gris
I(:,:,1) = rgb2gray(imread('keble_b.jpg')); %image de référence
I(:,:,2) = rgb2gray(imread('keble_a.jpg'));
I(:,:,3) = rgb2gray(imread('keble_c.jpg'));

I = im2double(I);

P = Pano(I);

imagesc(P);
