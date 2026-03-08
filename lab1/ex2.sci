f = 50;
A = 3;
T = 1/f;

t = linspace(0, 5*T, 1000);
xa = A*sin(2*%pi*f*t);

subplot(3,1,1);
plot(t, xa, 'r');
xtitle("Analog Signal xa(t)", "Time (s)", "Amplitude");

Fs = 300;
//f/Fs = 1/6 -> N = 6
n = 0:29; 
xn = A*sin(2*%pi*(f/Fs)*n);

subplot(3,1,2);
plot2d3(n, xn);
plot(n, xn, 'bo');
xtitle("Discrete-time Signal x(n) in 5 periods (N=6)", "Samples (n)", "Amplitude");
xgrid();
a = gca();

a.data_bounds = [0, -4; 30, 6];
a.tight_limits = "on";

for i = 1:length(n)
    sca(a);

    if modulo(i, 2) == 1 then
        offset_y = 0.3;
    else
        offset_y = 0.9; 
    end
    
    xstring(n(i) - 0.4, xn(i) + offset_y, msprintf("%.4f", xn(i)));
    
    t_obj = gce(); 
    t_obj.font_size = 1;
    t_obj.font_foreground = 2; 
    t_obj.clip_state = "off"; 
end

delta = 0.1;
xq = floor(xn / delta) * delta; 

subplot(3,1,3);
plot2d3(n, xq);
plot(n, xq, 'bo');
xtitle("Quantized Signal xq(n) (delta=0.1)", "Sample (n)", "Amplitude");
xgrid();

a3 = gca(); 
a3.data_bounds = [0, -4; 30, 6]; 
a3.tight_limits = "on";

for i = 1:length(n)
    sca(a3); 

    if modulo(i, 2) == 1 then
        offset_y = 0.3;
    else
        offset_y = 0.9; 
    end
    
    xstring(n(i) - 0.2, xq(i) + offset_y, msprintf("%.1f", xq(i)));
    
    t_obj = gce(); 
    t_obj.font_size = 1;      
    t_obj.font_foreground = 5;
    t_obj.clip_state = "off";  
end
