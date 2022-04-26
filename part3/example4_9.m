clear,clc
Returns=[0.1 0.15 0.12];
STDs=[0.2 0.25 0.18];
Correlations=[1 0.8 0.4
    0.8 1 0.3
    0.4 0.3 1];
Covariances=corr2cov(STDs,Correlations)
portopt(Returns,Covariances,20)
rand('state',0);
Weights=rand(1000,3);
Total=sum(Weights,2);
Weights(:,1)=Weights(:,1)./Total;
Weights(:,2)=Weights(:,2)./Total;
Weights(:,3)=Weights(:,3)./Total;
[PortRisk,Portreturn]=portstats(Returns,Covariances,Weights)