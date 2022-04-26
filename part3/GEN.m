clc,clear,clf
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
x0=[1,1,1]./3;
Aeq=ones(1,3);
beq=1;
f=[];E=[];
X=[]
for i=linspace(0.1,0.15,1000)%在0.1到0.15内取1000个数（等距）
    b=i;
    [x,fval]=fmincon(@fun2,x0,-r,-b,Aeq,beq,zeros(3,1),ones(3,1));
    X=[X;x,fval];
    E=[E,x*r'];
    f=[f,fval];
end
hold on
plot(f,E,'r-','linewidth',2)
xlabel('风险'),ylabel('收益率')
title('收益风险的关系')
hold off
