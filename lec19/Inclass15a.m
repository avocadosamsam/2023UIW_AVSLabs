%Logical array
count=0;
x=sin(linspace(0,10*pi,100));
%count=numel(find(x>0))

for n=1:numel(x)
    if x(n)>0
        count=count+1;
    end
end
disp(count)