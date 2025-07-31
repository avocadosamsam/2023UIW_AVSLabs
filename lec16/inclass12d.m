total=0;
for n=1:1:999
    if isprime(n)
        total=n+total;
    end
end

disp(total)