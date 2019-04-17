function [Ddy_Div]=PropFluModel(I,D)
    global L o th m b1 mi s g l a ar
    %Independent Variables
    %Dependent Variables
    %Parameters
 
    S=D(1);
    I=D(2);
    V=D(3);
    R=D(4);
    
    [Ddy_Div]=[L+o*V-(th+m)*S-b1*exp(-ar*I)*S*I+s*R; ...
               b1*exp(-ar*I)*S*I+b1*(1-g)*V*I-(a+m+l)*I; ...
               th*S-(m+o)*V-b1*(1-g)*V*I; ...
               l*I-(m+s)*R];
end