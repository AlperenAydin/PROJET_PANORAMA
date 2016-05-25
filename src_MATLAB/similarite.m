function C = similarite(I1,I2, x1,y1, x2, y2, d)

I1bis = padarray(I1, [d,d]);
I2bis = padarray(I2, [d,d]);

f1 = I1bis(x1:x1+2*d, y1:y1+2*d);
f2 = I2bis(x2:x2+2*d, y2:y2+2*d);

n = 0;
sum = 0;
for i = 1:d*d
   if( f1(i) ~= 0 && f2(i) ~= 0)
       sum = sum + (f1(i) - f2(i)).^2;
       n = n+1;
   end    
end

if(n==0)
    C = 0;
else
    C = sum/n;
end


end