function F=random(iters,alpha,gene_e,probability)
%row=size(probability,1);
F=gene_e;

for i=1:iters
    F=alpha*probability*F+(1-alpha)*gene_e;
end

end




