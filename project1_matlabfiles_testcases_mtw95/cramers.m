%% 3. Cramer's Rule
%% Uses gausselim.m function
%% Uses Test Cases 'text3[letter].txt'
format long
prompt = 'Type the text file name: ';
str = input(prompt,'s');
%reading file
fileID = fopen(str,'r');
%scan first number for dimension of matrix
dim = fscanf(fileID,'%f',1);
matrix = zeros(dim,dim);
%scan the matrix values
matrix = fscanf(fileID,'%f', [dim,dim]);
%transpose matrix to make it correct
matrix = matrix.';
%scan the solution values
sol = fscanf(fileID,'%f', dim);
%call gausselim to calculate determinants, use determinants to calculate solutions x
determinants = zeros(dim,1);
x = zeros(dim,1);
%call gausselim.m function for A and display
determinantA = gausselim(matrix,sol,0);
%gausselim for A1 to An and display
for i=1:dim
    determinants(i) = gausselim(matrix,sol,i);
    %calculate x1 to xn
    x(i) = determinants(i) / determinantA;
end
%display output
fprintf('Determinant A: %f\n',determinantA);
for i=1:dim
    fprintf('Determinant A%d: %f\n',i,determinants(i));
end
for i=1:dim
    fprintf('x%d: %f\n',i,x(i));
end
fclose(fileID);