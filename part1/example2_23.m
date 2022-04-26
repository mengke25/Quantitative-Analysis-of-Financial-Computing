clear,clc
Yield=[0.04,0.05,0.06];
Couponrate=0.055;
Settle='08-02-2013';
Maturity='06-15-2018';
Period=2;
Basis=0;
[modduration,yearduration,perduration]=bnddury(Yield,Couponrate,Settle,Maturity,Period,Basis)
