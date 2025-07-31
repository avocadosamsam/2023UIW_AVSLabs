clc, clear, close all
x=randi([1,10],8,7)
%1
B=x(:,[2:2:end])
C=x([1:2:end],:)
%2
x(3,:)=zeros(1,size(x,2));
%3
x(:,7)=ones(size(x,1),1);
%4
x=[x;x(1,:)];
new_size=size(x);
%5
x(1,:)=[];
new_size=size(x);
%6
col_sum=sum(x)
tot_sum=sum(x(:))
row_max=max(x,[],2)
row_min=min(x,[],2)
col_max=max(x)
col_min=min(x)
max_all=max(x(:))
%7
y=reshape(x,28,2)


