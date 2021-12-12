function print_measure_results_table(x, y, x_units, y_units)
    x_mean = mean(x);
    y_mean = mean(y);
    sigma_x = std(x, 1);
    sigma_y = std(y, 1);
    n = min(length(x), length(y));
    
    tab1 = num2cell((1 : n)');
    tab1{end + 1} = '';
    tab1{end + 1} = '';
    
    tab2 = cellstr(strrep(string(num2str(x, '%.3f')), '.', ','));
    tab2{end + 1} = '<x> =';
    tab2{end + 1} = '<y> =';
    
    tab3 = cellstr(strrep(string(num2str(y, '%.3f')), '.', ','));
    tab3{end + 1} = cellstr(strrep(string(num2str(x_mean, '%.3f')), '.', ','));
    tab3{end + 1} = cellstr(strrep(string(num2str(y_mean, '%.3f')), '.', ','));
    
    tab4 = cellstr(strrep(string(num2str(x - x_mean, '%.3f')), '.', ','));
    tab4{end + 1} = '';
    tab4{end + 1} = ''; 
    
    tab5 = cellstr(strrep(string(num2str(y - y_mean, '%.3f')), '.', ','));
    tab5{end + 1} = '';
    tab5{end + 1} = '';
    
    tab6 = cellstr(strrep(string(num2str((x - x_mean) .^ 2, '%.3f')), '.', ','));
    tab6{end + 1} = 'sigma_x^2 =';
    tab6{end + 1} = 'sigma_y^2 =';
    
    tab7 = cellstr(strrep(string(num2str((y - y_mean) .^ 2, '%.3f')), '.', ','));
    tab7{end + 1} = cellstr(strrep(string(num2str(sigma_x ^ 2, '%.3f')), '.', ','));
    tab7{end + 1} = cellstr(strrep(string(num2str(sigma_y ^ 2, '%.3f')), '.', ','));
    
    tab = table(tab1, tab2, tab3, tab4, tab5, tab6, tab7);
    tab.Properties.VariableNames = {'i', ...
                                    ['x_i, ', x_units], ...
                                    ['y_i, ', y_units], ...
                                    ['x_i - <x>, ', x_units], ...
                                    ['y_i - <y>, ', y_units], ...
                                    ['(x_i - <x>)^2, ', x_units, '^2'], ...
                                    ['(y_i - <y>)^2, ', y_units, '^2']};
    
    warning('off', 'MATLAB:MKDIR:DirectoryExists');
    mkdir ../../tables;
    writetable(tab, '../../tables/measure_results.csv', 'Delimiter', ';');
end
