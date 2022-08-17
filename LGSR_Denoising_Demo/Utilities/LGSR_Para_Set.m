function par  =  LGSR_Para_Set( nSig, I, gamma, lambda, mu, c1, c2)

par.I                =      double(I);

par.nSig            =       nSig;

par.Iter             =       50;



if nSig <=20


par.gamma            =        gamma;   

par.lamada           =        lambda; 

par.mu               =        mu;

par.c1               =        c1;

par.c2               =        c2;


par.win              =        6;

par.nblk             =        60; %70;


%par. difff            =  0.0009;





elseif nSig <=40

par.gamma            =        gamma;   

par.lamada           =        lambda; 

par.mu               =        mu;

par.c1               =        c1;

par.c2               =        c2;



par.win              =         7;

par.nblk             =         80;


%par. difff            =  0.002;



elseif nSig <=60

par.gamma            =        gamma;   

par.lamada           =        lambda; 

par.mu               =        mu;

par.c1               =        c1;

par.c2               =        c2;



par.win              =         8;

par.nblk             =         100;

%par. difff            =  0.002;



else
    
par.gamma            =        gamma;   

par.lamada           =        lambda; 

par.mu               =        mu;

par.c1               =        c1;

par.c2               =        c2;



par.win              =         9;

par.nblk             =        120;% 140;

%par. difff            =  0.0018;


end

par.step      =   floor((par.win)/2-1);   

end

