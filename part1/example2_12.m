clear,clc
Settle='2018-2-17';
Maturity='2018-4-13';
Issue='2017-10-11';
Face=100;
Couponrate=0.0608;
Basis=1;
[price,accruinterest]=prmat(Settle,Maturity,Issue,Face,Couponrate,Basis)