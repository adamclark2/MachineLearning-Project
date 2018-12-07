clear ; close all; clc
fprintf("Welcome to Salary Estimator\n")
fprintf("By Adam Clark & Alex Dean\n")
fprintf("---------------------------------\n")

theta = doLinearRegression('../data/salaries.csv');
g = SimpleSalaryGraph('../data/salaries.csv');
gui = SimpleGui(g);

form = SimpleForm();

% Wait for user to press enter
% pause;
fprintf("\n**END OF PROGRAM**\n")