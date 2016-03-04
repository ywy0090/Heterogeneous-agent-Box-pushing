function [xForce, yForce]= ...
combineForce(force1, force2, angle1, angle2, numForce, numAngle)
%angle takes 1 to ..
%force takes 1 to ..
totalForce = 2;
unitAngle = pi/numAngle;
unitForce = totalForce/numForce;
sumAngle1 = unitAngle*(angle1-1);
sumAngle2 = unitAngle*(angle2-1);
sumForce1 = force1 * unitForce;
sumForce2 = force2 * unitForce;
yForce1 = sin(sumAngle1)*sumForce1;
xForce1 = cos(sumAngle1)*sumForce1;
yForce2 = sin(sumAngle2)*sumForce2;
xForce2 = cos(sumAngle2)*sumForce2;
xForce = xForce1 + xForce2;
yForce = yForce1 + yForce2;
end