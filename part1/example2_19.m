clear,clc
reporate=0.045;
initialdiscount=0.0475;
purchasedate='01-03-2018';
saledate='02-03-2018';
maturity='04-03-2018';
TBEdiscount=tbillrepo(reporate,initialdiscount,purchasedate,saledate,maturity)