% A way to display ums data

classdef UMSDataGui < handle & GUI
    properties (Access = private)
        fig

        cbox_pop_figures
    end

    methods % public
        function obj = UMSDataGui(obj)
            obj.fig = obj.createFigure();
            obj.fig.Position = [80 80 870 570];
            obj.initGui();
        end

        % Abstract implementation
        function primary_fig = getPrimaryFigure(obj)
            primary_fig = obj.fig;
        end

        function primary_fig = btnGeneric(obj,src,event)
            fprintf('Generic button press\n');
        end
    end % public methods

    methods (Access = private)
        function obj = initGui(obj)
            figure(obj.fig);

            pane = obj.createPanel(obj.fig);
            pane.Title = 'Graph Select';

            % Work-around to re-size axes
            scatter3([10 20 30],[10 20 30],[10 20 30]);
            obj.fig.CurrentAxes.Position = [4/10 0 1-4/10-1/20 1];
            scatter3([10 20 30],[10 20 30],[10 20 30]);

            % Add buttons to pane
            b = obj.createButton(pane, 'Woot 1', @obj.btnGeneric);
            b.Position = [0 1-((1/20)*1) 1 1/20];

            b = obj.createButton(pane, 'Woot 2', @obj.btnGeneric);
            b.Position = [0 1-((1/20)*2) 1 1/20];

            b = obj.createButton(pane, 'Woot 3', @obj.btnGeneric);
            b.Position = [0 1-((1/20)*3) 1 1/20];

            obj.cbox_pop_figures = obj.createCheckbox(pane, 'Create new figures');
            obj.cbox_pop_figures.Position = [0 1-((1/20)*20) 1 1/20];
        end
    end % private methods
end