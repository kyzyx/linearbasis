pkg load signal;
x = 0:pi/64:8*pi;
y = sawtooth(x);

%f = @(x,n) constantbasis(x,n,0.5);
%f = @(x,n) rbfbasis(x,n,1,1);
%f = @(x,n) polybasis(x,n);
%f = @(x,n) sinebasis(x,n);
f = @(x,n) haarwaveletbasis(x,n);
c = linearbasis(f, x, y, 64);
y2 = evaluatelinearbasis(f,c,x);

hold on;
plot(x,y,'k');
plot(x,y2,'r');
axis([0 25 -1.2 1.2]);
