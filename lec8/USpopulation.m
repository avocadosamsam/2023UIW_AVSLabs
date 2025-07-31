clc, clear, close all
file_path='./UScensusTable.mat';
uspo=load(file_path);

a=0.03134; b=1.5887e-10;
t=[0:10:220];
p=3929700;
A=a.*p.*exp(a.*t); B=b.*p.*exp(a.*t);
Pt=A./ (a-(b.*p)+B );

plot(uspo.year,uspo.pop,'r',uspo.year,Pt,'k')
