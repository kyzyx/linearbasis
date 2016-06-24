f = @(x,y,n) sinebasis2d(x,y,n);
cp = zeros(1,8*8);
cp(32) = 1;
function v = generatecoefs(x)
    v = zeros(1,8*8);
    v(x)=1;
end
z = evaluatelinearbasis2d(f,cp,100);
