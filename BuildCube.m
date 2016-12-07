function[ Cube ] = BuildCube(Length)
%BuildCube
% This function builds the cube in object coordinates to be viewed by the
% camera in world coordinates

L = Length;

Cube = zeros(4,24);

Cube(4,:) = ones(1,24);

p1 = [0;0;0];
p2 = [0;0;L];
p3 = [0;L;0];
p4 = [0;L;L]; 
p5 = [L;0;0];
p6 = [L;0;L];
p7 = [L;L;0];
p8 = [L;L;L];

Cube(1:3,:) = [p1 p2 p2 p4 p4 p3 p3 p1 p1 p5 p5 p6 p6 p2 p5 p7 p7 p8 p8 p4 p8 p6 p7 p3];

figure(1)
clf

s = size(Cube);
hold on
% display each point pair
for j = 1:2:s(2)
    plot3([Cube(1,j) Cube(1,j+1)], [Cube(2,j) Cube(2,j+1)], [Cube(3,j) Cube(3,j+1)]);
    view(3)
end

end


