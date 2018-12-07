% Compute Cost - Linear Regression Cost Function Implementation
%
% Author: Alexander Dean
% Date: 11/29/2018

function J = computeCost(X, y, theta, lambda)

m = length(y); % number of entries in dataset
h = X * theta;
J = sum((h - y).^2)/(2*m) + lambda*sum(theta.^2);   %cost func with reg.
end %function