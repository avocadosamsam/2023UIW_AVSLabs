clc, clear, close all
func=@(x)20*x.^2-200.*x+3;
%a
gen_plot(func,[-10:.1:20]);
%b
num=fminbnd(func,-10,10)
%c
func(num)
