function [ T_cw ] = PositionCamera(T_ow)
% PositionCamera
% Generate a 'random' camera frame that has a good cahnce of the 
% object being visible in the camera when the object is a 1m cube

% Input T_ow is the 4x4 object frame in world coordinates
% T_cw is the 4x4 camera frame in world coordinates

% Assign space fore the camera frame
T_cw = zeros(4);
% Is this assigning space in MATLAB's memory?

% Set the homogeneous multiplier to 1
T_cw(4,4) = 1;

% extract the object origin
ObjectOrigin = T_ow(1:3,4);

% View the camera from about 10m or so (unrelated to the object
% frame)
InitialViewVector = 10000*rand(3,1);

%Define the origin of the camera frame in world coordinates
T_cw(1:3,4) = ObjectOrigin - InitialViewVector;

% Define the camera z-axis as pointing at the object origin
Normz = norm(InitialViewVector);
if Normz < eps
    error('Unable to normalize the camera z-axis');
end
% Define a unit vector
InitialCameraz = InitialViewVector / Normz;

% Perturb the initial z axis a bit
CameraZ = InitialCameraz - 0.01*rand(3,1);

% ... and normalize again (no need to check norm)
CameraZ = CameraZ / norm(CameraZ);
% Check these last few steps?

% Define a random camera x-axis;
CameraX = rand(3,1);
% Project out the z-axis
CameraX = CameraX - (CameraZ'*CameraX)*CameraZ;
% normalize the x-axis
NormX = norm(CameraX);
if NormX < eps
    error('Unable to normalize the camera x-axis')
end
CameraX = CameraX/NormX;

% Define the y-axis
CameraY = cross(CameraZ,CameraX);

% Complete the transformation matrix
T_cw(1:3,1:3) = [CameraX CameraY CameraZ];

end


