% Common code shared across all ui's
classdef (Abstract) GUI < handle
    methods (Abstract)
        % Get the figure associated with the gui
        getPrimaryFigure(obj)
    end

    methods %public

        % Set the visibility of the UI
        function obj = setVisibility(obj,boolean_string)
            obj.getPrimaryFigure().Visible = boolean_string;
        end

        % Create a button with normalized positioning
        % enabled with name and callback
        function btn = createButton(obj,parent,name,callback)
            btn = uicontrol(parent);
            btn.Units = 'normalized';
            btn.String = name;
            btn.Callback = callback;
        end

        % Create a text label with normalized positioning
        % enabled with name
        function btn = createTextLabel(obj,parent,name)
            btn = uicontrol(parent);
            btn.Units = 'normalized';
            btn.String = name;
            btn.Style = 'text';
        end

        % Create a figure that supportes the 'x' button
        function ret_figure = createFigure(obj,src,callbackdata)
            ret_figure = figure;
            ret_figure.CloseRequestFcn = @obj.onClose;
        end

        % Create a uipanel that supportes the 'x' button
        function ret_panel = createPanel(obj,parent)
            ret_panel = uipanel(parent);
            ret_panel.Position = [0 0 3/10 1];
        end

        % Create a checkbox that supportes the 'x' button
        function btn = createCheckbox(obj,parent,name)
            btn = uicontrol(parent);
            btn.Units = 'normalized';
            btn.String = name;
            btn.Style = 'checkbox';
        end

        % On close hide the ui, so
        % the application can re-open
        % the window by calling setVisibility
        function onClose(obj,src,callbackdata)
            obj.setVisibility('off');
        end
    end
end