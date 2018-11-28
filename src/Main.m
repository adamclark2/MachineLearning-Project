fprintf("Welcome to Salary Estimator\n")
fprintf("By Adam Clark & Alex Dean\n")
fprintf("---------------------------------\n")

g = SimpleSalaryGraph('../data/salaries.csv');
gui = SimpleGui(g);

form = SimpleForm();

% Wait for user to press enter
% pause;
fprintf("\n**END OF PROGRAM**\n")