addpath('View');
addpath('Controller');


fprintf("Welcome to Salary Estimator\n")
fprintf("By Adam Clark & Alex Dean\n")
fprintf("---------------------------------\n")

fc = FrontController();
model = LinearRegression('../data/salaries.csv');
model.performGradientDescent;
mock = [3 1 19 18 0];
model.predictSalary(mock)


g = SimpleSalaryGraph('../data/salaries.csv');
gui = SimpleGui(g);
fc.simple_gui = gui;
gui.setVisibility('off');

form = SimpleForm(model);
form.setVisibility('off');
fc.form = form;

umsDataUI = UMSDataGui();
umsDataUI.setVisibility('off');
umsDataCtrl = UMSDataController();
fc.ums_data_gui = umsDataUI;
umsDataUI.UMS_data_ctrl = umsDataCtrl;

primaryView = PrimaryView(fc);
primaryView.setVisibility('on');

% Wait for user to press enter
% pause;
fprintf("\n**END OF PROGRAM**\n")