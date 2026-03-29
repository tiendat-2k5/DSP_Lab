// --- Investigation of Audio I/O ---
// Locate the default demo chime file provided by the Scilab Sound Module
filePath = SCI + "/modules/sound/demos/chimes.wav";
[y, fs] = wavread(filePath);

// --- Processing with Signal Library ---
y_mono = y(1, :); // Select first channel
N = length(y_mono);
Y_fft = abs(fft(y_mono)); // Frequency magnitude
f = (0:N/2-1) * (fs/N);   // Mapping indices to Hz

// --- Visualization ---
clf();
subplot(2,1,1);
plot(y_mono);
xtitle("Time Domain Analysis (via Sound Module)", "Samples", "Amplitude");

subplot(2,1,2);
plot(f, Y_fft(1:N/2));
xtitle("Frequency Domain Analysis (via Signal Toolbox)", "Frequency (Hz)", "Amplitude");
