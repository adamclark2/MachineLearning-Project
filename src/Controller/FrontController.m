classdef FrontController < handle

    properties (Constant)
        front_controller
    end

    properties
        simple_gui   % Salary Data UI
        ums_data_gui % UMS Gui
        form         % User input form UI
    end

    methods %public
        function obj = FrontController(obj)
            % constructor
        end

        function obj = btnSalaryData(obj,btn)
            obj.simple_gui.setVisibility('on');
            obj.simple_gui.btnMaleVsFemaleScatter('','');
        end

        function obj = btnUMSData(obj,btn)
            obj.ums_data_gui.setVisibility('on');
        end

        function obj = btnForm(obj,btn)
            % Todo clear form in between clicks
            obj.form.setVisibility('on');
        end
    end %public methods
    
end