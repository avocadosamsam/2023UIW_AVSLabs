%========1=========
clear, clc, close all
format rat

for i=1:5 %cloumn
    for j=1:5 %row
        f(i,j)=(1/(i+j-1));
    end
end
disp(f)

%========2=========
clc, clear, close all
format short
x=0;
error=0;

while (error<1)
    A=exp(x);
    B=1+x+(x^2/2)+(x^3/6);
    error=((A-B)/B)*100;
    x=x+0.001;
end

disp(error)
disp(x)

%=======3========
clc, clear, close all
weight=2;

if (package<=2)
    charge=15;

elseif (package>2)&(package<=70)
    extraweight=weight-2;
    charge=15+ExtraWeighth*5;

elseif (package>70)&(package<=100)
    extraweight=weight-2;
    charge=15+ExtraWeighth*5+15;

else
    charge = "We can not afford over 100 pounds";
end

disp(charge)

%========Loop#1========
clc, clear, close all
B=randi(10,1,50);
num=0; i=1;
while (num<50)
    num=num+B(i);
    B(i)=0;
    i=i+1;
end
disp(B)

%======Loop#2=======
clc, clear, close all
x=-2;
n=1;

while (x<=5)
    if (x<=-1)
        f(n)=15;
    elseif (x>-1)&(x<=1)
        f(n)=-5*x+10;
    elseif (x>1)&(x<=3)
        f(n)=-10*x^2+35*x-20;
    elseif (x>3)&(x<=4)
        f(n)=-5*x+10;
    elseif (x>4)
        f(n)=-10;
    end
    n=n+1;
    x=x+0.1;
end
plot(f)
