%% Horner Helper Function
%% Used by horner2.m and newtonhorner.m
function x = hornerf(a,x_0)
%get number of coefficients
n = length(a);
%initialize new array for coefficients of "second" polynomial
b = zeros(n-1,1);
b(1) = a(1);
result = a(1);
for j = 2:n
    %calculate P(xo)
    result = result*x_0 + a(j);
    %calculate "second" polynomial coefficients
    if (j<n)
        b(j) = result;
    end
end
result2 = b(1);
for k = 2:n-1
    %calculate P'(xo)
    result2 = result2*x_0 + b(k);
end
%return results as a column vector with 2 rows
x = zeros(2,1);
x(1) = result;
x(2) = result2;
