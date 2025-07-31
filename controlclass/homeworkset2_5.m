clear, clc, close all
%------CP 2.5-------
J=10.8*10^8;
J20=1.5*10^8;
J50=9.3*10^7;
k=10.8*10^8;
a=1, b=8;

s1=tf([k 1],[1 b])
s1_2=tf([1],[J^2 0 0])

S1=10*s1*s1_2; %step input 10
h1=1;
CL1=feedback(S1,h1);
%step(CL);

% reduced 20% J
s2_2=tf([1],[J20^2 0 0]);
S2=10*s1*s2_2;
CL2=feedback(S2,h1);
%step(CL2)

% reduced 50% J
s3_2=tf([1],[J50^2 0 0]);
S3=10*s1*s3_2;
CL3=feedback(S3,h1);
step(CL3)
