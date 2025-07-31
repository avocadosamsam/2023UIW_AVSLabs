clc, clear, clear all

f=[0:3*10^6]; 
w=2.*pi.*f; L=0.25*10^-3; C=0.1*10^-9; R=50; V0=10*10^-3;
a=R^2; b=w.*L; c=1./(w.*C);
vr=(R.*V0)./sqrt(a+((b-c).^2));


plot(w,vr,'-r'), grid
title('Function of Frequency')
legend('V(w)R')
xlabel('frequency'), ylabel('V(w)R')


