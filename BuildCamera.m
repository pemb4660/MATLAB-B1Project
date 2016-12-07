function [ KMatrix,CameraHeight,CameraWidth ] = BuildCamera()
%BuildCamera
%
%

Range = []

Parameters = zeros(length(Range));

for i = 1:length(Range)
    Parameters(i) = 0.5*(Range(i,1) + Range(i,2));
end

%Create K Matrix from our random set of parameters
KMatrix = SingleVectorCameraModel(Parameters);

% Create a Camera Width from our random parameters. Camera Width = width
% of a pixel * number of pixels
CameraWidth = Parameters(1);

% Create a Camera Width from our random parameters. Camera Height = width
% of a pixel * number of pixels
CameraHeight = Parameters(2);

end
