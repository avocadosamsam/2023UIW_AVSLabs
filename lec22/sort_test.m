n=1;
N=[5,10,100,1000,10000,100000];

while(n<numel(N))
    vector=randi(100,1,N(n));
    tic
    sorted_vector=insertion_sort(vector);
    elapsed_time=toc;
    time_insertion(n)=toc;
    n=n+1;
end

n=1;
while(n<numel(N))
    vector=randi(100,1,N(n));
    tic
    sorted_vector=bubbleMod(vector);
    elapsed_time=toc;
    time_bubble(n)=toc;
    n=n+1;
end

time_insertion
time_bubble