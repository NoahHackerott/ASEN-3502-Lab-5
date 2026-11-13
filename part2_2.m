options = optimset('TolX',1e-3,'TolFun',1e-8,'MaxFunEvals',5000,'MaxIter',2000);

fminsearch(gps_cost)