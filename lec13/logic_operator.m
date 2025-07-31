%xor
% 0 0 | 0
% 0 1 | 1
% 1 0 | 1
% 1 1 | 1
% (A and not B) or (not A and B)
A=[0 0 1 1]';
B=[0 1 0 1]';
%(A~=B)|(B~=A)

(A&~B)||(~A&B)