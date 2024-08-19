function [principalLine, lineLeft, lineRight, lineUp, lineDown] = get_line_equations(flyingPixel, pixelFovX, pixelFovY)
% Assume the camera is at the origin and flyingPixel is nx3
principalLine = flyingPixel;

thetaX = pixelFovX / 2;
thetaY = pixelFovY / 2;

% magnitude of principal line
magnitude = norm(flyingPixel);

% return shifts in each direction 
deltaX = [magnitude * tan(thetaX), 0, 0];
deltaY = [0, magnitude * tan(thetaY), 0];

lineLeft = flyingPixel - deltaX;
lineRight = flyingPixel + deltaX;
lineUp = flyingPixel + deltaY;
lineDown = flyingPixel - deltaY;
end