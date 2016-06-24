function coef = linearbasis2d(f, l, z, n)
    x = reshape(repmat(1:l,l,1), 1, [])/l;
    y = reshape(repmat((1:l)',1,l), 1, [])/l;
    m = zeros(length(x), n);
    for i=1:n
        m(:,i) = f(x,y,i-1)';
    end
    [Q,R] = qr(m,0);
    coef = R\(Q'*reshape(z,1,[])');
end
