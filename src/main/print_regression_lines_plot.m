function print_regression_lines_plot(x, y, x_units, y_units)
    dx = 0.1 * (max(x) - min(x));
    dy = 0.1 * (max(y) - min(y));
    
    xmin = min(x) - sign(min(x)) * dx;
    ymin = min(y) - sign(min(y)) * dy;
    xmax = max(x) + sign(max(x)) * dx;
    ymax = max(y) + sign(max(y)) * dy;
    
    a = polyfit(x, y, 1);
    b = polyfit(y, x, 1);
    
    x1 = xmin : dx : xmax;
    y1 = polyval(a, x1);
    
    y2 = ymin : dy : ymax;
    x2 = polyval(b, y2);
    
    figure('Name', 'Correlation Field with Regression Lines');
    plot(x, y, 'ro', x1, y1, 'r-', x2, y2, 'b--');
    
    axis([xmin, xmax, ymin, ymax]);
    grid on;
    
    set(gca, 'FontName', 'Euclid', 'FontSize', 12);
    xlabel(['$x, \rm ', x_units, '$'], 'Interpreter', 'latex', 'FontSize', 12);
    ylabel(['$y, \rm ', y_units, '$'], 'Interpreter', 'latex', 'FontSize', 12);  
    legend('$(x_i, y_i)$', '$y_x = \hat{\varphi}(x)$', '$x_y = \hat{\psi}(y)$', 'Interpreter', 'latex', 'FontSize', 10);
    
    warning('off', 'MATLAB:MKDIR:DirectoryExists');
    mkdir ../../graphs;
    saveas(gcf, '../../graphs/regression_lines_plot.emf');
end

