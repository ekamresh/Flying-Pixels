function [sadMatrix] = calculate_sad_matrix(depthImg, windowSize)
% Get dimensions
[rows, cols] = size(depthImg);

% Calculate the sum of absolute differences
sadMatrix = size(depthImg);
pad = floor(windowSize / 2);
for i=1:rows
    for j=1:cols
        rowMin = max(1, i - pad);
        rowMax = min(rows, i + pad);
        colMin = max(1, j - pad);
        colMax = min(cols, j + pad);
        window = depthImg(rowMin:rowMax, colMin:colMax);
        sadValue = sum(abs(window - depthImg(i,j)), 'all');
        sadMatrix(i, j) = sadValue;
    end
        
end

end