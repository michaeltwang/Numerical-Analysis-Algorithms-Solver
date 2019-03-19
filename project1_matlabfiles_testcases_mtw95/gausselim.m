%% Gaussian Elimination Helper Function
%% Used by cramers.m
function det = gausselim(A, b, col)
n = size(A, 1); %size
r = zeros(n, 1); %keep track of rows
for i = 1:1:n    
   r(i) = i;
end
%% Replace correct column of matrix A with solution vector b
if col ~= 0
    for i=1:n
        A(i,col) = b(i);
    end
end
%% Apply Gaussian elimination and rearrange permutation vector
sign = 1;
for k = 1 : 1 : n % Go through each element 
    % Check if Akk is 0, if so find element below Akk that is not 0 to swap
    if A(r(k), r(k)) == 0      
        for m = k : 1 : n        
            if A(r(m), r(k)) ~= 0  
                %swap rows, change sign
                temp_r = r;
                r(k) = temp_r(m);
                r(m) = temp_r(k);
                sign = sign * -1;
            else
                fprintf('Error\n');
                return;
            end
        end
    end
    % Eliminate A elements below current row/diagonal to make all 0   
    for i = k+1 : 1 : n
        zeta = A(r(i), k) / A(r(k), k);
        for j = k : 1 : n
            A(r(i), j) = A(r(i), j) - A(r(k), j) * zeta;                       
        end
    end
end
% Compute determinant using diagonals
det = sign;
for i = 1:1:n
    det = det * A(r(i), i);
end
end