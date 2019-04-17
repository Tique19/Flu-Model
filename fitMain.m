clear;

global L o th m b1 b2 b3 mi s g B1 B2 l a ar Itest
tdata=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52];
Idata=[79,58,66,56,44,51,64,50,80,96,129,147,209,286,396,530,781,997,1260,1788,2264,2554,3019,2153,1620,1445,1030,824,761,519,328,246,201,133,86,49,42,53,37,38,33,33,50,52,46,43,39,50,56,81,92,93];
domain=linspace(min(tdata), max(tdata), 100);
Itest=Idata';

%% fit original model
P0=[0.01 0.0001 10];
Ic=[9000 20 900 80];




b2=.0001;
b3=.0001;


B1=25;
B2=25;

 
Ic=[9000 20 8200 80];
L=82;
o=0.0042;
m=0.008237;
b1=0.0001;
s=0.0027;
g=0.48;
l=0.07;
a=0.00017;
fun=@(x)fitFlu(x,tdata,Ic);
p=fminsearch(fun,P0);

 
 th=p(1);
 b1=p(2);
 mi=p(3);
 
 



[t1, y]=ode15s('FluModel',domain,Ic);
S=y(:,1);
I=y(:,2);
V=y(:,3);
R=y(:,4);
t= t1;

figure(1)
hold on
plot(t,S)
plot(t,I)
plot(t,V)
plot(t,R)
plot(tdata,Idata,'*')
legend('S','I','V','R','infective')
xlabel('time in days')
ylabel('number of people')
title('The original model fit to real world data')
hold off
%% optimal Flu model
Ic=[200 1 10 0 1 1 1 1 0 0];
P0=[5 0.15 0.5 0.02 0.02 0.02 0.02 10 0.01 0.8 25 25 0.05 0.1] 

[t2, y2]=ode45(@OptFluModel,[0 100],Ic);
So=y2(:,1);
Io=y2(:,2);
Vo=y2(:,3);
Ro=y2(:,4);
uv=y2(:,9);
um=y2(:,10);
topt=linspace(0,100,length(t2));
L=82;
o=0.0042;
th=0.5;
m=0.008237;
b1=0.1;
b2=.5;
b3=.5;
mi=10;
s=0.0027;
g=0.48;
B1=25;
B2=25;
l=0.14;
a=0.00017; 

figure(2)
hold on
plot(topt,So)
plot(topt,Io)
plot(topt,Vo)
plot(topt,Ro)
legend('S','I','V','R')
hold off

figure(3)
hold on
plot(topt,um)
plot(topt,uv)
legend('um','uv')
hold off

%% Our Proposed Model
P0=[0.2409 5.3112e-04 48.0163 0.8662];
Ic=[19000 20 900 80];

fun=@(x)fitPropFlu(x,tdata,Ic);
p=fminsearch(fun,P0);

 th=p(1)
 b1=p(2)
 mi=p(3)
 ar=p(4)



[t3, y3]=ode15s(@PropFluModel,domain,Ic);
S=y3(:,1);
I=y3(:,2);
V=y3(:,3);
R=y3(:,4);
t=t3;

figure(4)
hold on
plot(t,S)
plot(t,I)
plot(t,V)
plot(t,R)
plot(tdata,Idata,'*')
legend('S','I','V','R','infective')
xlabel('time in days')
ylabel('Number of people')
title('Our revised model fit to actual data')
hold off
%% fitting with only ar
P0=[0.5784];
Ic=[9000 20 8200 80];
L=82;
o=0.0042;
th=0.01;
m=0.008237;
b1=0.0001;
mi=10;
s=0.0027;
g=0.48;
l=0.07;
a=0.00017;
fun=@(x)fitPropFluAr(x,tdata,Ic);
p=fminsearch(fun,P0);


 ar=p(1);



[t3, y3]=ode15s(@PropFluModel,domain,Ic);
S=y3(:,1);
I=y3(:,2);
V=y3(:,3);
R=y3(:,4);
t=t3;

figure(5)
hold on
plot(t,S)
plot(t,I)
plot(t,V)
plot(t,R)
plot(tdata,Idata,'*')
legend('S','I','V','R','infective')
xlabel('time in days')
ylabel('Number of people')
title('Our revised model fit to actual data using only media influence')
hold off