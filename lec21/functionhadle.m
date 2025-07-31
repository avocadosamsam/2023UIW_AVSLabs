clc, clear, close all
sine_handle=@sin
x=[0:.01:2*pi];
y=sine_handle(x)
plot(x,y)

%myHandle=@sumpan
%[Npos,Nneg]=myHandle(A)
%=============================
%handle=pointer
%we cannot pass funtion to function
