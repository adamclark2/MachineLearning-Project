% A way to display multiple views

% Helpfil Links
% https://www.mathworks.com/help/matlab/creating_guis/using-grid-layout-managers.html
% https://www.mathworks.com/help/matlab/ref/uibutton.html 

classdef PrimaryView < handle
    properties (Access = private)
        fig
        layout_manager
    end

    properties
        fc
    end

    methods % public
        function obj = PrimaryView(front_ctrl)
            obj.fig = uifigure;
            obj.fc = front_ctrl;
            obj.initGui();
        end

        function obj = btn(obj,src,event)
            fprintf("cool!");
        end

        function obj = btnSalaryData(obj,src,event)
            obj.fc.btnSalaryData(event);
        end
    end % public methods

    methods (Access = private)
        function obj = initGui(obj)
            obj.layout_manager = uigridlayout(obj.fig);
            obj.layout_manager.RowHeight = {'1x', '1x', '1x'};
            obj.layout_manager.ColumnWidth = {'1x'};

            b = uibutton(obj.layout_manager);
            b.Text = 'Salary Data';
            b.ButtonPushedFcn = @obj.btnSalaryData;

            b = uibutton(obj.layout_manager);
            b.Text = 'UMS Data';

            b = uibutton(obj.layout_manager);
            b.Text = 'Form';
        end

    end % private methods
end