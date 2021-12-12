function [x, y, x_units, y_units] = load_data(filepath)
    tab = readtable(filepath);
    x = table2array(tab(:, 1));
    y = table2array(tab(:, 3));
    x_units = convertStringsToChars(string(tab{1, 2}));
    y_units = convertStringsToChars(string(tab{1, 4}));
end
