clc, clear, close all
x=[-2:0.01:4];
y1=3*x.^3-26*x+10;
y2=9*x.^3-26;
plot(x,y1,'r:+',x,y2,'--y.'),grid
legend('y1','y2')

figure
subplot(2,1,1),plot(x,y1,'r:+');
subplot(2,1,2),plot(x,y2,'--yd');
title('subplot Example');
