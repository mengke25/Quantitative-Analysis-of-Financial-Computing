clear,clc
TickSeries=[100;110;115;110];
Ticktimes=[0;6;9;12];
[Retseries,RetIntervals]=tick2ret(TickSeries,Ticktimes);
datestr(RetIntervals)