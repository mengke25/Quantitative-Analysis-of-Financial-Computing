clear,clc
bonds=xlsread('Bond_Information_1.xls.xlsx','zero2fwd');
plot(bonds(:,1),bonds(:,2),'k + -. ');hold on;
plot(bonds(:,1),bonds(:,3),'k * -- ');hold on;
plot(bonds(:,1),bonds(:,4),'kx - ');hold on;
plot(bonds(:,1),bonds(:,5),'ko:')