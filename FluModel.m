function [Ddy_Div]=FluModel(I,D)
    global L o th m b1 b2 b3 mi s g l a
    %Independent Variables
    %Dependent Variables
    %Parameters
 
    S=D(1);
    I=D(2);
    V=D(3);
    R=D(4);
    
    [Ddy_Div]=[L+o*V-(th+m)*S-(b1-b2*(I/(mi+I)))*S*I+s*R; ...
               (b1-b2*(I/(mi+I)))*S*I+(b1-b3*(I/(mi+I)))*(1-g)*V*I-(a+m+l)*I; ...
               th*S-(m+o)*V-(b1-b3*(I/(mi+I)))*(1-g)*V*I; ...
               l*I-(m+s)*R];
end

