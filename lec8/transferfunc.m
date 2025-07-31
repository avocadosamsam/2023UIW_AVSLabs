%-----------#CP2.1-------------
clc, clear, clear all
syms y x
p=[1,7,10];
q=[1,2];
result=conv(p,q);

Ts=tf(q,p)
pzmap(Ts)

x=-1;
y=x^2+7*x+10
%-----------#CP2.3-------------
sys=tf([1],[1,4,3,0])
subplot(2,1,1)
step(sys)
subplot(2,1,2)
impulse(sys)

