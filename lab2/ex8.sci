
n_view = -6:3;

function y = get_full_signal(n_common, n_sub, x_sub)
    y = zeros(1, length(n_common));
    for i = 1:length(n_sub)
        idx = find(n_common == n_sub(i));
        if ~isempty(idx) then
            y(idx) = x_sub(i);
        end
    end
endfunction

n_orig = -2:1;
x_orig = [1, -2, 3, 6];

n_a = -1:2; y_a_vals = [6, 3, -2, 1];
y1 = get_full_signal(n_view, n_a, y_a_vals);

n_b = n_orig - 3; 
y2 = get_full_signal(n_view, n_b, x_orig);

n_c = -3:0; y_c_vals = 2 * [6, 3, -2, 1];
y3 = get_full_signal(n_view, n_c, y_c_vals);

function plot_with_zeros(n_vals, y_vals, title_str, pos)
    subplot(4, 1, pos);    

    plot2d3(n_vals, y_vals, style=2);

    plot(n_vals, y_vals, 'bo', 'markerSize', 6, 'markerFaceColor', 'white');

    ymin = min(y_vals); ymax = max(y_vals);
    margin = max(2, (ymax - ymin) * 0.4);
    gca().data_bounds = [min(n_vals)-0.5, ymin - margin; max(n_vals)+0.5, ymax + margin];

    for i = 1:length(n_vals)
        offset = 0.5;
        if y_vals(i) < 0 then offset = -1.0; end

        xstring(n_vals(i) - 0.15, y_vals(i) + offset, string(y_vals(i)));
    end
    
    title(title_str, "fontsize", 3);
    xgrid(12);
endfunction

clf();
plot_with_zeros(n_view, get_full_signal(n_view, n_orig, x_orig), "Original x(n)", 1);
plot_with_zeros(n_view, y1, "a. y1(n) = x(-n)", 2);
plot_with_zeros(n_view, y2, "b. y2(n) = x(n+3)", 3);
plot_with_zeros(n_view, y3, "c. y3(n) = 2x(-n-2)", 4);
n_view = -6:3;

function y = get_full_signal(n_common, n_sub, x_sub)
    y = zeros(1, length(n_common));
    for i = 1:length(n_sub)
        idx = find(n_common == n_sub(i));
        if ~isempty(idx) then
            y(idx) = x_sub(i);
        end
    end
endfunction

n_orig = -2:1;
x_orig = [1, -2, 3, 6];

n_a = -1:2; y_a_vals = [6, 3, -2, 1];
y1 = get_full_signal(n_view, n_a, y_a_vals);

n_b = n_orig - 3; 
y2 = get_full_signal(n_view, n_b, x_orig);

n_c = -3:0; y_c_vals = 2 * [6, 3, -2, 1];
y3 = get_full_signal(n_view, n_c, y_c_vals);

function plot_with_zeros(n_vals, y_vals, title_str, pos)
    subplot(4, 1, pos);

    plot2d3(n_vals, y_vals, style=2);

    plot(n_vals, y_vals, 'bo', 'markerSize', 6, 'markerFaceColor', 'white');

    ymin = min(y_vals); ymax = max(y_vals);
    margin = max(2, (ymax - ymin) * 0.4);
    gca().data_bounds = [min(n_vals)-0.5, ymin - margin; max(n_vals)+0.5, ymax + margin];

    for i = 1:length(n_vals)
        offset = 0.5;
        if y_vals(i) < 0 then offset = -1.0; end

        xstring(n_vals(i) - 0.15, y_vals(i) + offset, string(y_vals(i)));
    end
    
    title(title_str, "fontsize", 3);
    xgrid(12);
endfunction

clf();
plot_with_zeros(n_view, get_full_signal(n_view, n_orig, x_orig), "Original x(n)", 1);
plot_with_zeros(n_view, y1, "a. y1(n) = x(-n)", 2);
plot_with_zeros(n_view, y2, "b. y2(n) = x(n+3)", 3);
plot_with_zeros(n_view, y3, "c. y3(n) = 2x(-n-2)", 4);
