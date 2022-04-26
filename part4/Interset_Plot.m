time=0.25:0.25:4;  
time(1,2)=0.25;
zbt(1,1)=yield(1,1);
zbt(1,2)=yield(1,2)*2;
for i=3:16
intfactor=1+0.25*yield(1,1:(i-1));
cashflowdate=-2*time(1,1:(i-1));
disfact=sum(intfactor.^cashflowdate);
sim=1/(2*time(i));
zbt(1,i)=2*((100+100*couponrate(i)*0.25)/(price(i)-100*couponrate(i)*0.25*disfact))^sim-2
end
zbt(1,2)=zbt(1,2)/2;
time(1,2)=1;
plot(time,zbt);