clear all; close all;


%%chargement des images puis on les mets en niv de gris
I1 = rgb2gray(imread('keble_a.jpg'));
I2 = rgb2gray(imread('keble_b.jpg'));

%%on calcule la position des coins des deux images
Harris1 = pgr_detect_H(I1);
Harris2 = pgr_detect_H(I2);

%%on élimine les maxima pas assez élevés, c'est à dire ceux qui ne sont pas
%%des coins
threshold = 8e5;
Harris1 = Harris1 > threshold;
Harris2 = Harris2 > threshold;

[i1, j1] = find (Harris1);
figure(), subplot(121), imagesc(I1), colormap gray, hold on, plot(j1, i1, 'or');
[i2, j2] = find (Harris2);
subplot(122), imagesc(I2), colormap gray, hold on, plot(j2, i2, 'or');
