function v = rbfbasis2d(x, y, n, d, res, w)
    px = (mod(n,d)+0.5)*res-x;
    py = (floor(n/d)+0.5)*res-y;
    v = exp((-0.5/(w*w)) * (px.*px + py.*py).^2);
end
