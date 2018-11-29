function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
for iter = 1:num_iters
    % create a copy of theta for simultaneous update.
    theta_prev = theta;

    % number of features.
    p = size(X, 2);
    for j = 1:p
        % calculate dJ/d(theta_j)
        deriv = ((X*theta_prev - y)'*X(:, j))/m;

        % % update theta_j
        theta(j) = theta_prev(j)-(alpha*deriv);
    end
    J_history(iter) = computeCost(X, y, theta);

end

end