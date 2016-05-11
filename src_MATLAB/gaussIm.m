function G = gaussIm(h,w, omega)


H = linspace(-h/2, h/2, h );
W = linspace(-w/2, w/2, w );
[Y,X] = meshgrid(H,W);

G = exp(  -(X.^2 + Y.^2)/omega );


end