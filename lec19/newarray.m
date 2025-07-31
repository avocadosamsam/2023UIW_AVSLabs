function [arr1,arr2,arr3] = newarray(arr)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
arr1=arr(arr<=9);
arr2=arr(arr>=10 & arr<100);
arr3=arr(arr>=100 & arr<1000);

end