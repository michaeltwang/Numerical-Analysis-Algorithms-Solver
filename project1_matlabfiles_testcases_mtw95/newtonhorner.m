%% 2. Newton Raphson with Horner
%% Uses the hornerf.m function
%% Uses Test Cases 'text2[letter].txt'
format long
prompt = 'Type the text file name: ';
str = input(prompt,'s');
%reading file
fileID = fopen(str,'r');
%scan first number for degree of polynomial
deg = fscanf(fileID,'%f',1);
%scan the coefficients
coeff = fscanf(fileID,'%f', deg+1);
%scan the initial value we are evaluating the function as
ro = fscanf(fileID,'%f',1);
%scan epsilon
e = fscanf(fileID,'%f',1);
%scan N, max iterations
N = fscanf(fileID,'%d',1);
%flip input of coefficients so horner function works
a = flipud(coeff);
%let calculated error = 1.0 for now
error = 1.0;
%let counter = 0 for now
count = 0;
while error >= e & count<=N
    %call horner function
    A = hornerf(a,ro);
    %calculate r1 = ro - (P(xo)/P'(xo))
    r1 = ro - (A(1) / A(2));
    %calculate error
    error = abs(r1-ro);
    %update ro
    ro = r1;
    %increment count
    count = count+1;
end
%display ro, solution within tolerance
disp(ro);
fclose(fileID);