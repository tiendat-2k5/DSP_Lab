// 1. Function: Folding and Shifting (Circular)
function y = circular_fold_shift(x, h)
    N = length(x);
    y = zeros(1, N);
    for n = 0:N-1
        sum_val = 0;
        for k = 0:N-1
            idx = pmodulo(n - k, N) + 1;
            sum_val = sum_val + h(k+1) * x(idx);
        end
        y(n+1) = sum_val;
    end
endfunction

// 2. Function: Matrix Method (Circulant Matrix)
function y = circular_matrix_method(x, h)
    N = length(x);
    X_mat = zeros(N, N);
    for i = 1:N
        for j = 1:N
            X_mat(i, j) = x(modulo(i - j, N) + 1);
        end
    end
    y = (X_mat * h')';
endfunction

// 3. Visualization Function
function plot_styled(n_idx, val, title_str, pos, color_style)
    subplot(3, 1, pos);

    plot2d3(n_idx, val, style=2); 
    plot(n_idx, val, color_style + 'o', 'markerSize', 7, 'markerFaceColor', 'blue'); 

    ymin = min(val); ymax = max(val);
    margin = max(1.5, (ymax - ymin) * 0.6);
    gca().data_bounds = [min(n_idx)-0.5, ymin - margin; max(n_idx)+0.3, ymax + margin];

    for i = 1:length(n_idx)
        if val(i) >= 0 then
            offset = margin * 0.15; 
        else
            offset = -margin * 0.6;
        end
        xstring(n_idx(i) - 0.05, val(i) + offset, string(val(i)));
    end

    title(title_str, "fontsize", 3);
    xlabel("n"); ylabel("Amplitude");
    xgrid(12);
endfunction

// --- MAIN EXECUTION ---
x = [1, 2, -3, 2, 1];
h = [1, 0, -1, -1, 1];
n = 0:length(x)-1;

y_final = circular_fold_shift(x, h);
// Tính năng lượng (Energy)
Ex = sum(x.^2);
Eh = sum(h.^2);
Ey = sum(y_final.^2);

energies = [Ex, Eh, Ey]; 
energy_labels = ["Ex", "Eh", "Ey"];
clf();
f = gcf(); 
f.figure_name = "Convolution and Energy Analysis";

plot_styled(0:length(x)-1, x, "Input Signal x(n)", 1, "b");


plot_styled(0:length(y_final)-1, y_final, "Output Signal y(n) (circular convolution)", 2, "b");

subplot(3, 1, 3);
bar(energies, 0.5, "blue");

ax = gca();
ax.x_ticks = tlist(["ticks", "locations", "labels"], [1, 2, 3], energy_labels);

max_e = max(energies);
margin_e = max_e * 0.4;
ax.data_bounds = [0.5, 0; 3.5, max_e + margin_e];

for i = 1:length(energies)
    val_str = msprintf("%.2f", energies(i));
    xstring(i - 0.05, energies(i) + (margin_e * 0.1), val_str);
end

title("Energy Comparison", "fontsize", 3);
ylabel("Energy Value");
xgrid(12);
