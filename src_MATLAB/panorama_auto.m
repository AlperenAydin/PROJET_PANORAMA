clear all; close all;


%%chargement des images puis on les mets en niv de gris
I1 = (imread('house1.png'));
I2 = (imread('house2.png'));

I1 = im2double(I1);
I2 = im2double(I2);

%[Q1, Q2] = Thompson_Barnard(I1, I2, 4);
[f1, d1] = vl_sift(single(I1)) ;
[f2, d2] = vl_sift(single(I2)) ;
[matches, scores] = vl_ubcmatch(d1, d2) ;


[l, w] = size(Q1);

%% Construction de A
% On considere A comme A = horzcat(A1,A2,A3)
% On calcul Ai separement
Q1 = horzcat(Q1,ones(l,1));
Q2 = horzcat(Q2,ones(l,1));

A1 = zeros(2*l,3);

k = 0:l-1;
A1(2*k+1,:) = Q1;

A2 = zeros(2*l,3);
k  = 1:l;
A2(2*k,:) = Q1;

A3 = zeros(2*l,3);

n= 1;
for i = 1:2:2*l
   A3(i,:) = -Q2(n,1).*Q1(n,:);
   A3(i+1,:) = - Q2(n,2).*Q1(n,:);
    
   n = n+1; 
end


A = horzcat(A1,A2,A3);


[V,D] = eig(A'*A);

h = V(:,1);

H = reshape(h,3,3);
H = H';