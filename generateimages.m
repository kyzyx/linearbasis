function v = generateimages(prefix, f, n, bindex)
    if nargin < 3
        n = 64;
    end

    pkg load signal;
    x = 0:pi/64:8*pi;
    y = sawtooth(x);

    c = linearbasis(f, x, y, n);
    y2 = evaluatelinearbasis(f,c,x);

    % Generate comparison image
    figure(1);
    hold on;
    plot(x,y,'k');
    plot(x,y2,'r');
    axis([0 25 -1.2 1.2]);
    print([prefix '_plot.png']);

    % Generate image of one basis function
    if nargin < 4
        bindex = floor(length(c)/2);
    end
    cp = zeros(1, length(c));
    cp(bindex) = 1;
    y3 = evaluatelinearbasis(f,cp,x);
    figure(2);
    plot(x,y3,'b');
    yl = ylim;
    ylim(yl*1.1);
    print([prefix '_basis.png']);
end
