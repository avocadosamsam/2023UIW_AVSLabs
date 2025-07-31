clc, clear, close all
%1
% A=magic(4);
% B=A(2:3,2:3);
% C=A(:,3);
% D=A([2:2:end],[1:2:end]);
% E=flip(A,2);

%2
x=[-4,-1,0,2,10];
y=[-5,-2,2,5,9];
z=x>y;

%3
load('./Z.mat');
A=Z(:,:,3)
C=Z(:,:,2);
B=C(2,:);
A1=Z(:,:,1);
%C=[A1(1,:),C(1,:),A(1,:)]
A(:,3)=zeros(1,size(A,3))
%h=zeros(Z(:,:,3));
%x(3,:)=zeros(1,size(x,2));