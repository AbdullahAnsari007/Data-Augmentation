% Read the image
image = imread('D:\GITHUB\DataAugmentation\Loin.jpg');

% Convert to grayscale if the image is RGB
if size(image, 3) == 3
    image_gray = rgb2gray(image);
else
    image_gray = image;
end

% Define the output directory
output_dir = 'D:\GITHUB\DataAugmentation\augmented_images';

% Create the directory if it doesn't exist
if ~exist(output_dir, 'dir')
    mkdir(output_dir);
end

% Number of times to run the loop
num_iterations = 200; % Set the number of iterations here

% Perform augmentation and save the image
for i = 1:num_iterations
    % Calculate the scaling factor
    k = 0.0001 * i; % Scale factor increases with each iteration
    
    % Resize the image using the calculated scaling factor
    augmented_image = imresize(image_gray, 1 - k);
    
    % Define the output file path
    output_file = fullfile(output_dir, ['augmented_image_' num2str(i) '.jpg']);
    
    % Save the augmented image
    imwrite(augmented_image, output_file);
end

% Display the last resized image
imshow(augmented_image)
title('Resized Image')
%%
for i = 1:10
    % Read the saved image
    img = imread(fullfile(output_dir, ['augmented_image_' num2str(i) '.jpg']));
    
    % Display the image in a subplot
    subplot(2, 5, i);
    imshow(img);
    title(['Image ' num2str(i)]);
end

sgtitle('Augmented Images');
