function testSimulation()
% boxPos = [2 2];
% dest = [15,15];
% numForce = 4;
% numAngle = 6;
% %max force = numForce
% %max angle = numAngle + 1
% force1 = 1;
% force2 = 2;
% angle1 = 3;
% angle2 = 4;
% plotSingleStep(boxPos);
%  [ nextPosition, stateId, absorb] = ...
% combinePush(force1, force2, angle1, angle2, boxPos, numForce, numAngle, dest)
% for i=1:200
%      plotSingleStep(nextPosition);
%      [ nextPosition, stateId, absorb] = ...
%     combinePush(force1, force2, angle1, angle2, nextPosition, numForce, numAngle, dest);
% end
[q1,q2]=singleQ(5000)
end