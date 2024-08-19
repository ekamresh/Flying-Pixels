addpath('pointclouds')
addpath('fov')
addpath('util')

depthImg = imread("C:\Users\ekamr\Desktop\FlyingPixelsData\downsampled_data\oyla_datasets\Chair\zmap_png\oyla_0007.png");
rgbImg = imread("C:\Users\ekamr\Desktop\FlyingPixelsData\downsampled_data\oyla_datasets\Chair\rgb_jpg\oyla_0007.jpg");

[r, c] = size(depthImg);
linearIndex = 51663;
[i, j] = ind2sub([r, c], linearIndex);

ws = 2;
% i = 100;
% j = 100;

rowMin = max(1, i - ws);
rowMax = min(r, i + ws);
colMin = max(1, j - ws);
colMax = min(c, j + ws);

% window = depthImg(i-2:i+2,j-2:j+2);

rowIndices = rowMin:rowMax;
colIndices = colMin:1:colMax;

rows = repmat(rowIndices, 5, 1);

cols = repmat(colIndices', 1, 5);

DDindices = [rows(:), cols(:)];

cloud = get_point_cloud(depthImg, rgbImg);
points = reshape(cloud.Location, [r*c, 3]);

% linearIndex = sub2ind([r, c], 100, 100);

flyingPixel = points(linearIndex, :);

[fovX, fovY] = get_pixel_fov(depthImg, 2);

[principalLine, lineLeft, lineRight, lineUp, lineDown] = get_line_equations(flyingPixel, fovX, fovY);
enclosedPoints = check_enclosed_points(points, lineLeft, lineRight, lineUp, lineDown);


DDDindices= find_point_indices(depthImg, enclosedPoints);

