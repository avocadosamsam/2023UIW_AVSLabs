function [] = palindorme(arg)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
arg2=arg(end:-1:1);
if (arg==arg2)
    disp("This word is palindrome");
else
    disp("This word is not palindrome");
end