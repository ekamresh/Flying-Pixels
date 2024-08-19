function [flyingPixels, count] = threshold_outliers(sadMatrix, threshold)
% get percentage threshold
[r, c] = size(sadMatrix);
k = ceil(threshold * (r*c));

% get outliers
[outliers, outlierIndices] = maxk(sadMatrix(:), k);
flyingPixels = false(size(sadMatrix));
flyingPixels(outlierIndices) = true;
count = size(outliers, 1);
end