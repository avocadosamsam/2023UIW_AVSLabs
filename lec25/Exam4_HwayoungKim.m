%1
clear, clc, close all, format long
a=1; b=1/sqrt(2);
t=(1/4); x=1;
oldpi_est=4;
error=inf;

while (error >= 1e-12)
    y=a;
    a=(a+b)/2;
    b=sqrt(b*y);
    t=t-x*((y-a)^2);
    x=2*x;
    pi_est=((a+b)^2)/(4*t);
    error= abs(oldpi_est-pi_est);
    oldpi_est=pi_est;
end

error
pi_est

%2
clear, clc, close all
str='abcdefghijklmnopqrstuvwxyzAEIOW123';
out=is_vowel(str)

%3
clear, clc, close all
func=@(x)-1.*(x<-pi|x>pi)+cos(x).*(x>=-pi&x<=pi);
%a
gen_plot(func,[-2*pi:0.2:2*pi])
%b
g=@(x) - func(x);
x= fminbnd(g,-2,2)
%c
max=func(x)




