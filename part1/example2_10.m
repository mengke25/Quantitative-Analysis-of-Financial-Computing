clear,clc;
Yield=[0.04,0.05,0.06];
Couponrate=[0.05,0.05,0.05];
Settle='2012-1-20';
Maturity='2018-7-15';
Period=1;
Basis=0;
[price,accruedint]=bndprice(Yield,Couponrate,Settle,Maturity,Period,Basis)
