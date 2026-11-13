function J = gps_cost(theta, sats, P, iono)
    p = theta(1:3);
    b = theta(4);
    
    P_hat = norm(sats - p,2) + b + iono(sats,p);
    
    J = mean((P-P_hat).^2);

