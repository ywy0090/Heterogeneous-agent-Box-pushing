function [ nextPosition, stateId, absorb]= ...
singleStep( boxPosition, xforce, yforce, dest)
%boundary
xmax = 20;
xmin = 0;
ymax = 20;
ymin = 0;
boxPosition(1) = boxPosition(1) + xforce;
boxPosition(2) = boxPosition(2) + yforce;

boxPosition(1)=min(xmax,boxPosition(1));
boxPosition(2)=min(ymax,boxPosition(2));
boxPosition(1)=max(xmin, boxPosition(1));
boxPosition(2)=max(ymin,boxPosition(2));

if(round(boxPosition(1))== dest(1) && round(boxPosition(2))==dest(2))
    absorb =1;
else 
    absorb =0;
end
nextPosition = boxPosition;

stateId = round(boxPosition(2))*(ymax)+ round(boxPosition(1))+1;
end