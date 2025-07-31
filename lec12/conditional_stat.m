% abs(a-sin(pi)) < 1e-14 -> return 0 or 1
% indx=find(vec<=0) -> position of the number
% indx=find(vec>0 & vec<60)

clear, clc, close all

t=[0:2:100];
ht=2.13.*t.^2-0.0013.*t.^4-0.000034.*t.^4.751;
plot(t(1:19),ht(1:19));
indx=find(ht>18 & ht<19);
%t(18) = 34s
%indx=find(ht>18)
%t(index(end))

%the meximum height of the rocket
[num,pos]=max(ht); %height
t(pos); %time, do not hard coding

plot(t(1:18),ht(1:18))
%indx=find(ht>=0)
%Time=t(index)
%plot(Time,ht(index))
