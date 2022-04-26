clear,clc
Multiple_stocks
Weights=ones(1,4)/4;
[PortRisk, PortReturn]=portstats(ER,DR,Weights);
hold on
plot(PortRisk,PortReturn,'.r')
title('均值一方差有效前沿以及各个资产组合组合风险与收益')
xlabel('风险（标准差）')
ylabel('期望收益率')
hold off