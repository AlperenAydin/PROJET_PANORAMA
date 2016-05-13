%%programme pour le detecteur de Harris
function Harris = pgr_detect_H_m(im)

[h,w] = size(im); 

[Ix, Iy] = gradient(double(im));

%sigma pour la gaussienne : exp( -x²+y²/2sigma² ) qui filtre les gradient
%pour diminuer l'influence du bruit
sigma = 2;

W = fspecial('gaussian', 10, sigma); %filtre gaussien
A = conv2(Ix.^2, W, 'same');
B = conv2(Iy.^2, W, 'same');
C = conv2(Ix.*Iy,W, 'same');
k = 0.04;

Harris = A.*B - C.^2 - k*(A+B); %critere de Harris

%on cherche les maxima régionaux de Harris car il y a beaucoup de points
%considérés comme des angles au même endroit
H_max = imregionalmax(Harris);
Harris = Harris.*H_max;

%%on élimine les maxima pas assez élevés, c'est à dire ceux qui ne sont pas
%%des coins
threshold = 8e5;
Harris = Harris > threshold;


%% a faire dans en dehors de la fonction, dans panorama_auto
% threshold = 8e5;
% 
% [i, j] = find (Harris > threshold);
% 
% %affichage de l'image avec les coins
% figure(), imagesc(image), colormap gray, hold on, plot(j, i, 'or');



