clear,clc
H = [0.2 0.05 -0.01 0.03 0.05
    0.05 0.3 0.015 0.01 0.03
    -0.01 0.015 0.1 0.02 0.01
    0.03 0.01 0.02 0.1 0.015
    0.05 0.03 0.01 0.015 0.15];
q = [0 0 0 0 0];
aeq = [1 1 1 1 1;0.2 0.14 0.12 0.05 0.07];
beq = [1;0.1];
lb = [0 0 0 0 0];
ub = [1 1 1 1 1];
quadprog(H,q,[],[],aeq,beq,lb,ub)