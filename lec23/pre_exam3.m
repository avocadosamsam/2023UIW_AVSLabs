clc, clear, close all
%1
y=@myfunc;
%a
gen_plot(y,[-1:.1:5])
%b
x=fminbnd(y,0,2)
%c
myfunc(x)

%2
clear, clc, close all
func=@(x)(x.^2.+x).*(x<1)+sin(x).*(x>=1);
gen_plot(func,[-1:0.2:2*pi])
x1=fzero(func,[-2 -.75])
x2=fzero(func,[-.5 1])
x3=fzero(func,[2 4])

%3
clear, clc, close all
str='HMealtlloa!b';
[str1,str2]=decode(str)
