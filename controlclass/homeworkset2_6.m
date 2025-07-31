clc, clear, close all
%------CP2.6-------
%block 1
s1=tf(1,[1,1]);
s2=tf([1,0],[1,0,2]);
S1=s1*s2;
h1=tf([4,2],[1,2,1]);
CL1=feedback(S1,h1)
%block 2
s3=tf(1,[1,0,0]);
h2=tf(50,[1,0,0]);
CL2=feedback(s3,h2,+1)
%block 3
S2=CL1*CL2;
h3=tf([1,0,2],[1,0,0,14]);
CL3=feedback(S2,h3)

tot=3*CL3;
%(2)
pzmap(tot)
%(3)
b=[1 2 1 14 28 14 0 0 0];
a=[1 3 5 25 0 -77 -94 -1135 -2468 -3598 -7700 -5600 -1400];
[b,a]=eqtflength(b,a);
[z,p,k]=tf2zp(b,a)
