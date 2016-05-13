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
N = length(C2);

% Initialisation des probabilité
k = 1;
P = zeros(M,N);
for m = 1:M
   for n = 1:N
       wmn = similarite(I1, I2, C1(m,1), C1(m,2), C2(n,1), C2(n,2));
       P(m,n) = 1./(1 + k*wmn); 
   end    
end

for i = 1:10
   for m = 1:M
       for n = 1:N
          
           
           
       end
   end 
end


