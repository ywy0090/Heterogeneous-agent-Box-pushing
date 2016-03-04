function [angle, force] = ...
randomSelect(sub_q, maxq, angleNow, forceNow)
angle = angleNow;
force = forceNow;
indexArray = find(sub_q == maxq);
arraySize = size(indexArray, 1); 
if(arraySize > 1)
    index = ceil(arraySize * rand);
    [angle, force] = ind2sub(size(sub_q), indexArray(index));
end

end