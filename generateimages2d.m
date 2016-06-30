function generateimages2d(prefix, f, n, inc)
    if nargin < 3
        n = 225;
    end
    if nargin < 4
        inc = 1;
    end

    z = double(imread("ffbw.png"))/255;
    d = length(z);

    c = linearbasis2d(f, d, z, n);
    z2 = evaluatelinearbasis2d(f,c,d);

    % Generate comparison image
    figure(1);
    imshow(z2);
    [prefix ' squared error ' num2str(sum(sum((z-z2).^2)))]
    [prefix ' absolute error ' num2str(sum(sum(abs(z-z2))))]
    print([prefix '_image.png']);

    % Generate image of one basis function
    basisim = zeros(4*d+3,4*d+3);
    for i=1:4
        for j=1:4
            idx = (i-1)*4+j;
            cp = zeros(1, length(c));
            cp(idx*inc) = 1;
            basisim(((i-1)*d+i):(i*d+i-1), ((j-1)*d+j):(j*d+j-1)) = evaluatelinearbasis2d(f,cp,d);
        end
    end
    figure(2);
    imshowneg(basisim);
    print([prefix '_basis.png']);
end
