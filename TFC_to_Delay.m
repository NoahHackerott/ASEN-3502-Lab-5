clear;
close all;
clc;


a1 = 5.285373;   % [TECU/hr]
a0 =-5.926498*10;
el = 10:1:90;
%% c
%vtec values for hr 14,16,18
vtec_14 = a1 * 14 + a0;
vtec_16 = a1 * 16 + a0;
vtec_18 = a1 * 18 + a0;

%delay for hr 14, 16, 18
I_14 = iono_delay(el, vtec_14);
I_16 = iono_delay(el, vtec_16);
I_18 = iono_delay(el, vtec_18);

figure;
plot(el, I_14, 'LineWidth', 1.5); 
hold on;
plot(el, I_16, 'LineWidth', 1.5);
hold on;
plot(el, I_18, 'LineWidth', 1.5);
xlabel('Elevation Angle (degrees)');
ylabel('Ionospheric Delay (m)');
title('Delay vs Elevation Angle');
legend('14 UTC', '16 UTC', '18 UTC', 'Location', 'northeast');
grid on;












