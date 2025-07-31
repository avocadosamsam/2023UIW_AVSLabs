function [sorted_vector] = insertion_sort(vector)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
n=numel(vector);

for (i=1:n)
    temp=vector(i);
    j=i-1;
    while (j>=1)&&(vector(j)>temp)
        vector(j+1)=vector(j);
        j=j-1;
    end
    vector(j+1)=temp;
end
sorted_vector=vector;
end