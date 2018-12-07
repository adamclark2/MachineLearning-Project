function theta = doLinearRegression(csvname)
%% Linear Regression
% Create a model for predicting the salary of professors
% based on a number of features, including rank, discipline
% years of service, years since PHD, and sex

%% ==== Loading and Configuring Data ====

fprintf('Beginning model creation...\n');
data = readtable(csvname);
temp = data.rank;
for i = 1:length(temp)
    if temp{i} == "Prof";
        rank(i) = 2;
    elseif temp{i} == "AssocProf";
        rank(i) = 1;
    elseif temp{i} == "AsstProf";
        rank(i) = 0;
    end
end
rank = rank';

temp = data.discipline;
for i = 1:length(temp)
    if temp{i} == "A";
        discipline(i) = 0;
    elseif temp{i} == "B";
        discipline(i) = 1;
    end
end
discipline = discipline';

yrs_since_phd = data.yrs_since_phd;

yrs_service = data.yrs_service;

temp = data.sex;
for i = 1:length(temp)
    if temp{i} == "Male";
        sex(i) = 0;
    elseif temp{i} == "Female";
        sex(i) = 1;
    end
end
sex = sex';
salary = data.salary;
data_matrix(:, 1) = rank;
data_matrix(:, 2) = discipline;
data_matrix(:, 3) = yrs_since_phd;
data_matrix(:, 4) = yrs_service;
data_matrix(:, 5) = sex;
data_matrix(:, 6) = salary;
labels = {'Rank','Discipline','Years since PHD','Years Service','Sex','Salary'};

max_size = size(data_matrix, 1);
index = randperm(max_size);
for i = 1:floor(.6 * max_size)
    X(i,:) = data_matrix(index(i),1:5);
    y(i,1) = data_matrix(index(i),6);
end
for i = (floor(.6 * max_size) + 1):floor(.8 * max_size)
    Xval(i - (floor(.6 * max_size)), :) = data_matrix(index(i),1:5);
    yval(i - (floor(.6 * max_size)), 1) = data_matrix(index(i),6);
end
for i = (floor(.8 * max_size) + 1):max_size
    Xtest(i - (floor(.8 * max_size)), :) = data_matrix(index(i),1:5);
    ytest(i - (floor(.8 * max_size)), 1) = data_matrix(index(i),6);
end

% m = Number of examples
m = size(X, 1);


%% ==== Determine optimal polynomial features ====
% For each feature, determine what the best polynomial representation is
max_power = 6;
X(:, 3) = featureNormalize(X(:,3));
Xval(:,3) = featureNormalize(Xval(:,3));
X(:,4) = featureNormalize(X(:,4));
Xval(:,4) = featureNormalize(Xval(:,4));
for i = 1:size(X,2)
    X_modified = X;
    X_mod_val = Xval;
    for j = 1:max_power
    X_modified =[X_modified X_modified(:, i).^j];
    X_mod_val = [X_mod_val X_mod_val(:, i).^j];
    theta = zeros(size(X_modified, 2) + 1, 1);
    theta = trainTheta([ones(m, 1) X_modified], y, theta, 1);
    
    J_poly(i, j) = computeCost([ones(m, 1) X_modified], y, theta, 1);
    J_poly_val(i, j) = computeCost([ones(size(X_mod_val, 1), 1) X_mod_val], yval, theta, 1);
    end %for(j)
    plot(1:max_power, J_poly(i,:), 1:max_power, J_poly_val(i,:))
    title(strcat(labels(i),{' Polynomial Features vs. Cost'}))
    xlabel('Degree')
    ylabel('Cost')
    legend('Train','Cross Validation')
    figure()
end %for(i)

% Modify X, xval, and xtest to reflect changes in degree
for i = 1: size(X,2)
    [val, ind] = min(abs(J_poly(i,:) - J_poly_val(i,:)));
    for j = 2:ind
    X = [X X(:,i).^j];
    Xval = [Xval Xval(:,i).^j];
    Xtest = [Xtest Xtest(:,i).^j];
    end
end

% train theta on new polynomial features 
theta = zeros(size(X, 2) + 1, 1);
theta = trainTheta([ones(m, 1) X], y, theta, 1);
figure()
%% ==== Determine an approrpriate value of lambda ==== 
iterator = 1;
for k = 1:100:2000
    new_theta = theta;
    new_theta = trainTheta([ones(m, 1) X], y, new_theta, k);
    J_lambda(iterator) = computeCost([ones(m, 1) X], y, new_theta, k);
    J_lambda_val(iterator) = computeCost([ones(size(Xval,1), 1) Xval], yval, new_theta, k);
    iterator = iterator + 1;
end
plot(1:100:2000, J_lambda, 1:100:2000, J_lambda_val)
title('Effects of Modifying Lambda on Cost')
xlabel('Lambda')
ylabel('Cost')
legend('Train','Cross Validation')
fprintf("Model created.\n")
end