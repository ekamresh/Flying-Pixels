function pointCloud = get_point_cloud(depthImg, rgbImg)
% Generate point cloud from data
[intrinsics, scaleFactor] = get_camera_intrinsics(depthImg);
pointCloud = pcfromdepth(depthImg, scaleFactor, intrinsics, 'ColorImage', rgbImg);
end