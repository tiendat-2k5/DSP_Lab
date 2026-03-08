n=-5:5;
ur=n.*bool2s(n>=0);
clf();
plot2d3(n,ur);
title("Unit Ramp Signal ur(n)");
xlabel("Sample index(n)");
ylabel("Amplitude");
