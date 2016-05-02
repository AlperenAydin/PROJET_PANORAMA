close all
clearvars


I1 = imread('keble_a.jpg');
I2 = imread('keble_b.jpg');

figure();
subplot(121);
imagesc(I1);
subplot(122);
imagesc(I2);


cpselect(I1, I2);