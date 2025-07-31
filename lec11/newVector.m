clc, clear, close all
a=randi(100,1,10)
b=randi(100,1,10)
c=[a b];
c(1:2:end)=a
c(2:2:end)=b
