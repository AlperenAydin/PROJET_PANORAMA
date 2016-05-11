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



W =  fspecial('gaussian', 10, 2);
A = imfilter(Ix.^2, W);
B = imfilter(Iy.^2, W);
C = imfilter(Ix.*Iy, W);

[h,w] = size(A);
Harris = zeros(h,w); 
k = 0.04;
for x = 1:w
    for y = 1:h
        M = [A(y,x), C(y,x) ; C(y,x), B(y,x)];
        Harris(y,x) = det(M) - k*trace(M);
    end
end

imshow(Harris);
    
