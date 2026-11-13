clear;
close all;
clc;

load('lab5_gnss.mat'); 
load('lab5_nist_vtec.mat');

figure;
plot(nist_vtec.t_hr, nist_vtec.vtec, 'LineWidth', 1.5); 
hold on;
xline(14, '--r', '14 hr UTC', 'LineWidth', 1.2);
xline(18, '--r', '18 hr UTC', 'LineWidth', 1.2);
xlabel('Time (Hr UTC)');
ylabel('Vertical TEC (TECU)');
title('NIST Vertical TEC');
grid on;
