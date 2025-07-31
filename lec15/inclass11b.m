%x=11;
%x=5;
x=-2;
if (x>10)
    y=log(x)
elseif (x>=0)&(x<=10)
    y=sqrt(x)
elseif (x<0) %safer
    y=exp(x)-1
end