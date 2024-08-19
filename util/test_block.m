point = [0;0;0;0;1;1;0;0;1];
point = logical(point);

points = [2, 3, 4; ...
    4, 5, 6;
    3, 6, 7;
    3, 4, 5;
    4, 5, 5;
    4, 5, 6;
    4, 45, 6;
    4, 6, 7;
    4, 5, 9];

enclosedPoints = points(point, 3);

depthImg = reshape(points(:,3), [3 3]);

indices = find_point_indices(depthImg, point);

enclosedPointsFromDepth = depthImg(indices);