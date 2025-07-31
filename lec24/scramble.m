function [] = scramble(str)
%This funcion randomly scrambles the letters of single word
num=numel(str);
% str=randperm(num);
% i=1;
% for n=1:str
%     a=str(i);
%     result(i)=char(inputstr(a));
%     i=i+1;
% end
indx=str(randperm(num));
disp(indx);
end
