// 1. Load the image (Requires IPD or SIVP toolbox)
img = imread(fullpath(getIPCVpath() + "/images/lena.png"));
img_gray = rgb2gray(img); // Convert to grayscale for analysis

// 2. Histogram Equalization
// Enhances contrast by redistributing intensity levels
img_eq = imhistequal(img_gray);

// 3. Image Blurring (Spatial Filtering)
// Using a 5x5 averaging mask to create a blur effect
mask = ones(5, 5) / 25; 
img_blur = imfilter(img_gray, mask);

// 4. Visualization
clf();
subplot(2,2,1);
imshow(img_gray);
xtitle("Original Grayscale");

subplot(2,2,2);
imshow(img_eq);
xtitle("Histogram Equalization");

subplot(2,2,3);
// Plotting the histogram of the original image
[counts, bins] = imhist(img_gray);
plot(bins, counts);
xtitle("Original Histogram");

subplot(2,2,4);
imshow(img_blur);
xtitle("Simple Blur (5x5 Average)");
