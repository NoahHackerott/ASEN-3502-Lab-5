function [theta, r2] = linReg(x,y)
    n = length(x);
    x = x(:);
    y = y(:);
    a1 = (n * sum(x.*y) - sum(x)*sum(y)) / (n * sum(x.^2) - sum(x).^2);
    a0 = (sum(y) - a1*sum(x)) / n;
    theta = [a1,a0];
    
    J = (1/n) * sum((a1*x+a0-y).^2);

    r2 = 1 - (J / ((1/n)*sum((y-mean(y)).^2)));
end