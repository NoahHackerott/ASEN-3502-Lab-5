clc;
clear;
close all;
load('lab5_gnss.mat'); 

time_data = (obs.t_hr == 16);
sats = [obs.SatX(time_data), obs.SatY(time_data), obs.SatZ(time_data)];
p = obs.C1C_corr(time_data); 

p0 = lla2ecef_simple(40, -105, 0);
theta0 = [p0(1); p0(2); p0(3); 0];

I= @(sats,p) zeros(size(sats,1),1);
options= optimset('TolX',1e-3,'TolFun',1e-8,'MaxFunEvals',5000,'MaxIter',2000);
cost = @(th) gps_cost(theta0,sats,p0,I);
theta_hat= fminsearch(cost, theta0, options);

b_hat = theta_hat(4);
p_hat = theta_hat(1:3);




