%
% 2014920017 ¹ÚÀÎ¼ö
%
% 4.27 CondNumb_One
%

function c = CondNumb_One(A)
[R, C] = size(A);
if(R ~= C)
  disp("error: matrix A must be square matrix");
elseif(det(A) == 0)
  disp("error: inverse of A doesn't exist");
else
  Ainv = inv(A);
  normA = norm(A, 1);
  normAinv = norm(Ainv, 1);
  c = normA * normAinv;  
end