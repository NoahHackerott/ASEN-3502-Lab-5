%% Part 1.5 - Fit the TEC Model (using Team 3's Linear_regression function)

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

% Evaluate the model everywhere
yhatDay = a0 + a1*t;
yhatWindow = yhatDay(window);

% Metrics in the window
rmseWin = sqrt(mean((yhatWindow - yWindow).^2));

% Metrics for the whole day (same model, all points)
ssResidual = sum((yhatDay - vtec).^2);        % error left after the fit
ssTotal    = sum((vtec - mean(vtec)).^2);     % error from just guessing the mean
r2Day      = 1 - ssResidual/ssTotal;
rmseDay = sqrt(mean((yhatDay - vtec).^2));

fprintf("Window (14-18 UTC): r^2 = %.4f, RMSE = %.4f TECU\n", r2Win, rmseWin);
fprintf("Whole day:          r^2 = %.4f, RMSE = %.4f TECU\n", r2Day, rmseDay);


% Plot (Claude helped me with formatting this)
figure; hold on; grid on
plot(t, vtec, '.', 'DisplayName', 'NIST VTEC data')
plot(tWindow, yWindow, 'o', 'DisplayName', 'Fit window data')
plot(t, yhatDay, '-', 'LineWidth', 1.5, 'DisplayName', 'Linear fit (extended)')
xline([14 18], '--', 'HandleVisibility', 'off')
xlabel('Time [hr UTC]'); ylabel('VTEC [TECU]')
title('VTEC linear fit over 14-18 hr UTC window')
legend('Location', 'best')