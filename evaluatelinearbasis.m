function y = evaluatelinearbasis(f, coef, x)
    y = zeros(1, length(x));
    for i=1:length(coef)
        y += f(x, i-1)*coef(i);
    end
end
