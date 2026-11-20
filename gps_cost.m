function J = gps_cost(theta, sats, P, iono)
% Note: Claude was used to assist with documentation
%
% GPS_COST Mean squared error cost for GPS position/clock estimation.
%   J = gps_cost(theta, sats, P, iono) evaluates
%       J = (1/n) * sum_i ( yhat_i - y_i )^2
%   where the predicted pseudorange to satellite i is
%       yhat_i = || s_i - p || + b + I_i(p)
%   and y_i is the measured pseudorange.
%
%   Inputs:
%     theta - 4x1 vector [x; y; z; b]: trial receiver ECEF position p (m)
%             and receiver clock offset b (m)
%     sats  - nx3 matrix of satellite ECEF positions, one row per sat (m)
%     P     - nx1 vector of measured pseudoranges (m)
%     iono  - function handle iono(sats, p) returning an nx1 vector of
%             modeled ionospheric delays (m) at trial position p.
%             Use @(sats,p) zeros(size(sats,1),1) for no correction.
%
%   Output:
%     J     - mean squared pseudorange residual (m^2)

    % Split theta into position and clock offset
    trialPosition = theta(1:3, 1);   % ECEF (m)
    b = theta(4, 1);                 % clock offset (m)

    % Measured values
    y = P;  % meters

    % Range from receiver to each satellite
    dist = vecnorm(sats - trialPosition', 2, 2);   % nx1 (m)

    % Predicted pseudoranges
    yhat = dist + b + iono(sats, trialPosition);   % nx1 (m)

    % Mean squared error
    J = mean((yhat - y).^2); % m^2
end