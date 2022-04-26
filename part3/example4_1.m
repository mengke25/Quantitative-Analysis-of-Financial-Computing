clear,clc
RetSeries=[0.1;0.05;-0.05];
RetIntervals=[182 91 92]';
StartPrice=10;
StartTime=datenum('2016-12-18');
[Tickseries,TickTimes]=ret2tick(RetSeries,StartPrice,RetIntervals,StartTime)
datestr(TickTimes)