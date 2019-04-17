function sumsqr = fitPropFluAr(p,domain,Ic)
    global Itest th b1 mi ar
    
   
    ar=p(1);
    
    [Isolv,Dsolsi] = ode15s('PropFluModel', domain, Ic);
    I=Dsolsi(:,2);
sumsqr = sqrt(sum((Itest-I).^2));