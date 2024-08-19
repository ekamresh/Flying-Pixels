function [pixelFovX, pixelFovY] = get_pixel_fov(depthImg, scale)
% intrinsics given by camera
fovAngleY=33;
fovAngleX=44;
[y, x] = size(depthImg);
pixelFovX = (fovAngleX) / x;
pixelFovY = (fovAngleY) / y;
pixelFovX = scale * deg2rad(pixelFovX);
pixelFovY = scale * deg2rad(pixelFovY);
end