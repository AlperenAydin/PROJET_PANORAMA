function p = f_Hx(H, x, y)
    Q1=[x, y, 1]';
    p=H*Q1;
    p(1) = p(1)./p(3);
    p(2) = p(2)./p(3);
    p(3) = p(3)./p(3);
    p = round(p);
end