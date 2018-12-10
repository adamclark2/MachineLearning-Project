addpath('View');
addpath('Controller');


fprintf("Welcome to Salary Estimator\n")
fprintf("By Adam Clark & Alex Dean\n")
fprintf("---------------------------------\n")
% ________________________________________________________________________



% Uncomment to run linear regression
%theta = doLinearRegression('../data/salaries.csv');
%g = SimpleSalaryGraph('../data/salaries.csv');



% ________________________________________________________________________



% UI Stuff, comment to hide ui
fc = FrontController();

g = SimpleSalaryGraph('../data/salaries.csv');
gui = SimpleGui(g);
fc.simple_gui = gui;
gui.setVisibility('off');

%form = SimpleForm();
%form.setVisibility('off');
%form.theta = theta;
%fc.form = form;

umsDataUI = UMSDataGui();
umsDataUI.setVisibility('off');
umsDataCtrl = UMSDataController();
fc.ums_data_gui = umsDataUI;
umsDataUI.UMS_data_ctrl = umsDataCtrl;

primaryView = PrimaryView(fc);
primaryView.setVisibility('on');




% ___________________ END OF PROGRAM ___________________ 
% ______________________________________________________
fprintf("\n**  DONE LOADING  **\n")