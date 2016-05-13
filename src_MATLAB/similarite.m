function C = similarite(I1,I2, x1,y1, x2, y2)

[h1,w1] = size(I1);
[h2,w2] = size(I2); 


eps1 = -1;
eps2 =  1;

gamma1 = -1;
gamma2 =  1;

if(x1 == 1 || x2 ==1 )
   eps1 = 0; 
end
if( x1 == h1 || x2 == h2)
    eps2 = 0;
end


if(y1 == 1 || y2 ==1 )
   gamma1 = 0; 
end
if( y1 == w1 || y2 == w2)
    gamma2 = 0;
end



[X,Y ] = meshgrid(  eps1:eps2, gamma1:gamma2); 
F1 = I1 (x1 + X, y1 + Y);
F2 = I2 (x2 + X, y2 + Y);
C = sum( abs(F1(:)-F2(:)));
    
end