function indices = find_indices(depthImg, exclusivePoints)
% Grab dimensions
[rows, cols] = size(depthImg);

% Find linear indices of exclusivePoints
linearIndices = find(exclusivePoints);
indices = zeros(length(linearIndices), 2);

% Convert linear indices to subscript indices
[indices(:,1), indices(:,2)] = ind2sub([rows, cols], linearIndices);
end
