%
% 2014920017 ¹ÚÀÎ¼ö
%
% 3.25 BisecAll-Roots
%

function R = BisecAll_Roots(fun, a, b, TolMax)

h = (b - a) / 10;
arr =  [0 0 0 0];
loc = 1;

for i = 1 : 10
    left = a + (i - 1) * h;
    right = a + i * h;
    if fun(left) * fun(right) < 0
        FxNS = fun((left + right) / 2);
        while FxNS ~= 0
            xNS = (left + right) / 2;
            toli = (right - left) / 2;
            FxNS = fun(xNS);
            if toli < TolMax
                arr(loc) = xNS;
                loc = loc + 1;
                break;
            end
            if fun(left) * FxNS < 0 
                right = xNS;
            else
                left = xNS;
            end
        end
    else
        continue;
    end
end
flag = true;
division = 100;
while flag == true
    flag = false;
    h = (b - a) / division;
    for i = 1 : division
        left = a + (i - 1) * h;
        right = a + i * h;
        if fun(left) * fun(right) < 0
            if arr(1) >= left && arr(1) <= right
                continue;
            elseif arr(2) >= left && arr(2) <= right
                continue;
            elseif arr(3) >= left && arr(3) <= right
                continue;
            elseif arr(4) >= left && arr(4) <= right
                continue;
            end
            flag = true;
            FxNS = fun((left + right) / 2);   
            while FxNS ~= 0
                xNS = (left + right) / 2;
                toli = (right - left) / 2;
                FxNS = fun(xNS);
                if toli < TolMax
                    arr(loc) = xNS;
                    loc = loc + 1;
                    break;
                end
                if fun(left) * FxNS < 0 
                    right = xNS;
                else
                    left = xNS;
                end
            end
        else
            continue
        end
    end
    division = division * 10;
end

R = arr(1:loc-1);
