x=linspace(1,100)
y=20*log10(2*x)
semilogx(x,y)
title('log10 graph 1')

x=logspace(1,100,100)
semilogx(x,y)
title('logspace graph 1')