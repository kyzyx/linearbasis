function v = rbfbasis(x, n, res, w)
    v = exp((-0.5/(w*w)) * (x-(n+0.5)*res).^2);
end
function f = getrbfbasis(res,w)
    f = @(x,n) rbfbasis(x,n,res,w);
end
