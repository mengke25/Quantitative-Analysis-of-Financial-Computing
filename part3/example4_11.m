f = [0.12 0.3 0.2];
a=[1 -1 1];
b=0
Aeq = [1 1 1];
beq = 1;
lb = [0 0 0.1];
ub = [1 1 1];
x=linprog(f,a,b,Aeq,beq,lb,ub)