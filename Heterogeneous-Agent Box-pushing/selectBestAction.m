function [angle, force, maxq]=selectBestAction(qTable, stateId, numAngle, numForce)
    [maxq, index] = max(qTable(stateId,:));
    sub_q = reshape(qTable(stateId,:), numAngle+1, numForce);
     [angle, force] = ind2sub(size(sub_q),index);
end