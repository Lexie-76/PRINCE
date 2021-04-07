function [probability] = transition(affinity)
%���������ڽӾ���任Ϊת�Ƹ��ʾ���
[row,col]=size(affinity);
probability=zeros(row,col);
for i=1:col
    N=sum(affinity(:,i));
    if N>0
        temp= affinity(:,i)/N
    else
        temp= affinity(:,i)
    end
    probability(:,i)=temp;
end


end

