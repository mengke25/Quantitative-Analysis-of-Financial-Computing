clear,clc
Price=[106;100;98];
Couponrate=0.05;
Settle='8-2-2013';
Maturity='6-15-2018';
Period=2;
Basis=0;
[yearconvexity,perconvexity]=bndconvp(Price,Couponrate,Settle,Maturity,Period,Basis)
