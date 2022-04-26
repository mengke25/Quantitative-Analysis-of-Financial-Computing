clear,clc
Price=[106;100;98];
Couponrate=0.055;
Settle='08-02-2013';
Maturity='06-15-2018';
Period=2;
Basis=0;
[modduration,yearduration,perduration]=bnddurp(Price,Couponrate,Settle,Maturity,Period,Basis)
