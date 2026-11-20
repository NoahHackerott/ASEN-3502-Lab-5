%% Part 2.3 - Correct with the TEC model

% Part a (so far just copied from 1.5)

% Pull data from .mat models for 4 hour window (14 and 18 hr UTC)
load('lab5_gnss.mat');
load('lab5_nist_vtec.mat');

t    = nist_vtec.t_hr;      % time [hr UTC]
vtec = nist_vtec.vtec;      % VTEC [TECU]

% Select the fit window
window = (t >= 14) & (t <= 18); % Between 14 and 18 hours
tWindow  = t(window);
yWindow  = vtec(window);

% Team 3's function takes one 2xn matrix (row 1 = x, row 2 = y).
% t and vtec are column vectors, so  need to transpose each into a row
% before stacking
dataWindow = [tWindow.'; yWindow.'];

% l = [x values; fitted y values] along the best fit line.
[r2Win, l] = Linear_regression(dataWindow);

% Team 3's function prints a0 and a1 but it doesn't return them.
% Recover them from the fitted line l that is returned
a1 = (l(2,end) - l(2,1)) / (l(1,end) - l(1,1));   % [TECU/hr]
a0 = l(2,1) - a1*l(1,1);                          % [TECU]



% Might need this later
% Elevation of satellite i as seen from trial position
%el_i = asin(dot(u,(s-p))/norm(s-p));