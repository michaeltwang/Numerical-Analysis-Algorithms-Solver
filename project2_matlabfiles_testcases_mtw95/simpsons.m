%% 7. Simpson's Composite Rule
%% Uses Test Cases 'text7[letter].txt'
format long
prompt = 'Type the text file name: ';
str = input(prompt,'s');
%reading file
fileID = fopen(str,'r');
%scan first line for function
func = fscanf(fileID,'%s',1);
%scan second line for a, limit of integration
a = fscanf(fileID,'%f',1);
%scan first line for b, limit of integration
b = fscanf(fileID,'%f',1);
%scan first line for number of subintervals
n = fscanf(fileID,'%f',1);
%calculate the length of a subinterval
h = (b-a)/n;
%create a vector of each subinterval
x = a:h:b;
%get function from inputted string using inline and feval
fun = inline(func);
%calculate f(x0)
f1 = feval(fun, x(1));
%calculate f(xn)
fnn = feval(fun, x(n+1));
%calculate f(xi) for i even
even = 0;
for i=3:2:length(x)-1
    f = feval(fun, x(i));
    even = even + f;
end
%calculate f(xi) for i odd
odd = 0;
for i=2:2:length(x)-1
    f = feval(fun, x(i));
    odd = odd + f;
end
%disp(even); disp(odd); disp(f1); disp(fnn);
%calculate final value using above values
ans = h/3 * (f1 + 2*even + 4*odd + fnn);
disp(ans);
fclose(fileID);