clear,clc
Settle='2016-10-14';
Maturity='2017-03-17';
Face=100;
Price=96.28;
Basis=2;
yield=ylddisc(Settle,Maturity, Face,Price,Basis)
