classdef FrontController < handle

    properties (Constant)
        front_controller
    end

    properties
        simple_gui % Salary Data UI
        form       % User input form UI
    end

    methods %public
        function obj = FrontController(obj)
            % constructor
        end

        function obj = btnSalaryData(obj,btn)
            obj.simple_gui.setHidden('on');
        end
    end %public methods
    
end