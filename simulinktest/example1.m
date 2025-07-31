clc, clear, clear all
out=sim("sim1")

figure(1)
plot(out.I)
title('Input')
xlabel('time(sec)')
ylabel('value'), grid
axis([0 10 0 1.2])

figure(2)
plot(out.Y)
title('Output')
xlabel('time(sec)')
ylabel('value')
axis([0 10 0 1.2]), grid

figure(3)
plot(out.E)
title('Error')
xlabel('time(sec)')
ylabel('value')
axis([0 10 -1.2 0]), grid