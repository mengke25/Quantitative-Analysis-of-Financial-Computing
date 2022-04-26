r=[0.1,0.15,0.12];s=[0.2,0.25,0.18];
ro=[1,0.8,0.4;0.8,1,0.3;0.4,0.3,1];
v=diag(s)*ro*diag(s)%求协方差阵
x=rand(1000,3);%产生1000组1以内的随机数
total=sum(x,2);%按行加和
for j=1:3
    x(:,j)=x(:,j)./total;%归一化
end
expectation=x*r';%求每组预期期望和
for j=1:1000
    risk(j)=x(j,:)*v*x(j,:)';%求每组的风险
end
plot(risk,expectation,'b.')%以风险为横轴，预期为纵轴，绘制散点图