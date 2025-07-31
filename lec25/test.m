a=1; b=1/sqrt(2);
t=(1/4); x=1;
y=a;
    a=(a+b)/2;
    b=sqrt(b*y);
    t=t-x*((y-a)^2);
    x=2*x;
    pi_est=((a+b)^2)/(4*t)
    %error= abs(oldpi_est-pi_est);
    %oldpi_est=pi_est;

