% A way to display multiple views

% Helpfil Links
% https://www.mathworks.com/help/matlab/creating_guis/using-grid-layout-managers.html
% https://www.mathworks.com/help/matlab/ref/uibutton.html 

classdef PrimaryView < handle & GUI
    properties (Access = private)
        fig
        layout_manager
    end

    properties
        fc
    end

    methods % public
        function obj = PrimaryView(front_ctrl)
            obj.fig = figure;
            obj.fc = front_ctrl;
            obj.initGui();
        end

        % Abstract implementation
        function primary_fig = getPrimaryFigure(obj)
            primary_fig = obj.fig;
        end

        function obj = btnSalaryData(obj,src,event)
            obj.fc.btnSalaryData(event);
        end

        function obj = btnUMSData(obj,src,event)
            obj.fc.btnUMSData(event);
        end

        function obj = btnForm(obj,src,event)
            obj.fc.btnForm(event);
        end
    end % public methods

    methods (Access = private)
        function obj = initGui(obj)
            btnHeight = 1/10;
            b = obj.createButton(obj.fig, 'Salary Data', @obj.btnSalaryData);
            b.Position = [ 0 1-btnHeight 1 btnHeight];

            b = obj.createButton(obj.fig, 'UMS Data', @obj.btnUMSData);
            b.Position = [ 0 1-btnHeight*2 1 btnHeight];

            % Todo create blurb
            %blurb = {'TODO: blurb goes here about ui ................... auto spans multiple lines \n doesnt work use other values in cell' ...
            %,'', ...
            %'woot a new line!'};
            %b = obj.createTextLabel(obj.fig, blurb);
           % b.HorizontalAlignment = 'left';
           % b.FontSize = 18;
           % b.Position = [0 0 1 3/10];
        end

    end % private methods
end