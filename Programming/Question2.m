%%%%%%%%%%%%%%%%%%%%%%%%% Meeuu Claculation%%%%%%%%%%%%%%%%%%%%%%%%%%%

Data = load('Q2even.mat');
n = size(Data.y,1);
sumOfGivenData = 0;
sumOfValueMinusMeeuu = 0;

for c = 1:n
    sumOfGivenData = sumOfGivenData + Data.y(c,1);
end

meeuu = sumOfGivenData / n;
fprintf('meeuu = %i\n', meeuu);
fprintf('\n');
fprintf('\n');

%%%%%%%%%%%%%%%%%%%%%%%% Variance Calculation %%%%%%%%%%%%%%%%%%%%%%%%

for c = 1:n
    value = Data.y(c,1) - meeuu;
    valueSquare = value * value;
    sumOfValueMinusMeeuu = sumOfValueMinusMeeuu + valueSquare;
end

variance = sumOfValueMinusMeeuu / n;
fprintf('Variance = %i\n', variance);
    
