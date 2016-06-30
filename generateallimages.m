generateimages('constant', @(x,n)constantbasis(x,n,1),25,2);
close all;
generateimages('rbf', @(x,n)rbfbasis(x,n,1,1),25,2);
close all;
generateimages('wavelet', @(x,n)haarwaveletbasis(x,n),32,14);
close all;
generateimages('poly', @(x,n)polybasis(x,n),20,3);
close all;
generateimages('sine', @(x,n)sinebasis(x,n),8,2);
close all;
generateimages2d('constant2d', @(x,y,n)constantbasis2d(x,y,n,15),225,3);
close all;
generateimages2d('rbf2d', @(x,y,n)rbfbasis2d(x,y,n,15,0.1),225,3);
close all;
generateimages2d('wavelet2d', @(x,y,n)haarwaveletbasis2d(x,y,n),1023);
close all;
generateimages2d('poly2d', @(x,y,n)polybasis2d(x,y,n),225);
close all;
generateimages2d('cosine2d', @(x,y,n)cosinebasis2d(x,y,n),224);
close all;
z = double(imread("ffbw.png"))/255;
d = length(z);
f = @(x,y,n) haarwaveletbasis2d(x,y,n);
c = linearbasis2d(f, d, z, 1023);
c = c.*(abs(c)>0.03);
[num2str(sum(abs(c)>0.03)) ' nonzero wavelet coefficients']
z2 = evaluatelinearbasis2d(f, c, d);
figure(1);
imshow(z2);
['wavelet2d squared error ' num2str(sum(sum((z-z2).^2)))]
['wavelet2d absolute error ' num2str(sum(sum(abs(z-z2))))]
print('wavelet2d_image.png');
f = @(x,y,n) cosinebasis2d(x,y,n);
c = linearbasis2d(f, d, z, 1023);
c = c.*(abs(c)>0.006);
[num2str(sum(abs(c)>0.006)) ' nonzero cosine coefficients']
z2 = evaluatelinearbasis2d(f, c, d);
figure(1);
imshow(z2);
['cosine2d squared error ' num2str(sum(sum((z-z2).^2)))]
['cosine2d absolute error ' num2str(sum(sum(abs(z-z2))))]
print('cosine2d_reduced_image.png');
