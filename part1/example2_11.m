clear,clc
Settle='2016-10-14';
Maturity='2018-7-3';
Face=100;
Discount=0.087;
Basis=2;
Price = prdisc(Settle,Maturity,Face,Discount,Basis)
