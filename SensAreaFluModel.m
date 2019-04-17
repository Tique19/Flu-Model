function [Ddy_Div]=SensAreaFluModel(I,D)
    global L o th m b1 mi s g l a ar
    %Independent Variables
    %Dependent Variables
    %Parameters
 
    S=D(1);
    I=D(2);
    V=D(3);
    R=D(4);
    Sa=D(5);
    Ia=D(6);
    Va=D(7);
    Ra=D(8);
    
    [Ddy_Div]=[L+o*V-(th+m)*S-b1*exp(-ar*I)*S*I+s*R; ...
               b1*exp(-ar*I)*S*I+b1*(1-g)*V*I-(a+m+l)*I; ...
               th*S-(m+o)*V-b1*(1-g)*V*I; ...
               l*I-(m+s)*R; ...
               o*Va-(th+m)*Sa+b1*exp(-ar*I)*S*I^2-b1*exp(-ar*I)*Sa*I-b1*exp(-ar*I)*S*Ia+s*Ra; ...
               -b1*exp(-ar*I)*S*I^2+b1*exp(-ar*I)*Sa*I+b1*exp(-ar*I)*S*Ia+b1*(1-g)*Va*I+b1*(1-g)*V*Ia-(a+m+l)*Ia; ...
               th*Sa-(m+o)*Va-b1*(1-g)*Va*I-b1*(1-g)*V*Ia; ...
               l*I-(m+s)*Ra];
end