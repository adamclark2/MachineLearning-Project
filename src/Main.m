addpath('View');
addpath('Controller');


fprintf("Welcome to Salary Estimator\n")
fprintf("By Adam Clark & Alex Dean\n")
fprintf("---------------------------------\n")

fc = FrontController();
%model = LinearRegression('../data/salaries.csv');
%model.performGradientDescent;
%mock = [3 1 19 18 0];
%model.predictSalary(mock)


g = SimpleSalaryGraph('../data/salaries.csv');
gui = SimpleGui(g);
fc.simple_gui = gui;

%form = SimpleForm(model);
%fc.form = form;

umsDataUI = UMSDataGui();
umsDataCtrl = UMSDataController();
figure;
umsDataCtrl.campusVsSalary();
figure;
umsDataCtrl.usmSalaryHistogram();

%primaryView = PrimaryView(fc);

% Wait for user to press enter
% pause;
fprintf("\n**END OF PROGRAM**\n")