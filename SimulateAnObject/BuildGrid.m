function [ CalibrationGrid ] = BuildGrid(GridIncrement,GridWidth)
%BuildGrid
% BuildGrid constructs a square grid of side length 
% given by GridWidth. Inside the grid are smaller squares of size
% GridIncrement.

% We need to ensure that GridWidth > GridIncrement and that GridIncrement
% is a factor of GridWidth

if GridIncrement > GridWidth
    error('The increments are not of a valid size')
end

n = GridWidth / GridIncrement;

if n - fix(n) ~= 0
    GridWidth = GridWidth - ((n - fix(n)) * GridIncrement);
    n = fix(n);
end

l = (n+1) * (n+1);

CalibrationGrid = zeros(4,l);

CalibrationGrid(4,:) = ones(1,l);

i = 1;
for y = 0:n
    for x = 0:n
        CalibrationGrid(1:2,i) = [x;y];
        i = i + 1;
    end
end

scatter(CalibrationGrid(1,:),CalibrationGrid(2,:),0.1)
