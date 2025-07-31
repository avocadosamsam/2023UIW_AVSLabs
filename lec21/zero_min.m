%x=fzero(@Fname,x0)
%plot first and decide range
%@Fname: a function handle
%x0: a single x value starting point or
%you can give it a range of numbers
%x: Solution to Fname (point)
%f(x)=0

%Example G.m
gen_plot(@G,[0:.05:5]);
area=quad(@G,0,2)