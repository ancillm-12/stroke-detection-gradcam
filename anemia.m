clc;
clear;
close all;

% Step 1: Load Image
[file, path] = uigetfile({'*.jpg;*.png;*.bmp'}, 'Select Nail Image');
img = imread(fullfile(path, file));

% Step 2: Resize
img_resized = imresize(img, [256 256]);

% Step 3: Convert to Grayscale
gray = rgb2gray(img_resized);

% Step 4: Enhance Contrast
enhanced = imadjust(gray);

% Step 5: Extract Red Channel
R = img_resized(:,:,1);
meanR = mean(R(:));

% Step 6: Decision
if meanR < 120
    result = 'Possible Anemia';
else
    result = 'Normal';
end

% ================= DISPLAY =================
figure;

% 1. Original Image
subplot(2,2,1);
imshow(img);
title('Step 1: Original Image');

% 2. Grayscale
subplot(2,2,2);
imshow(gray);
title('Step 2: Converted to Grayscale');

% 3. Enhanced Image
subplot(2,2,3);
imshow(enhanced);
title('Step 3: Contrast Enhanced');

% 4. Final Output
subplot(2,2,4);
imshow(img_resized);
title(['Step 4: Result → ', result]);

% ================= TEXT OUTPUT =================
disp('--- PROCESS EXPLANATION ---');
disp('Step 1: Original nail image loaded');
disp('Step 2: Converted to grayscale for analysis');
disp('Step 3: Enhanced image to highlight features');
disp(['Step 4: Red channel analyzed → Mean R value = ', num2str(meanR)]);
disp(['Final Diagnosis: ', result]);