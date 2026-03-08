n = 0:10;
x_n = [0, 1, 2, 3, 2, 1, 0, -1, -2, -1, 0];

clf(); // Clear current figure
subplot(2, 1, 1); // Top plot
plot2d3(n, x_n);  // Discrete plot (stem)
title("Discrete Signal Visualization");
xlabel("Sample Index (n)");
ylabel("Amplitude");

subplot(2, 1, 2); // Bottom plot
plot(n, x_n, 'ro-'); // Continuous line plot
title("Continuous Representation");
xlabel("Time");
ylabel("Amplitude");
