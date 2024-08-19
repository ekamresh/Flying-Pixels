function newDepth = optimize_depth_value(enclosedPoints, rgbBlocks, fpBlock, fpCoord)
% get unit vector in direction of line
principalVector = fpCoord / norm(fpCoord);

DE = zeros(size(enclosedPoints, 1), 1);

% get differences
for i=1:size(enclosedPoints, 1)
    block = rgbBlocks(i).data;
    % DE(i) = mean(sum((block - fpBlock).^2, 2),1);
    DE(i) = mean(sqrt(sum((block - fpBlock).^2, 2)), 1);
end

% get dim
% rows = size(meanRgbBlocks, 1);

% find difference between
% meanFpBlock = repmat(meanFpBlock, rows, 1);

% get  sqaured L2 norm - check this line
% DE = sum((meanFpBlock - meanRgbBlocks).^2, 2);
DE = DE.^2;
DE = DE / max(DE, [], 'all');

variance = 0.1;

% weight
score = exp(-DE / (2 * (variance)^2));

% cost function
t = -sum(score .* ((fpCoord - enclosedPoints) * principalVector')) / sum(score, "all");

% new coordinate of flying pixel
newDepth = fpCoord + principalVector*t;
end