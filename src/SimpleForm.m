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
classdef SimpleForm < handle

    properties (Access = private)
        fig
        model
    end

    methods % public
        function obj = SimpleForm(model) % Constructor
            obj.fig = figure();
            obj.model = model;
            obj.initGui();

            obj.setFigureCurrent();

            obj.fig.Position = [10 100 270 650]
        end % Constructor

        % Allow external functions to
        % draw to this SimpleForm
        function obj = setFigureCurrent(obj)
            figure(obj.fig);
        end

        %%%%%%%%%%%%%%%%   btn handlers %%%%%%%%%%%%%%%%%%%%%

    end % end methods

    methods (Access = private)
        function obj = initGui(obj) 
            obj.setFigureCurrent();

            numBtn = 1;
            numBtn = obj.createUICtrl('text', '$999,999.00', 12.5, numBtn);
            numBtn = obj.createUICtrl('pushbutton', 'Guess Salary', 12.5, numBtn);

            numBtn = obj.createUICtrl('popupmenu', {'Prof', 'AsstProf', 'AssocProf'}, 12.5, numBtn);
            numBtn = obj.createUICtrl('text', 'Rank', 14, numBtn);
            numBtn = numBtn + 1;
            numBtn = obj.createUICtrl('popupmenu', {'A', 'B'}, 12.5, numBtn);
            numBtn = obj.createUICtrl('text', 'Discipline', 14, numBtn);

            numBtn = numBtn + 1;
            numBtn = obj.createUICtrl('edit', '', 12, numBtn);
            numBtn = obj.createUICtrl('text', 'Years Since Phd', 12, numBtn);

            numBtn = numBtn + 1;
            numBtn = obj.createUICtrl('edit', '', 12, numBtn);
            numBtn = obj.createUICtrl('text', 'Years of Service', 12, numBtn);

            numBtn = numBtn + 1;
            numBtn = obj.createUICtrl('popupmenu', {'Male', 'Female'}, 12.5, numBtn);
            numBtn = obj.createUICtrl('text', 'Sex', 14, numBtn);

            numBtn = numBtn + 1;
            numBtn = obj.createUICtrl('text', 'Enter your info & we will guess how much you make', 12, numBtn);
            numBtn = obj.createUICtrl('text', 'Regression Salary Check', 24, numBtn);
            
        end 

        function ctrlIndex = createUICtrl(obj, style, string, fontsize, ctrlIndex)
            b = uicontrol();
            b.Style = style;
            b.String = string;
            b.Position = [20 31*ctrlIndex 230 29];
            b.FontSize = fontsize;

            ctrlIndex = ctrlIndex + 1;  
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