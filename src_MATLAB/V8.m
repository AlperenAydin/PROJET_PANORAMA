function V = V8(I, x, y)

[h,w] = size(I);

eps1 =-1;
eps2 = 1;

sig1 =-1;
sig2 = 1;

if(x == 1 )
   eps1 = 0; 
end
if(x == h)
    eps2 = 0;
end

if(y == 1)
   sig1 = 0; 
end
if( y == w)
   sig2 = 0;
end

[X,Y] = meshgrid(eps1:eps2, sig1:sig2);
X = X + x; X = X(:);
Y = Y + y; Y = Y(:);



l = find((X == x) & (Y == y) );
X(l) = [];
Y(l) = [];

V = [X';Y']';



end