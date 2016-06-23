function v = haarwaveletbasis(x, n)
    if n == 0
        v = ones(size(x));
    else
        xx = x/max(x);
        res = 2^floor(log2(n));
        shift = mod(n,res);
        v1 = xx >= shift / res & xx <= (shift+1)/res;
        v2 = xx > (shift+0.5)/res;
        v = v1 .* (1-2*v2);
    end
end
