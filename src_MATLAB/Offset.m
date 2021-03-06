%calcul de la taille de l'image panoramique avec toutes les images.

function [x_min, x_max, y_min, y_max] = Offset(invH, Coins_im)

[~,~,t] = size(invH);
for i = 1:t
    Q1(:,:,i) = invH(:,:,i)*Coins_im(:,:,i+1);
    Q1(1,:) = Q1(1,:)./Q1(3,:);
    Q1(2,:) = Q1(2,:)./Q1(3,:);
    Q1(3,:) = Q1(3,:)./Q1(3,:);
    Q1 = round(Q1);
end 

    x_min = min( [Q1(1,:), Coins_im(1,:,1)]);
    x_max = max( [Q1(1,:), Coins_im(1,:,1)]);
    y_min = min( [Q1(2,:), Coins_im(2,:,1)]);
    y_max = max( [Q1(2,:), Coins_im(2,:,1)]);


end