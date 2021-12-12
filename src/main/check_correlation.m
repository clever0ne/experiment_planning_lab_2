function check = check_correlation(x, y, r_xy, alpha)
    n = min(length(x), length(y));
    k = n - 2;
    
    t1 = r_xy * sqrt(n - 2) / sqrt(1 - r_xy ^ 2);
    t2 = tinv(1 - alpha, k);

    id = fopen('../../output.txt', 'a');
    
    fprintf(id, 'Student''s t-Test Result:\n\n');
    fprintf(id, 'Degrees of freedom ''k'':                   %8.3f\n', k);
    fprintf(id, 'Significance level ''alpha'':               %8.3f\n', alpha);
    fprintf(id, 'Empirical t-statistic value ''t(n)'':       %8.3f\n', t1);
    fprintf(id, 'Critical t-statistic value ''t(alpha, k)'': %8.3f\n', t2);
    
    if (t1 > t2)
        check = true;
        fprintf(id, '\n''t(n)'' = %.3f > ''t(alpha, k)'' = %.3f\n', t1, t2);
        fprintf(id, 'The hypothesis of the linear correlation of ''x'' and ''y'' was accepted.');
        
    else
        check = false;
        fprintf(id, '\n''t(n)'' = %.3f < ''t(alpha, k)'' = %.3f\n', t1, t2);
        fprintf(id, 'The hypothesis of the linear correlation of ''x'' and ''y'' was denied.');
    end
    
    fprintf(id, '\n\n\n\n');
    
    fclose(id);
end

