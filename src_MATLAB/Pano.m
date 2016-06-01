function P = Pano(I1,I2)
% Cette fonction prend en parametre deux images de meme taille rgb, double.

% Mise en correspondance
[Q1,Q2] = siftFeatureMatch(I1,I2, 5);
% Calcul d'Homographie
H = estHomographie(Q1,Q2);
% Construction de Panorama
P = InterpolPano(I1,I2,H);


end