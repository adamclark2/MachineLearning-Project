% Compute Cost - Linear Regression Cost Function Implementation
%
% Author: Alexander Dean
% Date: 11/29/2018

function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples
J = 0;

J = sum((X*theta - y).^2)/(2*m);
end
