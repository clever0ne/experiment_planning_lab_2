clc; clear; close all;

[x, y, x_units, y_units] = load_data('../../input.txt');
alpha = load('../../alpha.txt');

print_measure_results_table(x, y, x_units, y_units);
print_correlation_field_plot(x, y, x_units, y_units);
r_xy = calculate_correlation_coefficient(x, y, x_units, y_units);
print_regression_lines_plot(x, y, x_units, y_units);
check = check_correlation(x, y, r_xy, alpha);
