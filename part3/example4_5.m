clear,clc
returns = [0.1,0.16,0.12,0.2,0.14];
variances = [0.02,0.05,0.03,0.05,0.01];
PortWts = [0.1,0.2,0.2,0.2,0.3];
mean = sum(returns.*PortWts)
variance = sum(variances.*PortWts.^2)