function [markedOutliers] = mark_outliers(outliers, rgbImg)
% Split channels and mark outliers as red
red = rgbImg(:, :, 1);
green = rgbImg(:, :, 2);
blue = rgbImg(:, :, 3);

red(outliers) = 255;
green(outliers) = 0;
blue(outliers) = 0;

rgbImg(:, :, 1) = red;
rgbImg(:, :, 2) = green;
rgbImg(:, :, 3)= blue;

markedOutliers = uint8(rgbImg);

end