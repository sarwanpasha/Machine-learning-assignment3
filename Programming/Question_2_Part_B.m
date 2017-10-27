%%%%%%%%%%%%%%%%%%%%% Mean Calculation Logic Starts from Here %%%%%%%%%%%%%%%%%%%

%d = load('Q2even.mat');  %For Even Dataset 
d = load('Q2odd.mat');  %For Odd Dataset 
%disp(d);
%temp = size(d.y,1); %For Even Dataset 
temp = size(d.y2,1); %For Odd Dataset 
Total_Sum = 0;

for i = 1:temp
   % Total_Sum = Total_Sum + d.y(i,1);  %For Even Dataset 
    Total_Sum = Total_Sum + d.y2(i,1);  %For Odd Dataset 
end

Temp_Mean = Total_Sum / temp;
fprintf('MEAN is = %i\n', Temp_Mean);
fprintf('\n');

%%%%%%%%%%%%%%%%%%%%% Mean Calculation Logic Ends Here %%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%% Variance Calculation Logic Starts from Here %%%%%%%%%%%%%%%%
sum_of_Values = 0;
for i = 1:temp
    %value_Temp = d.y(i,1) - Temp_Mean;  %For Even Dataset 
    value_Temp = d.y2(i,1) - Temp_Mean;  %For Odd Dataset 
    valueSquare = value_Temp * value_Temp;
    sum_of_Values = sum_of_Values + valueSquare;
end

variance = sum_of_Values / temp;
fprintf('Variance is = %i\n', variance);

%%%%%%%%%%%%%%%%%%%% Variance Calculation Logic Ends Here %%%%%%%%%%%%%%%%

