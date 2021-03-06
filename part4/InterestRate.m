clear,clc
settle=42855;
price=xlsread('Bond_Information_1.xls.xlsx','Bond_Trans','d2:d19')
couponrate=xlsread('Bond_Information_1.xls.xlsx','Bond_Trans','e2:e19');
maturity=xlsread('Bond_Information_1.xls.xlsx','Bond_Trans','j2:j19');
face=xlsread('Bond_Information_1.xls.xlsx','Bond_Trans','f2:f19');
Period=xlsread('Bond_Information_1.xls.xlsx','Bond_Trans','g2:g19');
Basis=xlsread('Bond_Information_1.xls.xlsx','Bond_Trans','h2:h19');
EndMonthRule=xlsread('Bond_Information_1.xls.xlsx','Bond_Trans','i2:i19')
bonds=[maturity',couponrate'];
bonds=[maturity,couponrate,face,Period,Basis,EndMonthRule];
[zerorates,dates]=zbtprice(bonds,price,settle,2);
plot(dates,zerorates,'-.or')
dateaxis('x')