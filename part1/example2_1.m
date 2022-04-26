clear,clc
Facevalue=1000;
Payment=0.05*Facevalue;
Rate=0.06;
Extrapayment=Facevalue;
Numperiods=10;
Due=0;
pvfix(0.06,10,50,1000,0)
