%-----------1-----------
clc, clear, clear all
syms x a
f=(x-1)*(x-a)*(x+pi)*(x+2)*(x+3);
F=expand(f) % 1-a)
pretty(F) % 1-b)
solve(f,x) % 1-c)

%-----------2------------
clc, clear, clear all
t=linspace(0,100,1601);
x=sin(t).*(exp(cos(t))-2.*cos(4.*t)-sin(t./12).^5);
y=cos(t).*(exp(cos(t))-2.*cos(4.*t)-sin(t./12).^5);
subplot(2,1,1);
plot(t,x,'-r',t,y,'-k');
subplot(2,1,2);
plot(x,y);

%-----------3-------------
clc, clear, clear all
n=[1:1:10];
F1=log10(factorial(n)); %Formula
F2=n.*log10(n)-n+log10(sqrt(2.*pi.*n)); %Sterling

subplot(1,2,1), plot(F1,n,'-r'),grid; %Left-Formula
xlabel('n'), ylabel('F1');
title('The Formula');
legend('F1');

subplot(1,2,2),plot(F2,n,'-k'),grid; %Right-Sterling
xlabel('n'), ylabel('F2');
title('The Sterling Formula');
legend('F2');
