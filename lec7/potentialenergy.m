clc, clear, close all
k=250;
x=[-5:0.5:5];
y=0.5*k.*x.^2;
plot(x,y,':cd'),grid
xlabel('x'),ylabel('y');
title('Plot of the Potential Energy');
text(0,1500,'The equation of PE (k=250)');