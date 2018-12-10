classdef LinearRegression < handle

    properties (Access = private)
        data
        data_matrix
        J
        theta
    end
    
    methods (Access = private)
        function rank = getRankArray(obj)
            temp = obj.data.rank;
            for i = 1:length(temp)
                if temp{i} == "Prof";
                    rank(i) = 2;
                elseif temp{i} == "AssocProf";
                    rank(i) = 1;
                elseif temp{i} == "AsstProf";
                    rank(i) = 0;
                end
            end
            rank';
        end
        
        function discipline = getDiscArray(obj)
            temp = obj.data.discipline;
            for i = 1:length(temp)
                if temp{i} == "A";
                    discipline(i) = 0;
                elseif temp{i} == "B";
                    discipline(i) = 1;
                end
            end
            discipline';
        end
        
        function yrs_since_phd = getYSPArray(obj)
            yrs_since_phd = obj.data.yrs_since_phd;
        end
        
        function yrs_service = getYrsServiceArray(obj)
            yrs_service = obj.data.yrs_service;
        end
        
        function sex = getSexArray(obj)
            temp = obj.data.sex;
            for i = 1:length(temp)
                if temp{i} == "Male";
                    sex(i) = 0;
                elseif temp{i} == "Female";
                    sex(i) = 1;
                end
            end
            sex';
        end
        
        function salary = getSalaryArray(obj)
            salary = obj.data.salary;
        end
    end % private Methods

    methods % public
        function obj = LinearRegression(csv_name) % Constructor
            obj.data = readtable(csv_name);
            % convert data to numerical values such that regression can be
            % done
            obj.data_matrix(:, 1) = getRankArray(obj);
            obj.data_matrix(:, 2) = getDiscArray(obj);
            obj.data_matrix(:, 3) = getYSPArray(obj);
            obj.data_matrix(:, 4) = getYrsServiceArray(obj);
            obj.data_matrix(:, 5) = getSexArray(obj);
            obj.data_matrix(:, 6) = getSalaryArray(obj);
        end % Constructor
        
        function result_theta = performGradientDescent(obj)
            X = obj.data_matrix(:, 1:5);
            y = obj.data_matrix(:, 6);
            m = length(y);
            [X mu sigma] = featureNormalize(X);

            % Add intercept term to X
            X = [ones(m, 1) X];
            % Choose some alpha value
            alpha = 0.01;
            num_iters = 400;

            % Init Theta and Run Gradient Descent 
            theta = zeros(6, 1);
            [obj.theta, obj.J] = gradientDescentMulti(X, y, theta, alpha, num_iters);

            % Todo manage this in the front-gui or remove it
            %
            % Plot the convergence graph
            %figure;
            %plot(1:numel(obj.J), obj.J, '-b', 'LineWidth', 2);
            %xlabel('Number of iterations');
            %ylabel('Cost J');
            result_theta = obj.theta;
        end
        
        function prediction = predictSalary(obj, X)
            X = [1 X];
            prediction = X * obj.theta;
        end

    end % Methods

    
end