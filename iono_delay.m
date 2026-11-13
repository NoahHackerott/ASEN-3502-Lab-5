function [I] = iono_delay(el_deg, vtec)
%part a
RE = 6371*1000; % m
h = 350*1000; % m
f1= 1575.42*10^6; % Hz
K= (40.3*10^16)/f1^2; % m/TECU

%part b, delay calculation
f_el = 1 ./ sqrt(1 - ((RE * cosd(el_deg)) / (RE + h)).^2);
I = K .* f_el .* vtec;
end
