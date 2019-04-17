function sumsqr = fitOptFlu(p,domain,Ic)
    global Itest L o th m b1 b2 b3 mi s g B1 B2 l a Ttest
    
    L= p(1);
    o= p(2);
    th=p(3);
    m= p(4);
    b1=p(5);
    b2=p(6);
    b3=p(7);
    mi=p(8);
    s= p(9);
    g= p(10);
    B1=p(11);
    B2=p(12);
    l= p(13);
    a= p(14);
    
    [Isolv,Dsolsi] = ode15s('OptFluModel', Ttest, Ic);
    I=Dsolsi(:,2);
sumsqr = norm(Itest-I);