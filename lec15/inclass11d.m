bill=60;

if (bill<10)
    tip=1.8
elseif (bill>=10)&(bill<60)
    tip=bill*0.18
elseif (bill>=60)
    tip=bill*0.2
end