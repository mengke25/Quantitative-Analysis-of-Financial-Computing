clear,clc
[num,str,all]=xlsread('Report_02.xlsx');%读取[数值型，字符串，所有]数据
p1=num(:,2);p2=num(:,3);p3=num(:,4); %在num变量里读取各只股票的收盘价
[r1]=price2ret(p1);[r2]=price2ret(p2);[r3]=price2ret(p3); %将收盘价转换成收益率
rm=num(2:244,5);rf=num(2:244,6);%在num变量里读取市场组合日收益率和日无风险收益率
S=[r1,r2,r3,rm,rf];%将三只股票日收益率+市场组合日收益率+日无风险收益率导入S变量里
name=str(1,3:5);%在str中读取股票名称
[numsamples,numseries]=size(S);%返回S的结构
numname=numseries-2;%股票名称个数=S中列数-2（市场组合日收益率+日无风险收益率）
dates=x2mdate(num(2:244,1));%读取num中的股票交易日期
startdate=dates(1);%读取date中的第一个数作为开始日期
enddate=dates(end);%读取date中的最后一个数作为结束日期
%将数据写入文本文件，使用fprintf函数
fprintf(1,'Separate regressions with ');%输入Separate regressions with
fprintf(1,'daily total return S from %s to %s\n',...
datestr(startdate,1),datestr(enddate,1));%输入daily total return S from 04-Jan-2017 to 29-Dec-2017并新起行
fprintf(1,'%17s % -20s % -20s % -20s %  ',' ','Alpha','Beta','Sigma');%设置Alpha Alpha Sigma的相对位置
fprintf(1,'\n');%新起一行
fprintf(1,'********    *****************   ******************   ****************** ','\n');%用*分界参数与结果
fprintf(1,'\n');%新起一行
%计算各个参数值
for i=1:numname %i=1:3
    testS=zeros(numsamples,1);%生成字符串型样本个数行的零向量
    testdesign=zeros(numsamples,2);%生成字符串型样本个数行两列的零矩阵
    testS(:)=S(:,i)-S(:,5);%ri-rf
    testdesign(:,1)=1;%（rm-rf）的常数项为1
    testdesign(:,2)=S(:,4)-S(:,5);%rm-rf
    [Param,Covar]=ecmmvnrmle(testS,testdesign);%对（ri-rf）和（rm-rf）做多元正态回归，返回参数和协方差
    [StdParam,Stdcovar]=ecmmvnrstd(testS,testdesign,Covar,'fisher');%使用“Fisher信息矩阵”评估多元正态回归模型的标准误差，返回相关数值
     StdParam=ecmmvnrstd(testS,testdesign,Covar,'hessian');%使用“观察到的对数似然函数的预期Hessian矩阵”评估多元正态回归模型的标准误差，返回相关数值
     Alpha=Param(1);%Alpha是Param中的第一个数
     Beta=Param(2);%Beta是Param中的第二个数
     Sigma=sqrt(Covar);%总体协方差的平方返回Sigma
     StdAlpha=StdParam(1);%StdAlpha是StdParam的第一个数
     StdBeta=StdParam(2);%Beta是StdParam的第二个数
     StdSigma=sqrt(Stdcovar);%总体协方差标准差的平方
     %对Alpha Beta Sigma等参数和数值的相对位置进行编辑
     fprintf('%4s %9.4f (%8.4f) %9.4f (%8.4f) %9.4f (%8.4f)\n',...
     name{i},Alpha(1),abs(Alpha(1)/StdAlpha(1)),...
     Beta(1),abs(Beta(1)/StdBeta(1)),Sigma(1),StdSigma(1));
end