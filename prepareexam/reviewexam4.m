clc, clear, close all
f=@(c)(2*c)./(0.2.*c.^3+c.^2+(0.8.*c)+4);
g=@(c) - f(c);
gen_plot(f,[0:0.1:10])
c= fminbnd(g,0,10)
max=f(c)

clc, clear, close all
xold=3; S=16;
error=inf;

while (error >= 1e-12)
    xnew=0.5*(xold+S/xold);
    error= abs(xnew-xold);
    xold=xnew;

end
xnew

clc, clear, close all
str='this iS a tEST for CAPS';
str=caps(str);
str