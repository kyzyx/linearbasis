z = double(imread("ffbw.png"))/255;
d = length(z);

% Haar wavelets
%f = @(x,y,n) haarwaveletbasis2d(x,y,n);
%c = linearbasis2d(f, d, z, 1023);
%c = c.*(abs(c)>0.03);
%[num2str(sum(abs(c)>0.03)) ' nonzero wavelet coefficients']
%z2 = evaluatelinearbasis2d(f, c, d);

% Local bases
%f = @(x,y,n) constantbasis2d(x,y,n,15);
f = @(x,y,n) rbfbasis2d(x,y,n,15,0.15);
c = linearbasis2d(f,d,z,225);
z2 = evaluatelinearbasis2d(f, c, d);

%f = @(x,y,n) cosinebasis2d(x,y,n);
%f = @(x,y,n) polybasis2d(x,y,n);
%c = linearbasis2d(f,d,z,255);
%z2 = evaluatelinearbasis2d(f, c, d);

figure 1;
imshow(z);
figure 2;
imshow(z2);
