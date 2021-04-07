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
%���뼲������id
x=input('please input disease phenotype id...\n');

%������
load('phenotype_network.mat');%5080*5081

%�洢���м�������id
id_name=phenotype_network(:,1);%5080*1

%���Ҽ������Ͷ�Ӧ������
x_tag=find(id_name==x);

%��ȡ��ü���������ص����м�������
disease_all=phenotype_network(x_tag,2:end);%1*5080

%������ضȴӴ�С����
[sort_result,index] = sort(disease_all,'descend');

%��ض�����5����ؼ�����������
index_five=index(1:5);%1*5

%% ==================== Part 2:  Finding pathogenic genes of the five phenotypes ====================
%������
load('g_p_network.mat');

%��������ؼ���������ȡ�ɾ���
gene=g_p_network(:,index_five);%8919*5

%��ȡ�����²�����
gene_e=sum(gene,2);
gene_e(gene_e>0)=1;

%% =============== Part 3: Normalizing PPI network and Computing  ================
%������
load('ppi_network.mat');

%ת�Ƹ��ʾ���
probability = transition(ppi_network);%8919*8919

%��������
alpha = 0.1;
iters = 50;

%������ߺ���
F=random(iters,alpha,gene_e,probability);%8919*1

%��ضȴӴ�С����
[sort_F,index_F] = sort(F,'descend');

%��ض�����ǰ10�Ļ���
index_ten=index_F(1:10);%1*10

%��������Ϣ
fprintf('Related genes(top10):\n')
for i=1:10
    tag = index_ten(i);
    fprintf('%d\n',tag);
    name=gene_name{tag,1};    
    disp(name);
    fprintf('\n');
end


