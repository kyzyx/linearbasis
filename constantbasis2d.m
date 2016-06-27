function v = constantbasis2d(x, y, n, d)
    px = mod(n,d)/d;
    py = floor(n/d)/d;
    v = (x >= px) & (x < px+1/d) & (y >= py) & (y < py+1/d);
end
