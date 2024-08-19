function block = get_block(depthImg, rgbImgNative, depthIndex) 
% assume depth index is subscripts
% get dimensions
[rowsColor, colsColor, ~] = size(rgbImgNative);
[rowsDepth, colsDepth] = size(depthImg);

% find scale factor
rowScale = rowsColor / rowsDepth;
colScale = colsColor / colsDepth;

% Get indices to extract block
startRow = rowScale * (depthIndex(1) - 1) + 1;
startCol = colScale * (depthIndex(2) - 1) + 1;

% extract block
block = rgbImgNative(startRow:(startRow + rowScale-1), startCol:(startCol + colScale-1), :);
end