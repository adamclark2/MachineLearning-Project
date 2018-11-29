fprintf("Welcome to Salary Estimator\n")
fprintf("By Adam Clark & Alex Dean\n")
fprintf("---------------------------------\n")

model = LinearRegression('../data/salaries.csv');
model.performGradientDescent;
mock = [3 1 19 18 0];
model.predictSalary(mock)
g = SimpleSalaryGraph('../data/salaries.csv');
gui = SimpleGui(g);

form = SimpleForm(model);

% Wait for user to press enter
% pause;
fprintf("\n**END OF PROGRAM**\n")