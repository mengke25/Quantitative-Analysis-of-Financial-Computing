clear,clc
a=xlsread('孟克_计算HSIndex_恒生指数.xls');  
tickseries=xlsread('孟克_计算HSIndex_恒生指数.xls','HSI','c2:c23');  
ticktimes=x2mdate(xlsread('孟克_计算HSIndex_恒生指数.xls','HSI','b2:b23'));                       
[retseries,retintervals]=price2ret(tickseries,ticktimes);
B=[retseries,retintervals]