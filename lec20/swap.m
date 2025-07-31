function [x,y] = swap(x,y)
%The function swap receives two values, swaps them,
%and returns the result.
%The syntax for the call: [a,b]=swap(a,b)
disp("change...")
num=x;
x=y;
y=num;
end