n=-5:10;

function val = get_x(t)
    if (t >= 0 & t <= 3) then val = 1;
    else val = 0;
    end
endfunction

x=[];
y=[];
y_prime=[];
x2=[];
y2=[];

for i=1:length(n)
    ni=n(i);
    x(i)=get_x(ni);
    y(i)=get_x(ni) - get_x(ni - 1);
    x2(i)=get_x(ni-2);
    y2(i)=get_x(ni-2) - get_x(ni - 2 - 1);
    y_prime(i) = get_x(ni - 2) - get_x(ni - 2 -1);
end

function plot_styled(n_idx, val, title_str, pos)
    subplot(3, 2, pos);

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
plot_styled(n, x, "1. Signal x(n)", 1);
plot_styled(n, y, "2. y(n) = x(n) - x(x - 1)", 2);
plot_styled(n, y_prime, "3. y_prime(n) = y(n - 2)", 3);
plot_styled(n, x2, "4. x2(n) = x(n - 2)", 4);
plot_styled(n, y2, "5. y2(n) = T[x2(n)]", 5);
