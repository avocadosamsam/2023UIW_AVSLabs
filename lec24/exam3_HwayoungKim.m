% %1
% clc, clear, close all
% height_handle=@height;
% gen_plot(height_handle,[0:.1:60])
% h1=fzero(height_handle,[25 30]) %time
% 
% %2
% clc, clear, close all
% func=@(x)sin(x.^2)+sqrt(abs(x));
% gen_plot(func,[2:.001:10]) %a
% r1=fminbnd(func,2,3) %b.rocal minima
% v1=func(r1) %c

%3
clc, clear, close all
str='HelloWorld';
scramble(str);