function [ KMatrix ] = SingleVectorCameraModel ( Parameters )
%SingleVectorCameraModel
% Builds a camera model using a single vecotr of Parameters
% and returns the resulting K-Matrix in KMatrix

% There must be 8 parameters passed ordered as
% (1) ChipWidth - An integer describing the number of horizontal planes
% (2) ChipHeight - An integer describing the number of vertical pixels
% (3) FocalLength - The camera focal length (between 1.0 and 100.0m)
% (4) PixelWidth - The pixel width (between 0.001 and 0.1mm)
% (5) PixelHeight - The pixel height (between 0.001 and 0.1mm)
% (6) Skewness - The skewness in u-pixels (between -.01 and 0.1)
% (7) P_u - The offset to the principal point as a fraction of the width
% (8) P_v - The offset to the principal point as a fraction of the height

% Are there 8 parameters
if length(Parameters) ~= 8
    error('There must be 8 parameters passed')
end

% We can CHOOSE to create internal variables for OUR convenience
% we could just use Parameter(i) all the way through
ChipWidth = Parameters(1);
ChipHeight = Parameters(2);
FocalLength = Parameters(3);
PixelWidth = Parameters(4);
PixelHeight = Parameters(5);
Skewness = Parameters(6);
P_u = Parameters(7);
P_v = Parameters(8);

% Test in the the inputs satisfy the design constraints
Frac = ChipWidth - fix(ChipWidth);
if Frac ~= 0
    error('ChipWidth is not integer')
end
Frac = ChipHeight - fix(ChipHeight);
if Frac ~= 0
    error('ChipHeight is not integer')
end

% Test the ranges with a lest cryptic tester
TestRange(ChipWidth,200,4000,'ChipWidth');
TestRange(ChipHeight,200,4000,'ChipWidth');
TestRange(FocalLength,1.0,100.0,'FocalLength');
TestRange(PixelWidth,0.0001,0.1,'PixelWidth');
TestRange(PixelHeight,0.0001,0.1,'PixelHeight');
TestRange(Skewness,-0.1,0.1,'Skewness');
TestRange(P_u,0.25,0.75,'P_u');
TestRange(P_v,0.25,0.75,'P_v');

% The focal length in u-pixels
FuPixels = FocalLength / PixelWidth;

% The FocalLength in v-pixels
FvPixels = FocalLength /PixelHeight;

% Construct the K-Matrix for return
KMatrix = ...
[FuPixels Skewness P_u*ChipWidth;...
     0      FvPixels P_v*ChipHeight;...
     0          0         1 ];
end





