n = -2:1;
xn = [1, -4, 3, 6];
xorigin = 3;
k = 1;

function [yn, yorigin] = delay(xn, xorigin, k)
    yn = xn;
    yorigin = xorigin - k;
endfunction

[yn, yorigin] = delay (xn, xorigin, k);
nx = (1:length(xn)) - xorigin;
ny = (1:length(yn)) - yorigin;

function plot_styled(n_idx, val, title_str, pos, color_style)
    subplot(2, 1, pos);

    plot2d3(n_idx, val, style=2); 
    plot(n_idx, val, color_style, 'markerSize', 7, 'markerFaceColor', 'blue'); 

    ymin = min(val); ymax = max(val);
    margin = max(1.5, (ymax - ymin) * 0.2);
    gca().data_bounds = [min(n_idx)-0.5, ymin - margin; max(n_idx)+0.4, ymax + margin];

    for i = 1:length(n_idx)
        offset = (ymax - ymin) * 0.05 + 0.2;
        if val(i) < 0 then offset = -offset * 2.5; end
        xstring(n_idx(i)- 0.02, val(i) + offset, string(val(i)));
    end

    title(title_str, "fontsize", 3);
    xlabel("n"); ylabel("Amplitude");
    xgrid(12);
endfunction

clf();
plot_styled(nx, xn, "Signal xn", 1, 'bo');
plot_styled(ny, yn, "Signal yn", 2, 'bo');
