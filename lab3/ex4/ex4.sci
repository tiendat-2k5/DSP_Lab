//n = -1:3;
x1n = [0, 1, 2, -2];
x2n = [1, 3, 2, 1];
x1origin = 1;
x2origin = 2;

function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    n_min = min(min(n1), min(n2));
    n_max = max(max(n1), max(n2));
    ny = n_min : n_max;
    yn = zeros(1, length(ny));
    
    pos1 = (min(n1) - n_min) + (1:length(x1n));
    pos2 = (min(n2) - n_min) + (1:length(x2n));
    yn(pos1) = yn(pos1) + x1n;
    yn(pos2) = yn(pos2) + x2n;
    
    yorigin = 1 - n_min;
endfunction

[yn, yorigin] = add (x1n, x1origin, x2n, x2origin);
nx1 = (1:length(x1n)) - x1origin;
nx2 = (1:length(x2n)) - x2origin;
ny = (1:length(yn)) - yorigin;

function plot_styled(n_idx, val, title_str, pos, color_style)
    subplot(3, 1, pos);

    plot2d3(n_idx, val, style=2); 
    plot(n_idx, val, color_style, 'markerSize', 7, 'markerFaceColor', 'blue'); 

    ymin = min(val); ymax = max(val);
    margin = max(1.5, (ymax - ymin) * 0.3);
    gca().data_bounds = [min(n_idx)-0.5, ymin - margin; max(n_idx)+0.1, ymax + margin];

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
plot_styled(nx1, x1n, "Signal x1n", 1, 'bo');
plot_styled(nx2, x2n, "Signal x2n", 2, 'bo');
plot_styled(ny, yn, "Signal yn", 3, 'bo');
