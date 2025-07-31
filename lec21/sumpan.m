function [p,n] = sumpan(arr)
%[Npos, Nneg]=sumpan(A)
%   Npos: The sum of positive num of A
%   Nneg: The sum of negative num of A
po=arr(arr>=0);
na=arr(arr<0);
p=sum(po);
n=sum(na);
%Npos=sum(sum(A>=0));
%Nneg=sum(sum(A<0));

end