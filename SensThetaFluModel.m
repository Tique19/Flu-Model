function [Ddy_Div]=SensThetaFluModel(I,D)
    global L o th m b1 mi s g l a ar
    %Independent Variables
    %Dependent Variables
    %Parameters
 
    S=D(1);
    I=D(2);
    V=D(3);
    R=D(4);
    Sth=D(5);
    Ith=D(6);
    Vth=D(7);
    Rth=D(8);
    
    [Ddy_Div]=[L+o*V-(th+m)*S-b1*exp(-ar*I)*S*I+s*R; ...
               b1*exp(-ar*I)*S*I+b1*(1-g)*V*I-(a+m+l)*I; ...
               th*S-(m+o)*V-b1*(1-g)*V*I; ...
               l*I-(m+s)*R; ...
               o*Vth-S-th*Sth-m*Sth-b1*exp(-ar*I)*Sth*I-b1*exp(-ar*I)*S*Ith+s*Rth; ...
               b1*exp(-ar*I)*Sth*I+b1*exp(-ar*I)*S*Ith+b1*(1-g)*Vth*I+b1*(1-g)*V*Ith-(a+m+l)*Ith; ...
               S+th*Sth-(m+o)*Vth-b1*(1-g)*Vth*I-b1*(1-g)*V*Ith; ...
               l*Ith-(m+s)*Rth];
end