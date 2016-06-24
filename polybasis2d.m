function v = polybasis2d(x, y, n)
    l = floor((sqrt(1+8*n)-1)/2);
    i = n - (l*l + l)/2;
    v = x.^i.*y.^(l-i);
end
