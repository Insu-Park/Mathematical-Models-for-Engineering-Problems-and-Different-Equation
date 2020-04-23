%
% 2014920017 ¹ÚÀÎ¼ö
%
% 6.19 LinReg
%

function [a, Er] = LinReg(x, y)

nx = length(x);
ny = length(y);
if nx ~= ny
    disp('ERROR: The number of elements in x must be the same as in y.')
    a1 = 'Error';
    a0 = 'Error';
    Er = 'Error';
else
    Sx = sum(x);
    Sy = sum(y);
    Sxy = sum(x.*y);
    Sxx = sum(x.^2);
    a1 = (nx * Sxy - Sx * Sy) / (nx * Sxx - Sx^2);
    a0 = (Sxx * Sy - Sxy * Sx) / (nx * Sxx - Sx^2);
a = [a1, a0];
Er = sum((y - (a1 * x + a0)).^2);
end
