clear,clc
A=xlsread('孟克_计算多只股票收益率.xls','Multi');%从excel中读取数据到matlab；
T=x2mdate(A(:,1));
R=cell(1,4);RetIntervals=cell(1,4);
for j=2:1:5
    [a,b]=price2ret(A(:,j),T);
    R{j}=a;
    RetIntervals{j}=b;
end
R=cell2mat(R);RetIntervals=cell2mat(RetIntervals);
ER=mean(R); DR=cov(R);
portopt(ER,DR)