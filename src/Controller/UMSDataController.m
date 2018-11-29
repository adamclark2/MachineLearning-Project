classdef UMSDataController
    properties %public
        data

        % Raw data from csv
        data_apr_2017
        data_apr_2016
        data_nov_2017
        data_nov_2016
        data_nov_2018
        data_sep_2018
    end

    methods

        function obj = campusVsSalary(obj)
            scatter(categorical(obj.data.CMP), obj.data.Salbase);
            title('Salary vs Campus');
        end

        function obj = usmSalaryHistogram(obj)
            histogram(obj.data(strcmp(obj.data.CMP,'USM'),:).Salbase);
            title('USM Salary Histogram');
        end

        % When importing data from the csv files
        % The infered data types are wrong
        % This fixes that
        function import = fixColumnTypeForImport(obj,import)
            import.Salbase = str2double(import.Salbase);
        end

        function data = concatDatasetToData(obj,dataset,month,year)
            yr = year * ones(height(dataset), 1);
            mo = month * ones(height(dataset), 1);
            datasetWithYearAndMonth = [dataset table(yr,mo, 'VariableNames', {'Year', 'Month'})];
            data = [ obj.data;datasetWithYearAndMonth ];
        end

        function obj = UMSDataController(obj) % Constructor
            obj.data_apr_2017 = readtable('../data/UMS_APR_2017.csv');
            obj.data_apr_2017 = obj.fixColumnTypeForImport(obj.data_apr_2017);

            obj.data_apr_2016 = readtable('../data/UMS_APR_2016.csv');
            obj.data_apr_2016 = obj.fixColumnTypeForImport(obj.data_apr_2016);

            obj.data_nov_2017 = readtable('../data/UMS_NOV_2017.csv');
            obj.data_nov_2017 = obj.fixColumnTypeForImport(obj.data_nov_2017);

            obj.data_nov_2016 = readtable('../data/UMS_NOV_2016.csv');
            obj.data_nov_2016 = obj.fixColumnTypeForImport(obj.data_nov_2016);

            obj.data_nov_2018 = readtable('../data/UMS_NOV_2018.csv');
            obj.data_nov_2018 = obj.fixColumnTypeForImport(obj.data_nov_2018);

            obj.data_sep_2018 = readtable('../data/UMS_SEP_2018.csv');
            obj.data_sep_2018 = obj.fixColumnTypeForImport(obj.data_sep_2018);


            % This code creates a master table
            % With the year and month added on
            yr = 2017 * ones(height(obj.data_apr_2017), 1);
            mo = 4 * ones(height(obj.data_apr_2017), 1);
            obj.data = [obj.data_apr_2017 table(yr,mo, 'VariableNames', {'Year', 'Month'})];

            data = obj.concatDatasetToData(obj.data_apr_2016, 4, 2016);
            data = obj.concatDatasetToData(obj.data_nov_2017, 11, 2017);
            data = obj.concatDatasetToData(obj.data_nov_2016, 11, 2016);
            data = obj.concatDatasetToData(obj.data_nov_2018, 11, 2018);
            data = obj.concatDatasetToData(obj.data_sep_2018, 9, 2018);
        end
    end
end