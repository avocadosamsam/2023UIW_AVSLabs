clc, clear, close all
a=1, b=5, c=6;

if (a~=0)&(b>0)&(c~=0)
    q=-(b+sgn(b)sqrt(b^2-4*a*c))/2
elseif (a~=0)&(b<0)&(c~=0)
    q=-(b+sgn(b)sqrt(b^2-4*a*c))/2
elseif (a=0)&(b~=0)&(c~=0)
    

end