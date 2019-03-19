%% 1. Horner
%% Uses hornerf.m function
%% Uses Test Cases 'text1[letter].txt'
format long
prompt = 'Type the text file name: ';
str = input(prompt,'s');
%reading file
fileID = fopen(str,'r');
%scan first number for degree of polynomial
deg = fscanf(fileID,'%f',1);
%scan the coefficients
coeff = fscanf(fileID,'%f', deg+1);
%scan the value we are evaluating the function as
xo = fscanf(fileID,'%f');
%flip input of coefficients so horner function works
a = flipud(coeff);
%call horner function
A = hornerf(a,xo);
%display P(xo) and P'(xo)
disp(A);
fclose(fileID);