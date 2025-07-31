for t=0:4
    x(t+1)=5*t-10;
    y(t+1)=25*t^2-120*t+144;
    d(t+1)=sqrt(x(t+1)^2+y(t+1)^2);
end
[minD,pos]=min(d) %closet distance
t=pos-1