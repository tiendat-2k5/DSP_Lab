n = -1:3;
x1 = [0, 0, 1, 3, -2];
x2 = [0, 1, 2, 3, 0];
y = x1 + x2;

function plot_enhanced(n_idx, val, title_str, pos)
    subplot(3, 1, pos);

    plot2d3(n_idx, val, style=2); 
    plot(n_idx, val, 'bo', 'markerSize', 7, 'markerFaceColor', 'blue'); 

    ymin = min(val); ymax = max(val);
    margin = max(1.0, (ymax - ymin) * 0.3);
    gca().data_bounds = [min(n_idx)-0.5, ymin - margin; max(n_idx)+0.5, ymax + margin];

    for i = 1:length(n_idx)
        offset = 0.2;
        if val(i) < 0 then offset = -0.6; end 
        xstring(n_idx(i) - 0.1, val(i) + offset, string(val(i)));
    end

    title(title_str, "fontsize", 3);
    xlabel("n"); ylabel("Amplitude");
    xgrid(12);
endfunction

clf(); 
plot_enhanced(n, x1, "Signal x1(n)", 1);
plot_enhanced(n, x2, "Signal x2(n)", 2);
plot_enhanced(n, y, "Resultant Signal y(n) = x1(n) + x2(n)", 3);
