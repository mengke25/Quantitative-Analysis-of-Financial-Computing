clear,clc
StartDates='01-02-2013';
EndDates='01-02-2018';
Compounding=-1;
Basis=1;
Rates=0.05;
RateSpec=intenvset('StartDates',StartDates,'EndDates',EndDates,'Rates',Rates,... 
'Compounding',Compounding,'Basis',Basis);
Settle='01-02-2013';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
Maturity='01-02-2018';
CouponRate=0.04; 
CallStrike=115;
CallExDates = [datenum('01 - 02 - 2015') datenum(Maturity)];
ConvRatio=1;
AmericanCall=1;
Sigma=0.3; 
Spreads=0:0.005:0.015;
Prices=40:10:140;
convprice=zeros(length(Prices),length(Spreads));
NumSteps=200;
TimeSpec=stttimespec(StartDates,EndDates,NumSteps);
for PriceIdx =1:length(Prices)
StockSpec =stockspec(Sigma,Prices(PriceIdx));
STTT=stttree(StockSpec,RateSpec,TimeSpec);
convprice(PriceIdx,:)=cbondbystt(STTT,CouponRate,Settle,Maturity,ConvRatio,...
'Spread',Spreads(:),'CallExDates',CallExDates,'CallStrike',CallStrike,...
'AmericanCall',AmericanCall);
end
stock=repmat(Prices',1,length(Spreads));
plot(stock,convprice);
legend({'+0 bp';'+50 bp';'+100 bp';'+150 bp'});
title('Effect of Spread using Trinomial tree - 200 steps');
xlabel('Stock Price'); 
ylabel('Convertible Bond Price'); 
text(50,150,['Coupon 4% semiannual,',sprintf('\n'),'110 Call after 2 years,' sprintf('\n'),'maturing in 5 years.'],'fontweight','Bold');

