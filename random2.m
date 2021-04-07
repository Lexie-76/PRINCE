function R=random2(alpha,gene_e,probability)
row=size(probability,1);
R=zeros(row,1);
A=eye(row);
R=(1-alpha)*inv((A-alpha*probability))*gene_e;

end

