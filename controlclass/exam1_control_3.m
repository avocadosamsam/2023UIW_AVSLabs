clc, clear, close all
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
step(tot)
