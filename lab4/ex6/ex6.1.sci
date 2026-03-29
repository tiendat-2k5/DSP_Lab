function y = fold_shift(x, h)
    nx = length(x);
    nh = length(h);
    ny = nx + nh - 1;
    y = zeros(1, ny);
    
    h_rev = h($:-1:1);
    x_pad = [zeros(1, nh-1), x, zeros(1, nh-1)];
    for n= 1:ny
        y(n)= sum(x_pad(n:n+nh-1).*h_rev);
    end
endfunction

function y = matrix_convolution(x, h)
    L = length(x);
    M = length(h);
    N = L + M - 1;
    
    // Tạo ma trận tích chập H
    H = zeros(N, L);
    for i = 1:L
        H(i:i+M-1, i) = h';
    end
    
    // Tính y = H * x
    y = H * x';
    y = y'; // Chuyển về dạng hàng
endfunction

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

x = [1, 2, -3, 2, 1];
h = [1, 0, -1];

// Tính toán
y_final = fold_shift(x, h);

// Tính năng lượng (Energy)
Ex = sum(x.^2);
Eh = sum(h.^2);
Ey = sum(y_final.^2);

energies = [Ex, Eh, Ey];
energy_labels = ["Ex", "Eh", "Ey"];

clf(); // Xóa hình cũ
f = gcf(); 
f.figure_name = "Convolution and Energy Analysis";

// Vẽ x(n)
plot_styled(0:length(x)-1, x, "Input Signal x(n)", 1, "b");

// Vẽ y(n)
plot_styled(0:length(y_final)-1, y_final, "Output Signal y(n) (Convolution)", 2, "b");

// --- Vẽ Năng lượng (Dùng biểu đồ cột Bar chart) ---
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
