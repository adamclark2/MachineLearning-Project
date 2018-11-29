% This file displays a simple salary graph
% When the function SimpleSalaryGraph is called
%
% This file is mainly an example of Object Oriented
% Programming in matlab and how to do basics



% This is helpful
% https://www.mathworks.com/help/matlab/matlab_oop/create-a-simple-class.html
% https://www.mathworks.com/help/matlab/creating_plots/types-of-matlab-plots.html 

% '<'' means "extends" in java terminology 
% extending handle means the object is pass
% by reference instead of pass by value
classdef SimpleSalaryGraph < handle

    properties (Access = private)
        salaries_vector
    end

    methods % public
        function obj = SimpleSalaryGraph(csv_name) % Constructor
            obj.salaries_vector = readtable(csv_name);
        end % Constructor

        function obj = displayGraph(obj)
            % Gender vs etc.
            figure;
            maleVsFemalePieChart(obj);
            figure;
            maleVsFemaleScatter(obj);
            figure;
            maleVsFemaleVsRankScatter(obj);

            % Histograms
            figure;
            yrsSincePhdHistogram(obj);
            figure;
            yrsOfServiceHistogram(obj);
            figure;
            salaryHistogram(obj);

            % Scatter
            figure;
            rankVsDisciplineVsSalary(obj);

        end %end displayGraph()

        function obj = maleVsFemalePieChart(obj) 
            pie(categorical(obj.salaries_vector.sex, {'Male', 'Female'}));
            title('Number of Males vs Females');
        end 

        function obj = maleVsFemaleScatter(obj) 
            scatter(obj.salaries_vector.salary, categorical(obj.salaries_vector.sex, {'Male', 'Female'}));
            title('Male vs Female Salary');
        end 

        function obj = maleVsFemaleVsRankScatter(obj) 
            scatter3(obj.salaries_vector.salary, categorical(obj.salaries_vector.sex, {'Male', 'Female'}), categorical(obj.salaries_vector.rank, {'Prof', 'AsstProf'}));
            title('Male/Female vs Rank vs Salary');
        end 

        function obj = yrsSincePhdHistogram(obj) 
            histogram(obj.salaries_vector.yrs_since_phd);
            title('Years Since PHD Histogram');
        end 

        function obj = yrsOfServiceHistogram(obj) 
            histogram(obj.salaries_vector.yrs_service);
            title('Years of Service Histogram');
        end 

        function obj = salaryHistogram(obj) 
            histogram(obj.salaries_vector.salary);
            title('Salary Histogram');
        end 

        function obj = rankVsDisciplineVsSalary(obj) 
            scatter3(obj.salaries_vector.salary, categorical(obj.salaries_vector.rank, {'Prof', 'AsstProf'}), categorical(obj.salaries_vector.discipline, {'A', 'B'}));
            title('Rank Vs Discipline Vs Salary');
        end 
        
    end % Methods
    
end