function Pano = InterpolPano(I,H)
% On a q2=Hq1

[~,~,t]= size(H); %t = nombre d'homographie (aussi = � nbr d'images -1)

for i = 1:t
    H(:,:,i) = inv( H(:,:,i) );
    invH(:,:,i)=inv( H(:,:,i) );
end

%taille images
[~, ~, nbI]= size(I);
Taille = zeros(nbI, 2);
for i=1:nbI
    [h, w, ~]= size(I(:,:,i));
    Taille(i,:) = [h, w];
    Coins_im(:,:,i) = [1 1 1;
                       w 1 1;
                       1 h 1;
                       w h 1]'; %coordonn�es des points coins des images
end

%calcul de la taille de l'image panoramique

[x_min, x_max, y_min, y_max] = Offset(invH, Coins_im);

%creation de l'image panoramique
Pano = zeros(y_max-y_min, x_max-x_min);

%% Placement de l'image de ref dans l'image panoramique
i_min = 2-y_min;
j_min = 2-x_min;

%affichage
figure(); colormap gray;
imagesc(Pano);

h = Taille(1,1); %taille de l'image de reference
w = Taille(1,2);
Pano(i_min:i_min+h-1, j_min:j_min+w-1) = I(:,:,1);

%% Placement des pixels des autres images dans l'image panoramique

%calcul de la zone a recouvrir par les autres images
for i=2:nbI
    [xi_min, xi_max, yi_min, yi_max] = Zone_Couverte(invH(:,:,i-1), Coins_im(:,:,i) );
    
    for x=xi_min:xi_max-1
        c = x-x_min+1;
        
        for y=yi_min:yi_max-1
            l = y-y_min+1;
            
            if Pano(l,c) == 0
                p = f_Hx(H(:,:,i-1), x, y);
                
                h = Taille(i,1); %taille de l'image
                w = Taille(i,2);
                if(p(2) >0 && p(1) >0 && p(2) <= h && p(1) <= w)
                    Pano(l,c) = I(p(2), p(1), i);
                end
            end
            
        end
    end
    
end

end