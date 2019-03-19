%% 4. Neville's Method
%% Uses Test Cases 'text4[letter].txt'
format long
prompt = 'Type the text file name: ';
str = input(prompt,'s');
%reading file
fileID = fopen(str,'r');
%scan first number for n
n = fscanf(fileID,'%f',1);
%scan second number for xo
xo = fscanf(fileID,'%f',1);
%scan the n+1 points
x = zeros(n+1,1);
y = zeros(n+1,1);
for i = 1:n+1
    x(i) = fscanf(fileID,'%f',1);
    y(i) = fscanf(fileID,'%f',1);
end
%initialize P tables, fill diagonals with y values
P = zeros(n+1,n+1);
for k=1:n+1
    P(k,k) = y(k);
end
%for each diagonal, calculate the next diagonal
for d=2:n+1
    for i=1:n-d+2
        j = i + d - 1;
        %calculate P(i,j)
        P(i,j) = ( P(i+1,j)*(xo-x(i)) - P(i,j-1)*(xo-x(j)) )/ (x(j)-x(i));
    end
end
fprintf('P(x_0)=%f\n',P(1,n+1));
fclose(fileID);