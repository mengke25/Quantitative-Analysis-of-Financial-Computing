A=xlsread('孟克_计算个股收益_天津磁卡.xls');
TickSeries=xlsread('孟克_计算个股收益_天津磁卡.xls','YRESSTK','c2:c27');
Ticktimes=xlsread('孟克_计算个股收益_天津磁卡.xls','YRESSTK','b2,b27');
[RetSeries,RetIntervals]=price2ret(TickSeries,Ticktimes)