function r_xy = calculate_correlation_coefficient(x, y, x_units, y_units)
    x_mean = mean(x);
    y_mean = mean(y);

    xy_mean = mean(x .* y);
    xx_mean = mean(x .* x);

    sigma_x = std(x, 1);
    sigma_y = std(y, 1);

    cov_xy = xy_mean - x_mean * y_mean;
    k_yx = cov_xy / (sigma_x ^ 2);
    k_xy = cov_xy / (sigma_y ^ 2);
    r_xy = cov_xy / (sigma_x * sigma_y);

    id = fopen('../../output.txt', 'wt');
    
    fprintf(id, 'Correlation Coefficient Calculations Result:\n\n');

    fprintf(id, '<x> =       %8.3f %s\n', x_mean, x_units);
    fprintf(id, '<y> =       %8.3f %s\n', y_mean, y_units);
    fprintf(id, '<xy> =      %8.3f %s\n', xy_mean, [x_units, '*', y_units]);
    fprintf(id, '<x^2> =     %8.3f %s\n', xx_mean, [x_units, '^2']);
    fprintf(id, '\n');

    fprintf(id, 'sigma_x =   %8.3f %s\n', sigma_x, x_units);
    fprintf(id, 'sigma_y =   %8.3f %s\n', sigma_y, y_units);
    fprintf(id, '\n');

    fprintf(id, 'sigma_x^2 = %8.3f %s\n', sigma_x ^ 2, [x_units, '^2']);
    fprintf(id, 'sigma_y^2 = %8.3f %s\n', sigma_y ^ 2, [y_units, '^2']);
    fprintf(id, '\n');

    fprintf(id, 'cov(x, y) = %8.3f %s\n', cov_xy, [x_units, '*', y_units]);
    fprintf(id, 'k_yx =      %8.3f %s\n', k_yx, [y_units, '/', x_units]);
    fprintf(id, 'k_xy =      %8.3f %s\n', k_xy, [x_units, '/', y_units]);
    fprintf(id, 'r_xy =      %8.3f %s\n', r_xy);
    fprintf(id, '\n\n\n\n');

    fclose(id);
end

