%% 5. Cubic Splines
%% Uses Test Cases 'text5[letter].txt'
format long
prompt = 'Type the text file name: ';
str = input(prompt,'s');
%reading file
fileID = fopen(str,'r');
%scan first number for number of points
m = fscanf(fileID,'%f',1);
%scan the m points in two vectors: one for x vals, one for y vals
x = zeros(m,1);
y = zeros(m,1);
for i = 1:m
    x(i) = fscanf(fileID,'%f',1);
    y(i) = fscanf(fileID,'%f',1);
end
%initialize matrix to be solved
matrix = zeros(m, m);
matrix(1,1) = 1;
matrix(m,m) = 1;
%initialize solution vector
sol = zeros(m,1);
%fill rest of matrix using formula
for i=2:m-1
    %calculate rest of matrix
    h0 = x(i) - x(i-1);
    h1 = x(i+1) - x(i);
    matrix(i,i-1) = h0;
    matrix(i,i) = 2 * (h0+h1);
    matrix(i,i+1) = h1;
    %calculate solution vector using formula
    sol(i) = (3/h1) * (y(i+1)-y(i)) - (3/h0) * (y(i)-y(i-1));
end
%solve for c
C = linsolve(matrix,sol);
%solve for d
D = zeros(m-1,1);
for i=1:m-1
    hi = x(i+1) - x(i);
    D(i) = (1/(3*hi)) * (C(i+1)-C(i));
end
%solve for b
B = zeros(m-1,1);
for i=1:m-1
    hi = x(i+1) - x(i);
    B(i) = ((y(i+1)-y(i))/hi) - (2*C(i)+C(i+1))/3 * hi;
end
%print the coefficients for the m-1 equations that form the cubic spline
for i=1:m-1
    fprintf('%f %f %f %f\n', y(i), B(i), C(i), D(i));
end
%plot the cubic spline
xx = x(1):(x(2)-x(1))/10:x(m);
yy = spline(x,y,xx);
plot(x,y,'o',xx,yy)
fclose(fileID);