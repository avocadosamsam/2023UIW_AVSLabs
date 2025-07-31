clc, clear, close all
a=0; b=5; c=-6;

if (a~=0)&(b>0)&(c~=0)
    disp("The equation is a quadratic equation")
    q=-(b+sqrt(b^2-4*a*c))/2
elseif (a~=0)&(b<0)&(c~=0)
    disp("The equation is a quadratic equation")
    q=-(b-sqrt(b^2-4*a*c))/2    
elseif (a==0)&(b~=0)&(c~=0)
    disp("The equation is a linear equation")
    x2=-(c/b)
elseif (a==0)&(b==0)&(c~=0)
    disp("The equation is c=0 with c not 0,has no solution")
elseif (a==0)&(b==0)&(c==0)
    disp("The equation is =0=, any x solves the equation")

end