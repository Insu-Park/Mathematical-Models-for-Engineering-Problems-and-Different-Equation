%
% 2014920017 ¹ÚÀÎ¼ö
%
% 3.17 SquareRoot
%

function Xs = SquareRoot(p)

Xest = p;
imax = 20;
tol=10^(-6);

if p < 0 
    Xs = ('Given Number is not positive');
else
    for i = 1 : imax
        Xi = Xest - (Xest^2-p) / (Xest * 2);
        if abs((Xi - Xest)/Xest) < tol
            Xs = Xi;
            break
        end
        Xest = Xi;
    end
    if i == imax
        fprintf('There is no answer in %f iteration.\n', imax);
        Xs = ('No answer');
    end
end