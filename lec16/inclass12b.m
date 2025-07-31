% for k=1:1:15
%     f(k)=5*k^2-2*k;
%     f
% end
% %sum(f)
% 
% sum=0;
% for n=1:1:15
%     sum=f(n)+sum;
% end
% 
% disp(sum)

total=0;  %not using indexing, use counter
for k=1:15
    total=5*k^2-2*k+total;
end
disp(total)