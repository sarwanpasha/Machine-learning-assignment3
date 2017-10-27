Data = load('Q1Data.mat');

class1 = Data.D(Data.D(:,6) == 1);
class2 = Data.D(Data.D(:,6) == 2);
class3 = Data.D(Data.D(:,6) == 3);

numberOf1 = size(class1,1);
numberOf2 = size(class2,1);
numberOf3 = size(class3,1);

numberOfModifiedData1 = 0;
numberOfModifiedData2 = 0;
numberOfModifiedData3 = 0;

% fprintf('class 1 %i\n', numberOf1);

% for c = 1: size(Data)
%     if(Data(:,2) == 2 && Data(:,3) == 2 && Data(:,4) == 

ModifiedData = Data.D(Data.D(:,2) == 2 & Data.D(:,3) == 2 & Data.D(:,4) == 2 & Data.D(:,5) == 2);
% display(ModifiedData)
  
% fprintf('Modified Data index 0 %i\n', ModifiedData(1));
for c = 1:size(ModifiedData)
    if(Data.D(ModifiedData(c),6) == 1)
        numberOfModifiedData1 = numberOfModifiedData1 + 1;
    else if(Data.D(ModifiedData(c),6) == 2)
            numberOfModifiedData2 = numberOfModifiedData2 + 1;
        else if(Data.D(ModifiedData(c),6) == 3)
                numberOfModifiedData3 = numberOfModifiedData3 + 1;
            end
        end
    end
end

% fprintf ('Class1 %i\n',numberOfModifiedData1);
% fprintf ('Class2 %i\n',numberOfModifiedData2);
% fprintf ('Class3 %i\n',numberOfModifiedData3);

LikelihoodClass1 = numberOfModifiedData1 / numberOf1;
LikelihoodClass2 = numberOfModifiedData2 / numberOf2;
LikelihoodClass3 = numberOfModifiedData3 / numberOf3;

display('Calculation Results For MLE');
fprintf('MLE of class1 = %f\n',LikelihoodClass1);
fprintf('MLE of class2 = %f\n',LikelihoodClass2);
fprintf('MLE of class3 = %f\n',LikelihoodClass3);

if(LikelihoodClass1 > LikelihoodClass2 && LikelihoodClass1 > LikelihoodClass3)
    display('Class 1 will be predicted');
else if(LikelihoodClass2 > LikelihoodClass3 && LikelihoodClass2 > LikelihoodClass1)
        display('Class 2 will be predicted');
        else if(LikelihoodClass3 > LikelihoodClass2 && LikelihoodClass3 > LikelihoodClass1)
        display('Class 3 will be predicted');
            else
                display('All classes have equal chances');
            end
    end
end
fprintf('\n');
fprintf('\n');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PriorY(1) = 0;
PriorY(2) = 0;
PriorY(3) = 0;

PriorY(1) = ((3/10)*0) + ((1/10)*0) + ((6/10)*1);
PriorY(2) = ((3/10)*0) + ((1/10)*1) + ((6/10)*0);
PriorY(3) = ((3/10)*1) + ((1/10)*0) + ((6/10)*0);

MAPy1 = LikelihoodClass1 * PriorY(1);
MAPy2 = LikelihoodClass2 * PriorY(2);
MAPy3 = LikelihoodClass3 * PriorY(3);

display('Calculation Results For MAP');
fprintf('MAP of class 1 = %f\n', MAPy1);
fprintf('MAP of class 2 = %f\n', MAPy2);
fprintf('MAP of class 3 = %f\n', MAPy3);

if(MAPy1 > MAPy2 && MAPy1 > MAPy3)
    display('Class 1 will be predicted');
else if(MAPy2 > MAPy3 && MAPy2 > MAPy1)
        display('Class 2 will be predicted');
        else if(MAPy3 > MAPy2 && MAPy3 > MAPy1)
        display('Class 3 will be predicted');
            else
                display('All classes have equal chances');
            end
    end
end
        