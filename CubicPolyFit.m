%
% 2014920017 ¹ÚÀÎ¼ö
%
% 6.23 CubicPolyFit
%

function [a, Er] = CubicPolyFit(x, y)

nx = length(x);
ny = length(y);
m = 3;
if nx ~= ny
    disp('ERROR: The number of elements in x must be the same as in y.');
    a = 'Error';
    Er = 'Error';
else
    for i = 1:2*m
        xsum(i) = sum(x.^(i));
    end  
    A(1,m+1) = nx;
    B(1,1) = sum(y);
    for(j = 1:m)
    A(1,j) = xsum(1-j+m);
    end  
    for(i = 2:m+1)
        for(j = 1:m+1)
            A(i,j) = xsum(i-j+m);
        end
        B(i,1) = sum(x.^(i-1).*y);  
    end
    p = A\B;
    a = transpose(p);
    Er = sum((y- a(1)*x.^3 + a(2)*x.^2 + a(3)*x + a(4)).^2);
end
