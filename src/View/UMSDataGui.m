% A way to display ums data

classdef UMSDataGui < handle & GUI
    properties (Access = private)
        fig
        cbox_pop_figures
    end

    properties %public
        UMS_data_ctrl
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

        function primary_fig = btnUsmSalaryHistogram(obj,src,event)
            obj.doFigureCreate();
            obj.UMS_data_ctrl.usmSalaryHistogram();
        end

        function primary_fig = btnCampusVsSalary(obj,src,event)
            obj.doFigureCreate();
            obj.UMS_data_ctrl.campusVsSalary();
        end

        function primary_fig = btnGenderPie(obj,src,event)
            obj.doFigureCreate();
            obj.UMS_data_ctrl.umsGenderPie();
        end

        function primary_fig = btnUmsGenderPayCMPScatter(obj,src,event)
            obj.doFigureCreate();
            obj.UMS_data_ctrl.umsGenderPayCMPScatter();
        end

        function primary_fig = btnUmsGenderDeptPayScatter(obj,src,event)
            obj.doFigureCreate();
            obj.UMS_data_ctrl.umsGenderDeptPayScatter();
        end
    
        
    end % public methods

    methods (Access = private)

    % Create a new figure if one needs to be created
        % This should be used in button handlers that
        % create graphs
        function obj = doFigureCreate(obj)
            if obj.cbox_pop_figures.Value == 1
                figure;
            else
                figure(obj.fig);
            end
        end


        function obj = initGui(obj)
            figure(obj.fig);

            pane = obj.createPanel(obj.fig);
            pane.Title = 'Graph Select';

            % Work-around to re-size axes
            scatter3([10 20 30],[10 20 30],[10 20 30]);
            obj.fig.CurrentAxes.Position = [4/10 0+1/20 1-4/10-1/20 1-2/20];
            scatter3([10 20 30],[10 20 30],[10 20 30]);

            % Add buttons to pane
            b = obj.createButton(pane, 'Salary vs Campus', @obj.btnCampusVsSalary);
            b.Position = [0 1-((1/20)*1) 1 1/20];

            b = obj.createButton(pane, 'USM Salary Histogram', @obj.btnUsmSalaryHistogram);
            b.Position = [0 1-((1/20)*2) 1 1/20];

            b = obj.createButton(pane, 'UMS Number of Males vs Females', @obj.btnGenderPie);
            b.Position = [0 1-((1/20)*3) 1 1/20];

            b = obj.createButton(pane, 'UMS Payment by Gender Accross Campuses', @obj.btnUmsGenderPayCMPScatter);
            b.Position = [0 1-((1/20)*4) 1 1/20];

            b = obj.createButton(pane, 'Pay By Gender Across UMS Department', @obj.btnUmsGenderDeptPayScatter);
            b.Position = [0 1-((1/20)*5) 1 1/20];

            obj.cbox_pop_figures = obj.createCheckbox(pane, 'Create new figures');
            obj.cbox_pop_figures.Position = [0 1-((1/20)*20) 1 1/20];
        end
    end % private methods
end