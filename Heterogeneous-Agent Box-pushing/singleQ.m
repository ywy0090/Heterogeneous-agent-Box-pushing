function [q1 , q2] = singleQ(episodes)
alpha = 0.05;
gamma = 0.99;
%num_states 20*20+20+1
%In x and y directions, each of them has 20 discrete states 
xmax = 20;
ymax = 20;
num_states = xmax*ymax+xmax+1;
numAngle = 9;
numForce = 4;
%action 1-right 2-left 3-up 4-down
%actions = [1,2,3,4];
q1 = zeros(num_states, numAngle+1, numForce);
q2 = zeros(num_states, numAngle+1, numForce);
initPos = [10,2];
dest = [10,17];
force1 = 1;
force2 = 1;
angle1 = 1;
angle2 = 1;
optimalStep = 50;
%plot
plotAngle = zeros(5000,2);
plotForce = zeros(5000,2);
plotBox = zeros([5000,2]);
%init
steps=1;
 plotBox(steps,:) = initPos;
 plotAngle(steps,:) =[angle1,angle2];
 plotForce(steps,:) =[force1,force2];
for i=1:1:episodes
    [ nextPosition, stateId, absorb] = ...
combinePush(force1, force2, angle1, angle2, initPos, numForce, numAngle, dest);
    [angle1, force1, maxq1]=selectBestAction(q1, stateId, numAngle, numForce);
    [angle2, force2, maxq2]=selectBestAction(q2, stateId, numAngle, numForce);
    steps = 2;
     plotBox(steps,:) = nextPosition;
     plotAngle(steps,:) =[angle1,angle2];
     plotForce(steps,:) =[force1,force2];
    while(~absorb)
     [ nextPosition, stateId, absorb] = ...
combinePush(force1, force2, angle1, angle2, nextPosition, numForce, numAngle, dest);
    reward = calculateReward(nextPosition, dest(1));
    
     [angle1n, force1n, maxq1]=selectBestAction(q1, stateId, numAngle, numForce);
    [angle2n, force2n, maxq2]=selectBestAction(q2, stateId, numAngle, numForce);
    
    subq1 = reshape(q1(stateId,:), numAngle+1, numForce);
    [angle1n, force1n] = randomSelect(subq1, maxq1, angle1n, force1n);
    subq2 = reshape(q2(stateId,:), numAngle+1, numForce);
    [angle2n, force2n] = randomSelect(subq2, maxq2, angle2n, force2n);
    
     q1(stateId, angle1, force1) = ...
         (1 - alpha)*q1(stateId,angle1, force1) ...
         + alpha*(reward + gamma*maxq1);
     q2(stateId, angle2, force2) = ...
         (1 - alpha)*q2(stateId,angle2, force2) ...
         + alpha*(reward + gamma*maxq2);
     
     angle1 = angle1n;
     angle2 = angle2n;
     force1 = force1n;
     force2 = force2n;
     steps = steps + 1;
     
     plotBox(steps,:) = nextPosition;
     plotAngle(steps,:) =[angle1,angle2];
     plotForce(steps,:) =[force1,force2];
%      if(steps>1000)
%         disp('Can not reach!');
%         break;
%      end
     if(nextPosition(2)>dest(2))
         
         disp('Failure! Can not reach!');
         break;
     end
        
    end
    if(absorb)
        disp('Successful!');
        disp(steps);
         if(steps < optimalStep)
            clf;
            for i=1:1:(steps-1)
                plotSingleStep(plotBox(i,:),plotAngle(i,1),plotAngle(i,2), plotForce(i,1), plotForce(i,2),numAngle)
            %plotSingleStep(plotBox(i,:));
            end
             plotSingleStep(plotBox(steps,:),plotAngle(steps,1),plotAngle(i,2), 0, 0,numAngle);
             hold on;
             line([initPos(1),dest(1)], [initPos(2),dest(2)]);
        optimalStep = steps;    
        %save(singlePlotFile, 'plotBox', 'optimalStep');
       
        end
    end
end
end