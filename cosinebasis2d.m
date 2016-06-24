function v = cosinebasis2d(x, y, n)
    l = floor(sqrt(n));
    i = n - l*l;
    if i == l
        v = cos(l*x*pi).*cos(l*y*pi);
    elseif i < l
        v = cos(i*x*pi).*cos(l*y*pi);
    else
        v = cos(l*x*pi).*cos((2*l-i)*y*pi);
    end
end
