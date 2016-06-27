function v = haarwaveletbasis2d(x, y, n)
    if n == 0
        v = ones(size(x));
    else
        t = mod(n+2,3);
        res = floor(log2(n)/2);
        idx = floor((n - 4**res)/3);

        rc = 2**res;
        xc = mod(idx,rc);
        yc = floor(idx/rc);

        v1 = x > xc/rc & x <= (xc+1)/rc & y > yc/rc & y <= (yc+1)/rc;

        t0 = x > xc/rc & x <= (xc+0.5)/rc;
        t1 = y > yc/rc & y <= (yc+0.5)/rc;
        t2 = 1-xor(t0,t1);
        
        if t == 0
            v = v1 .* (2*t0-1);
        elseif t == 1
            v = v1 .* (2*t1-1);
        else
            v = v1 .* (2*t2-1);
        end
    end
end
