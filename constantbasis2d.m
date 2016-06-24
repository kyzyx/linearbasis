function v = constantbasis2d(x, y, n, d, res)
    px = mod(n,d);
    py = floor(n/d);
    v = (x >= px*res) & (x < (px+1)*res) & (y >= py*res) & (y < (py+1)*res);
end
