function [Ddy_Div]=OptFluModel(I,D)
    global L o th m b1 b2 b3 mi s g B1 B2 l a
    %Independent Variables
    %Dependent Variables
    %Parameters
 
    S=D(1);
    I=D(2);
    V=D(3);
    R=D(4);
    l1=D(5);
    l2=D(6);
    l3=D(7);
    l4=D(8);
    uv=D(9);
    um=D(10);
    

    [Ddy_Div]=[L+o*V-((1-uv)*th+m)*S-(b1-b2*(I/((1-um)*mi+I)))*S*I+s*R;... 
        (b1-b2*(I/((1-um)*mi+I)))*S*I+(b1-b3*(I/((1-um)*mi+I)))*(1-g)*V*I-(a+m+l)*I;...
        (1-uv)*th*S-(m+o)*V-(b1-b3*(I/((1-um)*mi+I)))*(1-g)*V*I;...
        l*I-(m+s)*R;...
        -1+(l1-l2)*(b1-b2*(I/((1-um)*mi+I)))*I+(l1-l3)*(1-uv)*th+l1*m; ...
        B1+(l1-l2)*((b1-b2*(I/((1-um)*mi+I)))*S-b2*(((1-um)*mi)/((1-um)*mi+I)^2)*I*S)+(l3-l2)*((b1-b3*(I/((1-um)*mi+I)))*(1-g)*V-b3*(((1-um)*mi)/((1-um)*mi+I)^2)*(1-g)*I*V)+l2*(a+m+l)-l4*l; ...
        -1+(l3-l2)*(b1-b3*(I/((1-um)*mi+I)))*(1-g)*I+l3*m+(l3-l1)*o; ...
        (l4-l1)*s+l4*m; ...
        ((l1-l3)*th*S)/(2*B2);...
        ((l1-l2)*(b2*mi*S*I^2))/(2*B2*((1-um)*mi+I)^2)+((l2-l3)*(b3*mi*(1-g)*V*I^2))/(2*B2*((1-um)*mi+I)^2)];

end