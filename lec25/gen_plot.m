function [] = gen_plot(func_handle,interval)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
plot(interval, func_handle(interval));
grid
end