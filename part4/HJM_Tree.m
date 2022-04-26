clear,clc
Compounding=1;%连续计息规范;
ValuationDate='12-22-2012'%;
StartDate=['12-22-2012';'12-22-2013';'12-22-2014';'12-22-2015';'12-22-2016'];%开始日期;
EndDate=['12-22-2013';'12-22-2014';'12-22-2015';'12-22-2016';'12-22-2017'];%结束日期;
Rates=[0.1;0.11;0.12;0.125;0.09];%
Volatility=[0.2;0.19;0.18;0.17;0.16];%波动率说明
CurveTerm = [1;2;3;4;5];
HJMVolSpec = hjmvolspec('Stationary',Volatility,CurveTerm);%利用hjmvolspec函数创建按波动率结构说明;
RateSpec=intenvset('Compounding',Compounding,'ValuationDate',ValuationDate,'StartDates',StartDate,'EndDates',EndDate,'Rates',Rates);%创建利率期限结构说明;
HJMTimeSpec=hjmtimespec(ValuationDate,EndDate,Compounding);%创建时间结构说明;
%生成HJM模型二叉树:
HJMTree=hjmtree(HJMVolSpec,RateSpec,HJMTimeSpec)
treeviewer(HJMTree)
