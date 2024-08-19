function [intrinsics, scaleFactor] = get_camera_intrinsics(depthImg)
% Convert FOV to focal length
[y, x] = size(depthImg);
fovAngleX = 44;
fovAngleY = 33;
fovRadY = fovAngleY*pi/180;
fovRadX = fovAngleX*pi/180;

% X direction
fl_x = x/2*(1/tan(fovRadX/2));
% Y direction
fl_y = y/2*(1/tan(fovRadY/2));

% Create a cameraParameters object - focal length, principal point, size
focalLength = [fl_x, fl_y]; 
principalPoint = [x/2, y/2];
imageSize = [x, y]; 

intrinsics = cameraIntrinsics(focalLength,principalPoint,imageSize);

% Define the scale factor
scaleFactor = 1;
end