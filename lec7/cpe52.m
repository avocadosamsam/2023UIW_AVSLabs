clc, clear, clear all
x=linspace(0,(3*pi)/2,250)

y1=cos(x)
y2=1-(x.^2/factorial(2))+(x.^4/factorial(4))-(x.^6/factorial(6))+(x.^8/factorial(8))-(x.^10/factorial(10))

plot(x,y1,'-.g',x,y2,'--r'), grid
legend('y1','y2')
