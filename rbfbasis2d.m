function v = rbfbasis2d(x, y, n, d, w)
    w = w/d;
    px = (mod(n,d)+0.5)/d-x;
    py = (floor(n/d)+0.5)/d-y;
    v = exp((-0.5/(w*w)) * (px.*px + py.*py).^2);
end
