%步骤二：利用上述数据，做出4个不同日期的FRA结构图
clear;
bonds=[0.2500 1.4300 1.4200 0.1020 0.0420 ; 0.5000 0.2500 0.2480 0.2170 0.2390 ; 2.0000 0.5760 0.5400 0.5120 0.3890 ; 3.0000 0.3600 0.3300 0.3200 0.2100 ; 5.0000 0.5300 0.5200 0.3500 0.3400 ; 10.0000 0.0010 0.0100 0.1400 0.1400 ; 30.0000 3.6500 1.0100 3.9400 0.8700 ; 50.0000 0.9500 0.9500 0.9100 0.7600];
%上述是债券市场的数据
curvedates=datenum(['01-20-2018';'04-20-2018';'10-20-2019';'10-20-2020';'10-20-2022';'10-20-2027';'10-20-2047';'10-20-2067']);
%注意日期输入前方的0不能省略
fwdone=zero2fwd(bonds(:,2),curvedates,'10-20-2017');
fwdtwo=zero2fwd(bonds(:,3),curvedates,'10-20-2017');
fwdthree=zero2fwd(bonds(:,4),curvedates,'10-20-2017');
fwdfour=zero2fwd(bonds(:,5),curvedates,'10-20-2017');
%分别求出来对应的远期利率值
plot(curvedates,fwdone,'k + --');hold on;
plot(curvedates,fwdtwo,'k * --');hold on;
plot(curvedates,fwdthree,'kx --');hold on;
plot(curvedates,fwdfour,'ko --');
dateaxis('x');
%eof

