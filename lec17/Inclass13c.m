clc, clear, close all
xmax=0;
count=0;
y=10*(1-exp(-xmax/4));

while y<9.8
    xmax=xmax+0.001;
    y=10*(1-exp(-xmax/4));
    count=count+1;
end
disp(count)
disp(y)
disp(xmax)
