%------1.Fibonacci Numbers------
%Hwayoung Kim, Julian jehle
clc, clear, close all
f(1)=1; f(2)=1; f(3)=1;
count=0;

for n=1:18
    f(n+3)=f(n+2)+f(n+1)
    count=count+1;
end

disp(max(f))
disp(count)
%This Fibonacci Numbers starts with f(4), so the count number should be 18

%------2-------
clc, clear, close all
grade=72

if (grade>89)&(grade<101)
    disp('A');
elseif (grade>79)&(grade<90)
    disp('B');
elseif (grade>69)&(grade<80)
    disp('C');
elseif (grade>59)&(grade<70)
    disp('D');
else
    disp('F');
end

%------3--------
clc, clear, close all
%step1
a=3; b=9;
while (b>0)
    %step2
    if (a>b)
        key=mod(a,b);
    else
        key=mod(b,a);
    end

    a=b; %step3
    b=key; %step4
end
disp(a)