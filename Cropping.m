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

% Get the size of the image
[height, width] = size(image_gray);

% Perform augmentation and save the image
for i = 1:num_iterations
    % Calculate the cropping rectangle based on the iteration
    x = round(width * 0.1 * mod(i, 10)); % X-coordinate of the top-left corner
    y = round(height * 0.1 * mod(i, 10)); % Y-coordinate of the top-left corner
    crop_width = round(width * (1 - 0.0005 * i)); % Width of the cropped area
    crop_height = round(height * (1 - 0.0005 * i)); % Height of the cropped area
    
    % Ensure the rectangle is within the image bounds
    crop_width = min(crop_width, width - x);
    crop_height = min(crop_height, height - y);
    
    % Crop the image using the calculated rectangle
    augmented_image = imcrop(image_gray, [x, y, crop_width, crop_height]);
    
    % Define the output file path
    output_file = fullfile(output_dir, ['augmented_image_' num2str(i) '.jpg']);
    
    % Save the augmented image
    imwrite(augmented_image, output_file);
end

% Display the first 10 cropped images in a 2x5 grid
figure;
for i = 1:10
    % Read the saved image
    img = imread(fullfile(output_dir, ['augmented_image_' num2str(i) '.jpg']));
    
    % Display the image in a subplot
    subplot(2, 5, i);
    imshow(img);
    title(['Image ' num2str(i)]);
end

sgtitle('Cropped Images');
