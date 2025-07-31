%Anonymous functions give 
%fhandle=@(arglist)[expression]
%we don't need to creat handle

sqr=@(x)x.^2;
x=[1:5];
a=sqr(x)

G=@(x)x.^2-2 %->funcion handle
x=fzero(G,[1,2])
G(x)

%mypoly=@(x)(x.^3+3.*x-1)
%x=[-3:.1:3];
%y=mypoly(x)

clc, clear, close all
func=@(x,y)x.^2+3.*x.*y;
x=[0:3]
y=[3:6]
a=func(x,y)