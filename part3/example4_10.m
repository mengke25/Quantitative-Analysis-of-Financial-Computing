clear,clc
ExpReturn = [0.1 0.2 0.15];
ExpCovariance = [0.005 -0.010 0.004
                 -0.010 0.040 -0.002
                 0.004 -0.002 0.023];
[PortRisk,PortReturn,PortWts] = portopt(ExpReturn,ExpCovariance)
RisklessRate = 0.08;
BorrowRate = 0.12;
RiskAversion = 3;
[RiskyRisk,RiskyReturn,RiskyWts,RiskyFraction,OverallRisk,OverallReturn] =...
portalloc(PortRisk,PortReturn,PortWts,RisklessRate,BorrowRate,RiskAversion)
[PortRisk,PortReturn,PortWts] = portopt(ExpReturn,ExpCovariance,20)
[RiskyRisk,RiskyReturn,RiskyWts,RiskyFraction,OverallRisk,OverallReturn] = ...
portalloc(PortRisk,PortReturn,PortWts,RisklessRate,BorrowRate,RiskAversion)