%
% 2014920017 ¹ÚÀÎ¼ö
%
% 4.21 GaussPivot
%

function x = GaussPivot(a,b)

ab = [a, b];
[R, C] = sizeof(ab);
l=1;
for j = 1:R - 1
    if ab(j,j) == 0
        for k = j + 1:R
            while abs(ab(l,j)) < abs(ab(k,j))
                abTemp = ab(j,:);
                ab(j,:) = ab(k, :);
                ab(k,:) = abTemp;
                break;
            end
        end
    end
    for i = j + 1:R
        ab(i,j:C) = ab(i,j:C) - ab(i,j)/ab(j,j)*ab(j,j:C);
    end
    l=l+1;
end
x = zeros(R,1);
x(R) = ab(R,C) / ab(R,R);
for i = R - 1:-1:1
    x(i) = (ab(i,C) - ab(i,i + 1:R) * x(i + 1:R)) / ab(i,i);
end
end