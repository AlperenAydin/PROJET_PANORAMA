close all


I1 = rgb2gray(imread('keble_a.jpg'));
I2 = rgb2gray(imread('keble_b.jpg'));

figure(); colormap gray;
subplot(121);
imagesc(I1);
subplot(122);
imagesc(I2);

if( exist('Q.mat','file') ==0)
    if (exist('Q1','var') == 0)
        cpselect(I1, I2);
        save('Q.mat','Q1','Q2');
    end
    save('Q.mat','Q1','Q2');
end

load('Q.mat');
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


Q2_reconstruit = H*Q1';
Q2_reconstruit(1,:) = Q2_reconstruit(1,:)./Q2_reconstruit(3,:);
Q2_reconstruit(2,:) = Q2_reconstruit(2,:)./Q2_reconstruit(3,:);
Q2_reconstruit(3,:) = Q2_reconstruit(3,:)./Q2_reconstruit(3,:);

