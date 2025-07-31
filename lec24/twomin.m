function [sol] = twomin(func_handle,interval1,interval2)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
B=fminbnd(func_handle,interval1,interval2);
sol=B;
end