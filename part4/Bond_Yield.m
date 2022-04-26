clear,clc
settle ='13-6-2018';
price =xlsread('Bond_Information_1.xls.xlsx','d2:d19');
couponrate =xlsread('Bond_Information_1.xls.xlsx','Bond','e2:e19');
maturity =xlsread('Bond_Information_1.xls.xlsx','Bond','c2:c19');
yield =bndyield(price,couponrate,settle,maturity)'