function coef = linearbasis(f, x, y, n)
    m = zeros(length(y), n);
    for i=1:n
        m(:,i) = f(x,i-1)';
    end
    [Q,R] = qr(m,0);
    coef = R\(Q'*y');
end
