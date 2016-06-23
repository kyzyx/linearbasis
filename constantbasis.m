function v = constantbasis(x, n, res)
    v = (x >= res*n) & (x < res*(n + 1));
end
function f = getconstantbasis(res)
    f = @(x,n) constantbasis(x,n,res);
end
