function reward = calculateReward(nextPosition, xVal)
deltaX = abs(nextPosition(1) - xVal);
K = 50;
a = 1.15;
reward = (-1)*K*a^deltaX;
end
