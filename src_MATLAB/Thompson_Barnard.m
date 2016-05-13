close all;

% Chargement des images
I1 = rgb2gray(imread('keble_a.jpg'));
I2 = rgb2gray(imread('keble_b.jpg'));

% Detecteur de Coin d'Harris
H1 = pgr_detect_H(I1);
H2 = pgr_detect_H(I2);

% Coordonnées de point interet
[i1, j1] = find(H1>0);
C1 = [i1,j1];
M = length(C1);

[i2, j2] = find(H2>0);
C2 = [i2,j2];
L = length(C2);

% Initialisation des probabilité
k = 1;
P = zeros(M,L);
for m = 1:M
   for l = 1:L
       wml = similarite(I1, I2, C1(m,1), C1(m,2), C2(L,1), C2(L,2));
       P(m,l) = 1./(1 + k*wml); 
   end    
end

for i = 1:10
   for m = 1:M
       for l = 1:L
          
           
           
       end
   end 
end


