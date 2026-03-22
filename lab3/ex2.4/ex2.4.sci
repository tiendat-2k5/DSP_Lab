n=-2:2;
x=[2,3,4,5,6];

x_rev = [6,5,4,3,2];

xe = (x + x_rev)/2;
xo = (x - x_rev)/2;

function plot_styled(n_idx, val, title_str, pos)
    subplot(3, 1, pos);

    plot2d3(n_idx, val, style=2); 
    plot(n_idx, val, 'bo', 'markerSize', 4, 'markerFaceColor', 'blue'); 

    ymin = min(val); ymax = max(val);
    margin = max(1.5, (ymax - ymin) * 0.4);
    gca().data_bounds = [min(n_idx)-0.5, ymin - margin; max(n_idx)+0.2, ymax + margin];

    for i = 1:length(n_idx)
        if val(i) <> 0 then
            xstring(n_idx(i) - 0.3, val(i) + 0.1, string(val(i)));
        end
    end

    title(title_str, "fontsize", 3);
    xlabel("n"); ylabel("Amplitude");
    xgrid(12);
endfunction

clf
plot_styled(n, x, "Origin x(n)", 1);
plot_styled(n, xe, "Even Signal xe(n)", 2);
plot_styled(n, xo, "Odd Signal xo(n)", 3);
