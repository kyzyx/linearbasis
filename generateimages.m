function v = generateimages(prefix, f, n, inc)
    if nargin < 3
        n = 64;
    end
    if nargin < 4
        inc = 1;
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
    d = 500;
    basisim = zeros(3*d+3,3*d+3,3);
    for i=1:3
        for j=1:3
            idx = (i-1)*4+j;
            cp = zeros(1, length(c));
            cp(idx*inc) = 1;
            y3 = evaluatelinearbasis(f,cp,x);
            figure(2);
            plot(x,y3,'b');
            yl = ylim;
            ylim(yl*1.1);
            print('_tmp.png', ['-S', num2str(d), ',', num2str(d-1)]);
            basisim(((i-1)*d+i):(i*d+i-1), ((j-1)*d+j):(j*d+j-1),:) = imread('_tmp.png');
        end
    end
    imwrite(uint8(basisim),[prefix '_basis.png']);
end
