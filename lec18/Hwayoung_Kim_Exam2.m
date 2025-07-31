%======1========
clc, clear, close all
years=2072;

if (rem(years,400)==0)
    result="Is a Leap Year";
elseif (rem(years,100)==0)&&(rem(years,400)~=0)
    result="Is Not a Leap Year";
elseif (rem(years,4)==0)&&(rem(years,100)~=0)
    result="Is a Leap Year";
else
    result="Is Not a Leap Year";
end
disp(result)

%=======2=======
clc, clear, close all
A=randi([-50,50],1,20)
n=1;

while(n<=20)
    if (A(n)>=0)
        A(n)=1;
    else
        A(n)=0;
    end
    n=n+1;
end
disp(A)

% %========3=======
clc, clear, close all
even=2;

while (1)
    if (even<=7)
        if (rem(7,even)==0)&&(rem(even,2)==0)&&((even^3)>40000)
            break
        end

    elseif (even>7)
        if (rem(even,7)==0)&&(rem(even,2)==0)&&((even^3)>40000)
            break
        end
    end
    even=even+1;
end

disp(even);




