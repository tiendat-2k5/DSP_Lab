n = -1:3;
x1 = [0, 0, 1, 3, -2];
x2 = [0, 1, 2, 3, 0];
y = x1 .* x2;

function plot_styled(n_idx, val, title_str, pos, color_style)
    subplot(3, 1, pos);

    plot2d3(n_idx, val, style=2); 
    plot(n_idx, val, color_style, 'markerSize', 7, 'markerFaceColor', 'blue'); 

    ymin = min(val); ymax = max(val);
    margin = max(1.5, (ymax - ymin) * 0.3);
    gca().data_bounds = [min(n_idx)-0.5, ymin - margin; max(n_idx)+0.5, ymax + margin];

    for i = 1:length(n_idx)
        offset = (ymax - ymin) * 0.05 + 0.2;
        if val(i) < 0 then offset = -offset * 2.5; end
        xstring(n_idx(i) - 0.1, val(i) + offset, string(val(i)));
    end

    title(title_str, "fontsize", 3);
    xlabel("n"); ylabel("Amplitude");
    xgrid(12);
endfunction

clf(); 
plot_styled(n, x1, "Signal x1(n)", 1, 'bo');
plot_styled(n, x2, "Signal x2(n)", 2, 'bo');
plot_styled(n, y, "Resultant Signal y(n) = x1(n) * x2(n)", 3, 'ro');
