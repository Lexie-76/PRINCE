%% Machine Learning Online Class
%  Exercise 8 | Random walk
%
%  Instructions
%
%     transition.m
%     random.m(iteration)
%     random2.m(matrix)
%

%% Initialization
clear ; close all; clc

%% =============== Part 1: Inputing phenotype and Finding five related ===============
%输入疾病表型id
x=input('please input disease phenotype id...\n');

%打开数据
load('phenotype_network.mat');%5080*5081

%存储所有疾病表型id
id_name=phenotype_network(:,1);%5080*1

%查找疾病表型对应行索引
x_tag=find(id_name==x);

%提取与该疾病表型相关的所有疾病表型
disease_all=phenotype_network(x_tag,2:end);%1*5080

%根据相关度从大到小排序
[sort_result,index] = sort(disease_all,'descend');

%相关度最大的5种相关疾病的列索引
index_five=index(1:5);%1*5

%% ==================== Part 2:  Finding pathogenic genes of the five phenotypes ====================
%打开数据
load('g_p_network.mat');

%将五种相关疾病单独提取成矩阵
gene=g_p_network(:,index_five);%8919*5

%提取所有致病基因
gene_e=sum(gene,2);
gene_e(gene_e>0)=1;

%% =============== Part 3: Normalizing PPI network and Computing  ================
%打开数据
load('ppi_network.mat');

%转移概率矩阵
probability = transition(ppi_network);%8919*8919

%参数设置
alpha = 0.1;
iters = 50;

%随机游走函数
F=random(iters,alpha,gene_e,probability);%8919*1

%相关度从大到小排序
[sort_F,index_F] = sort(F,'descend');

%相关度排名前10的基因
index_ten=index_F(1:10);%1*10

%输出相关信息
fprintf('Related genes(top10):\n')
for i=1:10
    tag = index_ten(i);
    fprintf('%d\n',tag);
    name=gene_name{tag,1};    
    disp(name);
    fprintf('\n');
end


