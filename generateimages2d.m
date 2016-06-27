function generateimages2d(prefix, f, n, bindex)
    if nargin < 3
        n = 225;
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
    if nargin < 4
        bindex = floor(length(c)/2);
    end
    cp = zeros(1, length(c));
    cp(bindex) = 1;
    z3 = evaluatelinearbasis2d(f,cp,d);
    figure(2);
    imshowneg(z3);
    print([prefix '_basis.png']);
end
