function [result] = caps(str)
i=1;
str=lower(str);
while i<=numel(str)
    if (i==1)
        result(i)=upper(str(i));
        i=i+1;
    elseif (str(i)==' ')
        result(i+1)=upper(str(i+1));
        i=i+2;
    else
        result(i)=str(i);
        i=i+1;
    end
end
end

%n=numel(str);
% str=lower(str);
% str(1)=upper(str(1));
% for i=2:n
%     if isspace(str(i-1))&isletter(str(i))
%         str(i)=upper(str(i));
% end