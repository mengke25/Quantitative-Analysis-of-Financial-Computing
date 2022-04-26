clear,clc
Price=[95;100;105];
Couponrate=0.05;
Settle='2012-7-20';
Maturity='2017-7-15';
Period=2;
Basis=0
[yield]=bndyield(Price,Couponrate,Settle,Maturity,Period,Basis)
