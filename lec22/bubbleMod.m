function [sorted_vector] = bubbleMod(vector)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
n=numel(vector);

for (i=1:n-1)
    for (j=1:n-1)
        if (vector(j)>vector(j+1))
            temp=vector(j);
            vector(j)=vector(j+1);
            vector(j+1)=temp;
        end
    end
end
sorted_vector=vector;
end