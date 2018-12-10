% A simple gui to get data from the user
% This could be used to guess there salary
%
% ... Proof of conscept, final idea may change



% This is helpful
% https://www.mathworks.com/help/matlab/matlab_oop/create-a-simple-class.html
% https://www.mathworks.com/help/matlab/ref/uicontrol.html
% https://www.mathworks.com/help/matlab/ref/uipanel.html

% '<' means "extends" in java terminology 
% extending handle means the object is pass
% by reference instead of pass by value
classdef SimpleForm < handle & GUI

    properties %public
        theta
    end

    properties (Access = private)
        fig

        rank_in
        discipline
        yrs_since_phd
        yrs_service
        sex
        salary
    end

    methods % public
        function obj = SimpleForm() % Constructor
            obj.fig = figure();
            obj.initGui();

            obj.setFigureCurrent();

            obj.fig.Position = [10 100 270 650]
            obj.fig.Visible = 'off';

        end % Constructor

        % Allow external functions to
        % draw to this SimpleForm
        function obj = setFigureCurrent(obj)
            figure(obj.fig);
        end

        % Abstract implementation
        function primary_fig = getPrimaryFigure(obj)
            primary_fig = obj.fig;
        end

        function prediction = predictSalary(obj, X)
            X = [1 X];
            prediction = X * obj.theta;
        end

        function obj = guessSalary(obj,src,event)
            s = obj.sex.Value - 1;
            phd = str2num(obj.yrs_since_phd.String);
            dis = obj.discipline.Value - 1;
            rank_t = obj.rank_in.Value - 1;
            yrs_service_t = str2num(obj.yrs_service.String);
            obj.salary.String = '** ERROR **';

            if(isprop(obj, 'theta'))
                obj.salary.String = num2str(obj.predictSalary([s phd dis rank_t yrs_service_t]));
            end 
        end

        %%%%%%%%%%%%%%%%   btn handlers %%%%%%%%%%%%%%%%%%%%%

    end % end methods

    methods (Access = private)
        function obj = initGui(obj) 
            obj.setFigureCurrent();        

            numBtn = 1;
            [numBtn, ctrl] = obj.createUICtrl('text', '$999,999.00', 12.5, numBtn);
            obj.salary = ctrl;
            [numBtn, ctrl] = obj.createUICtrl('pushbutton', 'Guess Salary', 12.5, numBtn);
            ctrl.Callback = @obj.guessSalary;

            [numBtn, ctrl] = obj.createUICtrl('popupmenu', {'Prof', 'AssocProf', 'AsstProf'}, 12.5, numBtn);
            obj.rank_in = ctrl;
            [numBtn, ctrl] = obj.createUICtrl('text', 'Rank', 14, numBtn);
            numBtn = numBtn + 1;
            [numBtn, ctrl] = obj.createUICtrl('popupmenu', {'A', 'B'}, 12.5, numBtn);
            obj.discipline = ctrl;
            [numBtn, ctrl] = obj.createUICtrl('text', 'Discipline', 14, numBtn);

            numBtn = numBtn + 1;
            [numBtn, ctrl] = obj.createUICtrl('edit', '', 12, numBtn);
            obj.yrs_since_phd = ctrl;
            [numBtn, ctrl] = obj.createUICtrl('text', 'Years Since Phd', 12, numBtn);

            numBtn = numBtn + 1;
            [numBtn, ctrl] = obj.createUICtrl('edit', '', 12, numBtn);
            obj.yrs_service = ctrl;
            [numBtn, ctrl] = obj.createUICtrl('text', 'Years of Service', 12, numBtn);

            numBtn = numBtn + 1;
            [numBtn, ctrl] = obj.createUICtrl('popupmenu', {'Male', 'Female'}, 12.5, numBtn);
            obj.sex = ctrl;
            [numBtn, ctrl] = obj.createUICtrl('text', 'Sex', 14, numBtn);

            numBtn = numBtn + 1;
            [numBtn, ctrl] = obj.createUICtrl('text', 'Enter your info & we will guess how much you make', 12, numBtn);
            [numBtn, ctrl] = obj.createUICtrl('text', 'Regression Salary Check', 24, numBtn);
            
        end 

        function [ctrlIndex, uictrl] = createUICtrl(obj, style, string, fontsize, ctrlIndex)
            b = uicontrol();
            b.Style = style;
            b.String = string;
            b.Position = [20 31*ctrlIndex 230 29];
            b.FontSize = fontsize;

            ctrlIndex = ctrlIndex + 1;  
            uictrl = b;
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