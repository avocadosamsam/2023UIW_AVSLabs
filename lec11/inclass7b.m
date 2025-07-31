%cpe1.m
%Plots the Frequency Response and finds the Resonance Frequency
clear,clc,close

%Constants for Voltage Equation
R = 50;
L = .25e-3;
C = .1e-9;
Vo = 10e-3;

%Frequency Range
f = [0:1000:3e6];     %frequency [Hz]
w = 2*pi*f;           %Angular frequency [rad/s]

% The Equations of using Element-wise Operator
B = w.*L;
D = 1./(w.*C);

A = sqrt( R^2 + (B-D).^2  );
% Voltage wrt to angular Frequency
Vr = (R*Vo)./A;

% Plot the Frequency Response
plot(w,Vr,'r')
xlabel('angular frequency [rad/s]'), ylabel('Voltage [V]'),grid,...
    title('Resonance Frequency Response')

%Find maximum voltage using "max"
[maxVal, Pos]=max(Vr)
%Find frequency
fmax=f(Pos) % w와 f는 같은 차원의 수!

