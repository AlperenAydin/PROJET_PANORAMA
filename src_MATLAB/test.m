clear all; close all;


%%chargement des images puis on les mets en niv de gris
I1 = rgb2gray(imread('keble_b.jpg'));
I2 = rgb2gray(imread('keble_c.jpg'));

I1 = im2double(I1);
I2 = im2double(I2);

[Q1, Q2] = Thompson_Barnard(I1, I2, 8);

figure(1);
clf;
imagesc(I1);
colormap gray;
hold on;
plot(Q1(:,2), Q1(:,1),'*r');
L = 1:length(Q1);
L = L';
text(Q1(:,2), Q1(:,1), num2str(L));

figure(2);
clf;
imagesc(I2);
colormap gray;
hold on;
plot(Q2(:,2), Q2(:,1),'*r');
text(Q2(:,2), Q2(:,1), num2str(L));
