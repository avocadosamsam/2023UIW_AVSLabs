clc, clear, close all
x=linspace(0,6*pi,200)
y=100*exp(-.5*x).*sin(2*x)

x1=[0:0.1:60]
y1=cos(x1)

subplot(2,1,1), plot(x,y,'--r.')
subplot(2,1,2), plot(x1,y1,'-.mo')

