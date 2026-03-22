n = -10:10;
function y = x(n_val)
    y = zeros(n_val);
    y(n_val == -1) = 1;
    y(n_val == 0) = 1;
    y(n_val == 1) = 1;
    y(n_val == 2) = 1;
    y(n_val == 3) = 0.5;
    y(n_val == 4) = 0.5;
endfunction

xn = x(n);

xa = x(n - 2);

xb = x(4 - n);

xc = x(n + 2);

u_2n = (2 - n >= 0);
xd = xn .* u_2n;

delta_n3 = (n == 3);
xe = x(n-1) .* delta_n3;

xf = x(n.^2);

x_minus_n = x(-n);
xg = 0.5 * (xn + x_minus_n);

xh = 0.5 * (xn - x_minus_n);

function plot_styled(n_idx, val, title_str, pos)
    subplot(3, 3, pos);

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
plot_styled(n, xn, "Signal x(n)", 1);
plot_styled(n, xa, "(a) x(n-2)", 2);
plot_styled(n, xb, "(b) x(4-n)", 3);
plot_styled(n, xc, "(c) x(n+2)", 4);
plot_styled(n, xd, "(d) x(n)u(2-n)", 5);
plot_styled(n, xe, "(e) x(n-1)delta(n-3)", 6);
plot_styled(n, xf, "(f) x(n^2)", 7);
plot_styled(n, xg, "(g) Even part", 8);
plot_styled(n, x, "(h) Odd hpart", 9);
