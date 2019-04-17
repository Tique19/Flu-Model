clear
%% Initializing and organizing data
% Temperature readings for each trial in Celsius
MData1=xlsread('HandMLab1.xlsx',1);
MData2=xlsread('HandMLab1.xlsx',2);
CData1=xlsread('HandMLab1.xlsx',3);
CData2=xlsread('HandMLab1.xlsx',4);

% metal rod temp data for each position
MD2_b=MData2(:,7);
MD2_30=MData2(:,6);
MD2_24=MData2(:,5);
MD2_18=MData2(:,4);
MD2_12=MData2(:,3);
MD2_06=MData2(:,2);
MD2_h=MData2(:,1);

% Coated rod data for each position
CD1_b=CData1(:,7);
CD1_30=CData1(:,6);
CD1_24=CData1(:,5);
CD1_18=CData1(:,4);
CD1_12=CData1(:,3);
CD1_06=CData1(:,2);
CD1_h=CData1(:,1);


%constants
% deg C
Tinf=24.5;
%m
L=.4527-.04128-.0381;
d=.00953;
p=pi*d;
%m^2
A=pi*(d./2).^2;
%W/m-K
k=130;

%% Generating plots and curve fitting
T1=[mean(MD2_b),mean(MD2_30),mean(MD2_24),mean(MD2_18),mean(MD2_12),mean(MD2_06),mean(MD2_h)];
T2=[mean(CD1_b),mean(CD1_30),mean(CD1_24),mean(CD1_18),mean(CD1_12),mean(CD1_06),mean(CD1_h)];
x=[.36,.30,.24,.18,.12,.06,0];
y1=(T1-Tinf)./(T1(1)-Tinf);
y2=(T2-Tinf)./(T2(1)-Tinf);


[fitresult1,gof1]=createFitLab1_1(x,y1)
hold on
title('Heat Conduction Within an Uncoated Round Fin')
ylabel('(T(x)-T_inf)/(T_base-T_inf)')
xlabel('x in meters')
plot(x,y1,'bx-')
legend('exponential fit','experimental average')
%plot(x,fitresult1(x),'rx-')
hold off

[fitresult2,gof2]=createFitLab1_2(x,y2)
hold on 
plot(x,y2,'kx-')
title('Heat Conduction Within a Coated Round Fin')
ylabel('(T(x)-T_inf)/(T_base-T_inf)')
xlabel('x in meters')
legend('exponential fit','experimental average')
hold off

%% calculating h
m1=log(fitresult1.a).*fitresult1.b;
m2=log(fitresult2.a).*fitresult2.b;

h1=(m1.^2.*k.*A)./p;
h2=(m2.^2.*k.*A)./p;
%% calculating q
q1=sqrt(h1*p*k*A)*(T1(1)-Tinf);
q2=sqrt(h2*p*k*A)*(T2(1)-Tinf);
%%
figure(3)
clf
hold on
t=linspace(0,19,20);
plot(t,MD2_06,'kx-')
plot(t,MD2_12,'bx-')
plot(t,MD2_18,'rx-')
plot(t,MD2_24,'gx-')
plot(t,MD2_30,'cx-')
title('Temperature Fluctuations Over Time')
xlabel('Time in Seconds')
ylabel('Temperature in Celsius')
hold off

