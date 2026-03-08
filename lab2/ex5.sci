n=-1:1;
x=[1,3,-2];
x_rev=[-2,3,1];

xe=0.5*(x+x_rev);
xo=0.5*(x-x_rev);

function plot_signal(n_idx, val, title_str, pos)
    subplot(3, 1, pos);
    plot2d3(n_idx, val, style=2);
    plot(n_idx, val, 'bo', 'markerSize', 7, 'markerFaceColor', 'blue');
    
    ymin = min(val); ymax = max(val);
    margin = max(0.5, (ymax - ymin) * 0.); 3
    gca().data_bounds = [min(n_idx)-0.5, ymin - margin; max(n_idx)+0.5, ymax + margin];
    
    for i = 1:length(n_idx)
        xstring(n_idx(i), val(i) + 0.1, string(val(i)));
    end
    
    title(title_str, "fontsize", 3);
    xlabel("n"); ylabel("Amplitude");
    xgrid(12);
endfunction

clf();
plot_signal(n, x, "Original Signal x(n)", 1);
plot_signal(n, xe, "Even component xe(n)", 2);
plot_signal(n, xo, "Odd component xo(n)", 3);
