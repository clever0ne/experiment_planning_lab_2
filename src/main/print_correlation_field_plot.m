function print_correlation_field_plot(x, y, x_units, y_units)
    dx = 0.1 * (max(x) - min(x));
    dy = 0.1 * (max(y) - min(y));
    
    xmin = min(x) - sign(min(x)) * dx;
    ymin = min(y) - sign(min(y)) * dy;
    xmax = max(x) + sign(max(x)) * dx;
    ymax = max(y) + sign(max(y)) * dy;

    figure('Name', 'Correlation Field');
    plot(x, y, 'ro');
    
    axis([xmin, xmax, ymin, ymax]);
    grid on;
    
    set(gca, 'FontName', 'Euclid', 'FontSize', 12);
    xlabel(['$x, \rm ', x_units, '$'], 'Interpreter', 'latex', 'FontSize', 12);
    ylabel(['$y, \rm ', y_units, '$'], 'Interpreter', 'latex', 'FontSize', 12);
    
    warning('off', 'MATLAB:MKDIR:DirectoryExists');
    mkdir ../../graphs;
    saveas(gcf, '../../graphs/correlation_field_plot.emf');
end

