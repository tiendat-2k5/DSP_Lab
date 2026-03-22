xn = [0, 1, 2, -2];
hn = [3, 2, 1];
xorigin = 1;
horigin = 2;

function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    yn = convol(xn, hn);
    yn = round(yn);
    yorigin = xorigin + horigin - 1;
endfunction

[yn, yorigin] = convolution (xn, xorigin, hn, horigin);
nx = (1:length(xn)) - xorigin;
nh = (1:length(hn)) - horigin;
ny = (1:length(yn)) - yorigin;

function plot_styled(n_idx, val, title_str, pos, color_style)
    subplot(3, 1, pos);

    plot2d3(n_idx, val, style=2); 
    plot(n_idx, val, color_style, 'markerSize', 7, 'markerFaceColor', 'blue'); 

    ymin = min(val); ymax = max(val);
    margin = max(1.5, (ymax - ymin) * 0.4);
    gca().data_bounds = [min(n_idx)-0.5, ymin - margin; max(n_idx)+0.2, ymax + margin];

    for i = 1:length(n_idx)
        // CĂN CHỈNH NHÃN: 
        // Nếu số dương thì đẩy lên (+), số âm thì đẩy xuống (-)
        if val(i) >= 0 then
            offset = margin * 0.15; 
        else
            offset = -margin * 0.35; // Đẩy xuống xa hơn để tránh đè lên marker
        end
        xstring(n_idx(i) - 0.1, val(i) + offset, string(val(i)));
    end

    title(title_str, "fontsize", 3);
    xlabel("n"); ylabel("Amplitude");
    xgrid(12);
endfunction

clf();
plot_styled(nx, xn, "Signal x[n]", 1, 'bo');
plot_styled(nh, hn, "System response h[n]", 2, 'bo');
plot_styled(ny, yn, "Result y[n] = x[n] * h[n]", 3, 'bo');
