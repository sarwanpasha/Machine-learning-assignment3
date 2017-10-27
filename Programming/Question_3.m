%%%%%%%%%%%%%%%%%%%%% Starting Question 3 %%%%%%%%%%%%%%%%%%%

clear
%Load Data
load 'Q3learn.mat'
load 'Q3Test.mat'

temp_1 = size(find(data(:,2)));
First_Data = zeros(temp_1(1,1),2);
temp_2 = size(find(data(:,2)==0));
Second_Data = zeros(temp_2(1,1),2);

a_1 = 1;
k_1 = 1;
[r,c] = size(data);
%Extracting Data
for i=1:r
    if(data(i,2)==1)
       First_Data(a_1,1) = data(i,1);
       First_Data(a_1,2) = 1;
       a_1 = a_1 + 1;
    elseif(data(a_1,2)==0)
       Second_Data(k_1,1) = data(i,1);
       Second_Data(k_1,2) = 0;
       k_1 = k_1 + 1;
    end
    i=i+1;
end

% Computing Mean for Datasets 1
Total_Data_For_First_Dataset = length(First_Data);
Mean_For_First_Dataset = sum(First_Data(:,1))/Total_Data_For_First_Dataset;
fprintf('Mean for First Dataset = %f\n',Mean_For_First_Dataset);

% Computing Mean for Datasets 2
Total_Data_For_Second_Dataset = length(Second_Data);
Mean_For_Second_Dataset = sum(Second_Data(:,1))/Total_Data_For_Second_Dataset;
fprintf('Mean for Second Dataset = %f\n\n',Mean_For_Second_Dataset);

% Computing Variance for Datasets 1
Variance_For_First_Dataset = sum((First_Data(:,1) - Mean_For_First_Dataset).^2)/Total_Data_For_First_Dataset;
fprintf('Variance for First Dataset = %f\n',Variance_For_First_Dataset);

% Computing Variance for Datasets 2
Variance_For_Second_Dataset = sum((Second_Data(:,1) - Mean_For_Second_Dataset).^2)/Total_Data_For_Second_Dataset;
fprintf('Variance for Second Dataset = %f\n\n',Variance_For_Second_Dataset);

% Computing prior probability for Datasets 1
Prior_Probability_1 = temp_1(1,1)./r(1,1); 
fprintf('prior probability of 1 = %f\n',Prior_Probability_1);

% Computing prior probability for Datasets 2
Prior_Probability_2 = temp_2(1,1)./r(1,1); 
fprintf('prior probability of 0 = %f\n\n',Prior_Probability_2);

 
Test_Data_Length = length(test_data);
fprintf('Total Length = %f\n\n',Test_Data_Length);
exponential_numerator_2 = exp(-(((test_data(:,1)-Mean_For_First_Dataset).^2)/(2*Variance_For_First_Dataset)));
 
exponential_numerator_1 = 1/(sqrt(2*3.14*Variance_For_First_Dataset));
Temp1_answer = (exponential_numerator_1 * exponential_numerator_2);
%fprintf('tmp = %f\n',Temp1_answer);
 exp1 = 1/(sqrt(2*3.14*Variance_For_Second_Dataset));
 exp2 = exp(-(((test_data(:,1)-Mean_For_Second_Dataset).^2)/(2*Variance_For_Second_Dataset)));
 Temp2_answer = (exp1 * exp2);

p1 = Temp1_answer*Prior_Probability_1;
%fprintf('Posterior Probability = %f\n',p1);
p2 = Temp2_answer*Prior_Probability_2;        %
  %fprintf('posterior for second data = %f\n',p2);
 predicted_Value = [];
 for i=1:length(test_data)
     
     if(p1(i,1) > p2(i,1))
         predicted_Value(i,1) = 1;
     else
         predicted_Value(i,1) = 0;
     end
     
 end
% Computing SSE Values
SSE = (1/2) * sum((test_data(:,2)-predicted_Value(:,1)).^2);
fprintf('SSE on test set = %f\n',SSE);

 