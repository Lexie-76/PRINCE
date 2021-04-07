function [probability] = transition(affinity)
%函数用于邻接矩阵变换为转移概率矩阵
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

