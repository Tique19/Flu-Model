function [Ddy_Div]=SensBetaFluModel(I,D)
    global L o th m b1 mi s g l a ar
    %Independent Variables
    %Dependent Variables
    %Parameters
 
    S=D(1);
    I=D(2);
    V=D(3);
    R=D(4);
    Sb=D(5);
    Ib=D(6);
    Vb=D(7);
    Rb=D(8);
    
    [Ddy_Div]=[L+o*V-(th+m)*S-b1*exp(-ar*I)*S*I+s*R; ...
               b1*exp(-ar*I)*S*I+b1*(1-g)*V*I-(a+m+l)*I; ...
               th*S-(m+o)*V-b1*(1-g)*V*I; ...
               l*I-(m+s)*R; ...
               o*Vb-(th+m)*Sb-exp(-ar*I)*S*I-b1*exp(-ar*I)*Sb*I-b1*exp(-ar*I)*S*Ib+s*Rb; ...
               exp(-ar*I)*S*I+b1*exp(-ar*I)*Sb*I+b1*exp(-ar*I)*S*Ib+(1-g)*V*I+b1*(1-g)*Vb*I+b1*(1-g)*V*Ib-(a+m+l)*Ib; ...
               th*Sb-(m+o)*Vb-(1-g)*V*I-b1*(1-g)*Vb*I-b1*(1-g)*V*Ib; ...
               l*Ib-(m+s)*Rb];
end