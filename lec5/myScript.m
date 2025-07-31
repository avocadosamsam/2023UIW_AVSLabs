% plot graph
clc, clear
x=linspace(0.1,2,125); % Create data points
z=5*exp(0.3*x)+log(x); % Create points for z
plot(x,z) % Plot
xlabel('x'), ylabel('y'), title('myScript'), grid % Label
axis tight