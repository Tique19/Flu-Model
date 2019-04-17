clear;

global L o th m b1 b2 b3 mi s g B1 B2 l a ar
L=5;
o=0.3;
th=0.5;
m=0.02;
b1=.02;
b2=.02;
b3=.02;
mi=10;
s=0.01;
g=0.8;
B1=25;
B2=25;
l=0.05;
a=0.1; 
%% original model
Ic=[200 1 10 0];
[t1, y]=ode45(@FluModel,[0 100],Ic);
S=y(:,1);
I=y(:,2);
V=y(:,3);
R=y(:,4);
t=linspace(0,100,length(t1));

figure(1)
hold on
plot(t,S)
plot(t,I)
plot(t,V)
plot(t,R)
legend('S','I','V','R')
xlabel('time in days')
ylabel('number of people')
title('Original Flu Vaccination Model')
hold off
%% optimal Flu model
Ic=[200 1 10 0 1 1 1 1 0 0];
[t2, y2]=ode45(@OptFluModel,[0 100],Ic);
So=y2(:,1);
Io=y2(:,2);
Vo=y2(:,3);
Ro=y2(:,4);
uv=y2(:,9);
um=y2(:,10);
topt=linspace(0,100,length(t2));
L=5;
o=0.15;
th=0.5;
m=0.02;
b1=.02;
b2=.02;
b3=.02;
mi=10;
s=0.01;
g=0.8;
B1=25;
B2=25;
l=0.05;
a=0.1; 

figure(2)
hold on
plot(topt,So)
plot(topt,Io)
plot(topt,Vo)
plot(topt,Ro)
legend('S','I','V','R')
xlabel('time in days')
ylabel('number of people')
title('Optimized Flu Vaccination Model')
hold off

figure(3)
hold on
plot(topt,um)
plot(topt,uv)
legend('um','uv')
hold off

%% Our Proposed Model
ar=.02;
Ic=[200 1 10 0];
[t3, y3]=ode45(@PropFluModel,[0 100],Ic);
S=y3(:,1);
I=y3(:,2);
V=y3(:,3);
R=y3(:,4);
t=linspace(0,100,length(t3));

figure(4)
hold on
plot(t,S)
plot(t,I)
plot(t,V)
plot(t,R)
legend('S','I','V','R')
hold off
%% Sensitivity analysis
Ic=[200 1 10 0 10^-5 10^-5 10^-5 10^-5];
% for theta
[tth, yth]=ode15s(@SensThetaFluModel,[0 100],Ic);
figure(5)
hold on
subplot(1,4,1)
plot(tth, th.*yth(:,5), 'b')
title('S')
xlabel('time')
ylabel('theta*dS/d(theta)')
subplot(1,4,2)
plot(tth, th.*yth(:,6), 'r')
title('I')
xlabel('time')
ylabel('theta*dI/d(theta)')
subplot(1,4,3)
plot(tth, th.*yth(:,7), 'g')
title('V')
xlabel('time')
ylabel('theta*dV/d(theta)')
subplot(1,4,4)
plot(tth, th.*yth(:,8), 'm')
xlabel('time')
ylabel('theta*dR/d(theta)')
title('R Theta')
hold off

% for beta
[tb, yb]=ode15s(@SensBetaFluModel,[0 100],Ic);
figure(6)
hold on
subplot(1,4,1)
plot(tb, b1.*yb(:,5), 'b')
xlabel('time')
ylabel('beta*dS/d(beta)')
title('S')
subplot(1,4,2)
plot(tb, b1.*yb(:,6), 'r')
xlabel('time')
ylabel('beta*dI/d(beta)')
title('I')
subplot(1,4,3)
plot(tb, b1.*yb(:,7), 'g')
xlabel('time')
ylabel('beta*dV/d(beta)')
title('V')
subplot(1,4,4)
plot(tb, b1.*yb(:,8), 'm')
xlabel('time')
ylabel('beta*dR/d(beta)')
title('R Beta')
hold off

% for ar
[ta, ya]=ode15s(@SensAreaFluModel,[0 100],Ic);
figure(7)
hold on
subplot(1,4,1)
plot(ta, ar.*ya(:,5), 'b')
xlabel('time')
ylabel('ar*dS/d(ar)')
title('S')
subplot(1,4,2)
plot(ta, ar.*ya(:,6), 'r')
xlabel('time')
title('I')
ylabel('ar*dI/d(ar)')
subplot(1,4,3)
plot(ta, ar.*ya(:,7), 'g')
xlabel('time')
ylabel('ar*dV/d(ar)')
title('V')
subplot(1,4,4)
plot(ta, ar.*ya(:,8), 'm')
xlabel('time')
ylabel('ar*dR/d(ar)')
title('R Severity')
hold off