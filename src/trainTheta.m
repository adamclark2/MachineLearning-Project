function theta = trainTheta(X, y, theta, lambda)
    alpha = 0.00001;   %initialize alpha to some reasonable value
    num_iterations = 10000; % number of iterations to perform before assuming minimum has been found
    m = length(y);  % number of entries in dataset
    p = size(X,2); % number of features
    for i = 1:num_iterations
        theta_prev = theta;
        for j = 1:p
            deriv = ((X*theta_prev - y)'*X(:, j))/m;
            theta(j) = theta_prev(j)-(alpha*deriv);
        end %for(j)
    J(i) = computeCost(X, y, theta, lambda);
    final_thetas(:, i) = theta;
    end % for(i)
    [val, index] = min(J);
    theta = final_thetas(:, i);
    plot(1:num_iterations, J)
    title('Gradient Descent')
    xlabel('Number of Iterations')
    ylabel('Cost')
end %function