% A simple gui for SimpleSalaryGraph
% This let's you use buttons instead of displaying all
% The graphs at once
% You can also 'pop' the graphs out if you want



% This is helpful
% https://www.mathworks.com/help/matlab/matlab_oop/create-a-simple-class.html
% https://www.mathworks.com/help/matlab/ref/uicontrol.html
% https://www.mathworks.com/help/matlab/ref/uipanel.html

% '<' means "extends" in java terminology 
% extending handle means the object is pass
% by reference instead of pass by value
classdef SimpleGui < handle

    properties (Access = private)
        salary_grapher
     
        fig
        create_new_figs_cbox
    end

    methods % public
        function obj = SimpleGui(grapher) % Constructor
            obj.salary_grapher = grapher;
            obj.fig = figure();
            obj.initGui();

            obj.setFigureCurrent();
            ax = gca;
            ax.Position = [0.34 0.1100 0.65 0.8150];
            obj.fig.Position = [10 100 900 400];
        end % Constructor

        % Allow external functions to
        % draw to this SimpleGui
        function obj = setFigureCurrent(obj)
            figure(obj.fig);
        end

        %%%%%%%%%%%%%%%%   btn handlers %%%%%%%%%%%%%%%%%%%%%
        function btnHelloWorld(obj, src, event)
            fprintf('Hello World!\n');
        end

        function btnMaleVsFemalePieChart(obj, src, event)
            obj.doFigureCreate();
            obj.salary_grapher.maleVsFemalePieChart();
        end

        function btnMaleVsFemaleVsRankScatter(obj, src, event)
            obj.doFigureCreate();
            obj.salary_grapher.maleVsFemaleVsRankScatter();
        end

        function btnMaleVsFemaleScatter(obj, src, event)
            obj.doFigureCreate();
            obj.salary_grapher.maleVsFemaleScatter();
        end

        function btnYrsSincePhdHistogram(obj, src, event)
            obj.doFigureCreate();
            obj.salary_grapher.yrsSincePhdHistogram();
        end

        function btnYrsOfServiceHistogram(obj, src, event)
            obj.doFigureCreate();
            obj.salary_grapher.yrsOfServiceHistogram();
        end

        function btnSalaryHistogram(obj, src, event)
            obj.doFigureCreate();
            obj.salary_grapher.salaryHistogram();
        end

        function btnRankVsDisciplineVsSalary(obj, src, event)
            obj.doFigureCreate();
            obj.salary_grapher.yrsOfServiceHistogram();
        end

    end % end methods

    methods (Access = private)
        function obj = initGui(obj) 
            obj.setFigureCurrent();

            numBtn = 1;
            b = uicontrol();
            b.Style = 'checkbox';
            b.String = 'Create New Figures';
            b.Position = [20 35*numBtn 230 30];
            b.Callback = @obj.btnHelloWorld;
            obj.create_new_figs_cbox = b;
            numBtn = numBtn + 1;

            numBtn = obj.createBtn('Hello Btn', numBtn, @obj.btnHelloWorld);

            numBtn = obj.createBtn('Number of Males vs Females', numBtn, @obj.btnMaleVsFemalePieChart);
            numBtn = obj.createBtn('Male vs Female Salary', numBtn, @obj.btnMaleVsFemaleScatter);
            numBtn = obj.createBtn('Male/Female vs Rank vs Salary', numBtn, @obj.btnMaleVsFemaleVsRankScatter); 

            numBtn = obj.createBtn('Years Since PHD Histogram', numBtn, @obj.btnYrsSincePhdHistogram);
            numBtn = obj.createBtn('Years of Service Histogram', numBtn, @obj.btnYrsOfServiceHistogram);
            numBtn = obj.createBtn('Salary Histogram', numBtn, @obj.btnSalaryHistogram);  
            numBtn = obj.createBtn('Rank Vs Discipline Vs Salary', numBtn, @obj.btnRankVsDisciplineVsSalary);    
        end 

        % Create A Button on the side of the current figure
        function num = createBtn(obj, name, indexOfBtn, btnHandlerFunc) 
            b = uicontrol();
            b.Style = 'pushbutton';
            b.String = name;
            b.Position = [20 35*indexOfBtn 230 30];
            b.Callback = btnHandlerFunc;

            num = indexOfBtn + 1;
        end

        % Create a new figure if one needs to be created
        % This should be used in button handlers that
        % create graphs
        function obj = doFigureCreate(obj)
            if obj.create_new_figs_cbox.Value == 1
                figure;
            else
                obj.setFigureCurrent();
            end
        end

    end % end private methods
end