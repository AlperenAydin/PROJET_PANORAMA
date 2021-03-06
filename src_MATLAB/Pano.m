function P = Pano(I)
% Cette fonction prend en parametre deux images de meme taille rgb, double.

[~,~,L] = size(I);

%image de r�f�rence
I1 = I(:,:,1);
% Mise en correspondance
for i = 2:L
    I2 = I(:,:,i);
    [Q1,Q2] = siftFeatureMatch(I1, I2, 5);
    % Calcul d'Homographie
    H(:,:,i-1) = estHomographie(Q1,Q2); 
end
    % Construction de Panorama
    P = InterpolPano(I,H);


end