clc, clear, close all
A=rand(5)
B=A(:,4)
C=A(2,:)
A(:,4)=C'
A(2,:)=B'

%[minVal, Pos]=min(vec)
%minNum=vec(Pos)

%[maxVal, Pos]=max(vec)
%maxNum=vec(Pos)
