function [X,Y,C1,C2] = Thompson_Barnard(I1,I2)

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

cdiff = 1;
a = 1;
b = 1;
for i = 1:10
   for m = 1:M
       sum = 0;
       for n = 1:N
           qmn = 0;
           cmn = norm(C1(m,:) - C2(n,:));
           VK = V8(I1, C1(m,1), C1(m,2));
           VL = V8(I2, C2(n,1), C2(n,2));
           for k = 1:M
               % On cherche k tq xk est voisin a xm 
               if( ~isempty(find( (C1(k,1) == VK(:,1)) & (C1(k,2) == VK(:,2)), 1)))
                   for l = 1:N
                      % On cherhce l tq yl est voisin a yn
                      if( ~isempty(find( (C2(l,1) == VL(:,1)) & (C2(l,2) == VL(:,2)), 1)))
                          ckl = norm( C1(k,:) - C2(l,:));
                          if( abs(ckl-cmn) <cdiff)
                              qmn = P(k,l);
                          end
                      end
                   end
               end
           end      
           P(m,n) = P(m,n)*(a+b*qmn);
           sum = sum + P(m,n);
       end
       P(m,:) = P(m,:)/sum;
   end 
end

[C, Ind ] = max(P');
X = 1:length(Ind);
Y = Ind;
end
