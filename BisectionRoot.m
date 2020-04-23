%
% 2014920017 ¹ÚÀÎ¼ö
%
% 3.16 BisectionRoot
%

function Xs = BisectionRoot(Fun, a, b)
tolerance = 10^(-6);

if Fun(a)*Fun(b)>0 
    disp('Error:The function has the same sign at points a and b.')
else
    while 1
        xNS = (a + b) / 2;
        toli = (b - a) / 2;
        FxNS = Fun(xNS);
        if FxNS == 0 || toli < tolerance
            Xs = xNS;
            break;
        end
        if Fun(a)*FxNS<0 
            b = xNS;
        else
            a = xNS;          
        end
    end
end