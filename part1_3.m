%% Part 1.3 - Verifying Linear Regression

% Test 1: exact line should return a0 = 2, a1 = 3, r^2 = 1
x = 0:10;
y = 3*x + 2;

% Gather values from our regression model
[theta, r2] = linReg(x, y);

% Check to see if model satisfies
tol = 1e-8;
if abs(theta(2) - 2) > tol || abs(theta(1) - 3) > tol || abs(r2 - 1) > tol
    error("Linear regression failed exact-line test")
end

% Test 2: Points not on a line
% Data points (0,1), (1,0), (2,3), (3,2)
% Linear regression should get a0 = 0.6, a1 = 0.6, r^2 = 0.36
x = [0 1 2 3];
y = [1 0 3 2];
[theta, r2] = linReg(x, y);
if (abs(theta(2) - 0.6) > tol || abs(theta(1) - 0.6) > tol || abs(r2 - 0.36) > tol)
    error("Linear regression model inaccurate for non-linear data")
end

disp("Linear regression successful");