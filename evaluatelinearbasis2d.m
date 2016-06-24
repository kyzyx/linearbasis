function z = evaluatelinearbasis2d(f, coef, l)
    x = reshape(repmat(1:l,l,1), 1, [])/l;
    y = reshape(repmat((1:l)',1,l), 1, [])/l;
    z = zeros(1, length(x));
    for i=1:length(coef)
        z += f(x, y, i-1)*coef(i);
    end
    z = reshape(z,l,l);
end
