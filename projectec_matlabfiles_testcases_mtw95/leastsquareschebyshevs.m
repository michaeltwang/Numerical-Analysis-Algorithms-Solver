% x=[0;1;2;3;4;5;6;7;8;9];
% y=[45.13;51.71;60.17;64.83;65.24;65.17;67.65;79.8;96.13;115.19];
%% EC Least Squares with Chebyshev Polynomials
%% Uses Test Cases 'textec[letter].txt'
format long
prompt = 'Type the text file name: ';
str = input(prompt,'s');
%reading file
fileID = fopen(str,'r');
%scan first number for number of points
m = fscanf(fileID,'%f',1);
%scan second number for degree of polynomial
deg = fscanf(fileID,'%f',1);
%scan the m points in two vectors: one for x vals, one for y vals
x = zeros(m,1);
y = zeros(m,1);
for i = 1:m
    x(i) = fscanf(fileID,'%f',1);
    y(i) = fscanf(fileID,'%f',1);
end
%create matrix to hold values of each polynomial T
T = ones(deg+1,m);
T(1,:) = ones(m,1);
T(2,:) = x/9;
%Recursive formula
for i=3:deg+1
    for j=1:m
        T(i,j) = 2*(x(j)/9)*T((i-1),j) - T((i-2),j);
    end
end
%create matrix for equations, vector for solution
M = zeros(deg+1,deg+1);
b = zeros(deg+1,1);
for i=1:deg+1
    %calculate matrix M for equations
    for j=1:deg+1
        M(i,j)= sum(T(i,:).*T(j,:));
    end
    %calculate solution vector b
    meow = 0;
    for k=1:m
        meow = meow + (y(k).*T(i,k));
    end
    b(i) = meow;
end
disp(M)
disp(b)
%calculate coefficients
a=inv(M)*b;
%display coefficients
disp(a);
%plot
xx=[0:0.1:9];
yy=a(1) + a(2)*(xx/9) + a(3)*(2*(xx/9).^2-1) + a(4)*(4*(xx/9).^3-3*(xx/9));
plot(xx,yy,x,y,'*');
fclose(fileID);