// 1. Khai báo biến đa thức z
z = poly(0, 'z');

// 2. Định nghĩa tử số và mẫu số (đã quy đồng từ bài 1)
// X(z) = (2z^4 - z^3 + 2z^2 - 3z + 4) / z^2
num = 2*z^4 - z^3 + 2*z^2 - 3*z + 4;
den = z^2;

// 3. Tạo hệ thống rời rạc
Xz = syslin('d', num, den);

printf("Biến đổi Z của tín hiệu x(n) là:\n");
disp(Xz);

// 4. Tìm các điểm cực (Poles) - Đây là cơ sở để xác định ROC
poles_val = roots(den);
printf("Các điểm cực (Poles) tìm được là:\n");
disp(poles_val);

// 5. Logic xác định ROC (Trình bày trong comment hoặc in ra)
// - Nếu poles nằm tại 0: ROC loại bỏ điểm z = 0
// - Nếu bậc tử > bậc mẫu (có cực tại vô cùng): ROC loại bỏ điểm z = vô cùng
printf("\nKẾT LUẬN ROC:\n");
printf("Vì tín hiệu hữu hạn, có cực tại z=0 và z=vô cùng,\n");
printf("nên ROC là: 0 < |z| < vô cùng\n");

clf();
// Vẽ vòng tròn đơn vị (Unit Circle)
t = linspace(0, 2*%pi, 100);
plot(cos(t), sin(t), "g--"); 

// Vẽ Zeros (o) và Poles (x)
zeros_val = roots(num);
plot(real(zeros_val), imag(zeros_val), "ro"); // Zeros màu đỏ
plot(real(poles_val), imag(poles_val), "bx"); // Poles màu xanh

// Trang trí
xtitle("Phân bố Cực - Zero và Vùng hội tụ ROC", "Real(z)", "Imag(z)");
legend(["Vòng tròn đơn vị (Unit Circle)"; "Zeros (Nghiệm tử)"; "Poles (Nghiệm mẫu)"]);
xgrid();
isoview();
