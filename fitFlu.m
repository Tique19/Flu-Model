function sumsqr = fitFlu(p,domain,Ic)
    global Itest th b1 mi 
    
    th=p(1);
    b1=p(2);
    mi=p(3);
    
    [Isolv,Dsolsi] = ode15s('FluModel', domain, Ic);
    I=Dsolsi(:,2);
sumsqr = sqrt(sum((Itest-I).^2));