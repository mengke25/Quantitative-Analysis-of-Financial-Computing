clear,clc
Issue='2016-10-11';
Settle='2017-02-07';
Maturity='2017-04-13';
Face=100;
Price=99.98;
Couponrate=0.0608;
Basis=1;
yield=yldmat(Settle,Maturity,Issue,Face,Price,Couponrate,Basis)