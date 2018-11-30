% A way to display ums data

classdef UMSDataGui < handle & GUI
    properties (Access = private)
        fig
    end

    methods % public
        function obj = UMSDataGui(obj)
            obj.fig = obj.createFigure();
        end

        % Abstract implementation
        function primary_fig = getPrimaryFigure(obj)
            primary_fig = obj.fig;
        end
    end % public methods

    methods (Access = private)
        function obj = initGui(obj)
            fig = uifigure();

        end
    end % private methods
end