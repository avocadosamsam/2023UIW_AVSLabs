clc, clear, close all

eqn1=@equation1;
gen_plot(eqn1,[0:.1:10]);
sol1=fzero(eqn1,[0 3])
sol2=fzero(eqn1,[4 5])
sol3=fzero(eqn1,[6 8])

eqn2=@equation2;
gen_plot(eqn2,[-5:.1:5]);
x1=fminbnd(eqn2,-4,-3)
x2=fminbnd(eqn2,2,3)
y1=eqn2(x1)
y2=eqn2(x2)