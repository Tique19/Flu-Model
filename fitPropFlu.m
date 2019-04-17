function sumsqr = fitPropFlu(p,domain,Ic)
    global Itest th b1 mi ar
    
    th=p(1);
    b1=p(2);
    mi=p(3);
    ar=p(4);
    
    [Isolv,Dsolsi] = ode15s('PropFluModel', domain, Ic);
    I=Dsolsi(:,2);
sumsqr = sqrt(sum((Itest-I).^2));