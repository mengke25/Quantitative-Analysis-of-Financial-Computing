clear,clc
m=[0.1 0.3];
c=[0.02 0
    0 0.04];
p=Portfolio;%创建Portfolio对象——p
p=Portfolio(p,'assetmean',m,'assetcovar',c);%属性赋值
p=Portfolio(p,'lowerbudget',1,'upperbudget',1);%lowerbudget下限预算约束（≥）
p=Portfolio(p,'lowerbound',0);
plotFrontier(p)