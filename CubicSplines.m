%
% 2014920017 ¹ÚÀÎ¼ö
%
% 6.24 CubicSplines
%

function Yint = CubicSplines(x, y, xint)

nx = length(x);
ny = length(y);
if(nx ~= ny)
    disp('ERROR: The number of elements in x must be the same as in y.');
    Yint = 'error';
else
    % natural cubic splines
    h = 1:1:nx;
    A = 1:1:nx;
    B = zeros(nx-2, nx-2);
    C = 1:1:nx-2;
    A(1) = 0;
    A(5) = 0;
    for i = 1:nx-1
        h(i) = x(i+1)-x(i);
    end 
    for i = 1:nx-2
        C(i) = 6 *((y(i+2)-y(i+1))/h(i+1)-(y(i+1)-y(i))/h(i));
    end
    for i = 1:nx-2
        B(i,i) = 2 * (h(i) + h(i+1));
        if i ~= 1
            B(i,i-1) = h(i);
        end
        if i ~= nx-2
            B(i,i+1) = h(i+1);
        end
    end
    coefficient = (B\(C'))';
    for i = 1:nx-2
        A(i+1) = coefficient(i);
    end
    for i = 1:nx-1
        if x(i) < xint && xint < x(i+1) 
            Yint = (x(i+1) - xint)^3 * A(i) / (6 * h(i)) + (xint - x(i))^3 * A(i+1)/(6*h(i)) + (y(i)/h(i)-A(i)*h(i)/6)*(x(i+1)-xint) + (y(i+1)/h(i)-A(i+1)*h(i)/6)*(xint-x(i));
        end
    end
end

