% x=rand(1,100)
% indx=find(x>0.4&x<0.6)
% %x(x>0.4 & x<0.6)
% x(indx)

%======================
% R=rand(5,7)
% q=(R>0.3 & R<0.9)
% R(q)

%======================
% A=magic(4)
% n=1; m=1;
% count=1;
% for n=1:4
%     if isprime(A(n,m))==1
%         C(count)=A(n,m);
%         count=count+1;
%     end
% 
%     for m=1:4
%         if isprime(A(n,m))==1
%             C(count)=A(n,m);
%             count=count+1;
%         end
%     end
% end
% disp(C)

% A=magic(4)
% [NumR,NumC]=size(A)
% indx=1;
% 
% for r=1:NumR
%     for c=1:NumC
%         if isprime(A(r,c))
%             C(indx)=A(r,c);
%             indx=indx+1;
%         end
%     end
% end

A=magic(4)
%make it 0/1
%B=isprime(A)
%C=A(B)
indx=A(isprime(A))
A(indx)