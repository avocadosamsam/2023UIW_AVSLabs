function [area,volume] = Mycylinder(h,r)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
base=pi*r^2;
volume=base*h;
area=(2*pi*r*h)+(2*base);
end