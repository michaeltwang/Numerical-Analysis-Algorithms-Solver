%% 6. Least Squares
%% Uses Test Cases 'text6[letter].txt'
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
%create matrix representing system of deg+1 equations
M = zeros(deg+1,deg+1);
for i=1:deg+1
    for j=1:deg+1
        M(i,j) = sum(x.^(j+i-2));
    end
end
disp(M)
%create y vector representing solution to system of equations
b = zeros(deg+1,1);
for k=1:deg+1
    b(k) = sum(y.*(x.^(k-1)));
end
disp(b)
%calculate solution and print
a=inv(M)*b;
for i=1:length(a)
    fprintf('%f ',a(i));
end
%create plot and display
xx=[x(1):0.1:x(m)];
yy=0;
for i=1:length(a)
    yy = yy + a(i)*xx.^(i-1);
end
plot(xx,yy,x,y,'*');
fclose(fileID);