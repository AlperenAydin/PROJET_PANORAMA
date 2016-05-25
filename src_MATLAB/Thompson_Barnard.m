function [Q1,Q2] = Thompson_Barnard(I1,I2,Z)

pause on;
% % Detecteur de Coin d'Harris
% H1 = pgr_detect_H(I1);
% H2 = pgr_detect_H(I2);
%
% % Coordonnées de point interet
% [i1, j1] = find(H1>0);
% C1 = [i1,j1];
% M = length(C1);
%
% [i2, j2] = find(H2>0);
% C2 = [i2,j2];
% N = length(C2);

C1 = fliplr(corner(I1,'Harris',50));
M = length(C1);

C2 = fliplr(corner(I2,'Harris',50));
N = length(C2);

figure();
imagesc(I1);hold on;
plot(C1(:,2), C1(:,1), 'r*');

% Initialisation de la carte de la probabilité
k = 0.5;
P = zeros(M,N);
cmax = 350;
for m = 1:M
    for n = 1:N
        cmn = norm(C1(m,:) - C2(n,:));
        if(cmn < cmax)
            wmn = similarite(I1, I2, C1(m,1), C1(m,2), C2(n,1), C2(n,2), 50);
            P(m,n) = 1/(1 + k*wmn);
        end
    end
    rowsum = sum(P(m,:));
    if(rowsum == 0)
        disp(rowsum);
    end
    P(m,:) = P(m,:)/rowsum;
end

figure();
cdiff = 10;
a = 1;
b = 1;
% Pp = P precedent
Pp = P;
init = 0;
i =0;
while( norm(Pp-P) > 1e-2 || init == 0)
    init = 1;
    Pp = P;
    for m = 1:M
        for n = 1:N
            qmn = 0;
            cmn = norm(C1(m,:) - C2(n,:));
            if(cmn < cmax)
                for k = 1:M
                    % On cherche k tq xk est voisin a xm
                    if( k ~= m && norm(C1(m,:) - C1(k,:)) < 120)
                        for l = 1:N
                            ckl = norm( C1(k,:) - C2(l,:));
                            if(ckl < cmax)
                                % On teste de la coherence
                                if( abs(ckl-cmn) <cdiff)
                                    qmn = qmn + P(k,l);
                                end
                            end
                        end
                    end
                    P(m,n) = P(m,n)*(a+b*qmn);
                end
            end
        end
        rowsum = sum(P(m,:));
        P(m,:) = P(m,:)/rowsum;
    end
    imagesc(P);
    colormap gray;
    i = i+1;
    title(num2str(i));
    pause(0.01);
end

Q1 = [];
Q2 = [];
z= 0;
while z < Z
    [MX, Ind ] = max(P');
    [~, i] = max(MX);
    Xm = C1(i,:);
    Yn = C2(Ind(i), :);
    if( norm(Xm-Yn) < cmax)
        Q1 = vertcat(Q1,Xm);
        Q2 = vertcat(Q2,Yn);
        P(i,Ind(i)) = 0;
        %P(:,Ind(i)) = 0;
        z = z+1;
    end
    imagesc(P);
    colormap gray;
    i = i+1;
    title(num2str(i));
    pause(0.01); 
end
end
