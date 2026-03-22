n = -10:10;
function val = get_x(n_point)
    if n_point >= -3 & n_point <= -1 then
        val = 1 + n_point/3;
    elseif n_point >= 0 & n_point <= 3 then
        val =1;
    else 
        val = 0;
    end
endfunction

function str = format_label(v)
    if abs(v - 1/3) < 0.01 then str = "1/3";
    elseif abs(v - 2/3) < 0.01 then str = "2/3";
    elseif v == 0 then str = "0";
    else str = string(v);
    end
endfunction

x_a =[];
x_b1 =[];
x_b2 =[];
x_c =[];

for i = 1:length(n)
    ni = n(i);
    x_a(i) = get_x(ni);
    x_b1(i) = get_x(-(ni - 4));
    x_b2(i) = get_x(-ni - 4);
    x_c(i) = get_x(-ni + 4);
end

function plot_styled(n_idx, val, title_str, pos, color_style)
    subplot(4, 1, pos);

    plot2d3(n_idx, val, style=2); 
    plot(n_idx, val, color_style, 'markerSize', 7, 'markerFaceColor', 'blue'); 

    ymin = min(val); ymax = max(val);
    margin = max(1.5, (ymax - ymin) * 0.4);
    gca().data_bounds = [min(n_idx)-0.5, ymin - margin; max(n_idx)+0.2, ymax + margin];

    for i = 1:length(n_idx)
        if val(i) >= 0 then
            offset = margin * 0.15; 
        else
            offset = -margin * 0.35;
        end
        xstring(n_idx(i) - 0.1, val(i) + offset, format_label(val(i)));
    end

    title(title_str, "fontsize", 3);
    xlabel("n"); ylabel("Amplitude");
    xgrid(12);
endfunction

plot_styled(n, x_a, "a) Signal x(n)", 1, 'bo');
plot_styled(n, x_b1, "b1 Fold then delay 4: x(-(n-4))", 2, 'bo');
plot_styled(n, x_b2, "b2 Delay 4 then Fold: x(-n-4)", 3, 'bo');
plot_styled(n, x_c, "b) Signal x(-n + 4)", 4, 'bo');
