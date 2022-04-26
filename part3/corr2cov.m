clear,clc
Multiple_stocks
std=cell(1,4);
for i=2:5
std{i}=sqrt(cov(A(:,i)));
end
STDs=cell2mat(std)';
Returns = ER';
Correlations=corrcoef(A(:,2:5))
Covariances = corr2cov(STDs,Correlations)
