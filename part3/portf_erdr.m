clear,clc;
Multiple_stocks;
ExpReturn=ER;
ExpCovariance=DR;    
A=rand(1,4);
PortWts=A/sum(A);
[PortRisk,PortReturn]=portstats(ExpReturn,ExpCovariance,PortWts)