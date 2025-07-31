clear, clc
x=linspace(0,6*pi,200);
y=100*exp(-0.5*x)*sin(2*x);

x2=0:0.1:deg2rad(60);
y2=cos(x2);

subplot(1,2,1);
plot(x1,y1)
subplot(1,2,2);
plot(x2,y2);
