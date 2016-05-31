panorama_auto
clearvars -except H I1 I2

%Programme pour fusionner les images en une seule;

% On a q2=Hq1
H = inv(H);
invH=inv(H);

%taille image
[h1, w1] = size(I1);
[h2, w2] = size(I2);

%coordonnées des points coins des images
Coins_im1 = [1 1 1;
             w1 1 1;
             1 h1 1;
             w1 h1 1]';
Coins_im2 = [1 1 1;
             w2 1 1;
             1 h2 1;
             w2 h2 1]';

%calcul de la taille de l'image panoramique
[x_min, x_max, y_min, y_max] = Offset(invH, Coins_im1, Coins_im2);

%creation de l'image panoramique
Pano = zeros(y_max-y_min, x_max-x_min);

%placement de l'image de ref dans l'image panoramique
i_min = 2-y_min;
j_min = 2-x_min;

i_max = i_min+h2;
j_max = j_min+w2;

%affichage
figure(); colormap gray;
imagesc(Pano);

Pano(i_min:i_min+h2-1, j_min:j_min+w2-1) = I1(:,:);

imagesc(Pano);

%calcul de la zone à recouvrir par les autres images
[xi_min, xi_max, yi_min, yi_max] = Zone_Couverte(invH, Coins_im2);

%placement des pixels des autres images dans l'image panoramique
for x=xi_min:xi_max-1
    c = x-x_min+1;

    for y=yi_min:yi_max-1
        l = y-y_min+1;

        if Pano(l,c) == 0
            p = f_Hx(H, x, y);
            if(p(2) >0 && p(1) >0 && p(2) <= h1 && p(1) <= w1)
                Pano(l,c) = I2(p(2), p(1));
            end
        end
    
    end
end


%affichage
figure(); colormap gray;
imagesc(Pano);



