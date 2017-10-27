d = load('Q1Data.mat');

%Storing data temporarily to extract values row wise
temp_Data = d.D(d.D(:,2) == 2 & d.D(:,3) == 2 & d.D(:,4) == 2 & d.D(:,5) == 2);

temp_1 = 0;
temp_2 = 0;
temp_3 = 0;
for c = 1:size(temp_Data)
    if(d.D(temp_Data(c),6) == 1)
        temp_1 = temp_1 + 1;
    else if(d.D(temp_Data(c),6) == 2)
            temp_2 = temp_2 + 1;
        else if(d.D(temp_Data(c),6) == 3)
                temp_3 = temp_3 + 1;
            end
        end
    end
end


% Reading Data Row Wise
First_class = d.D(d.D(:,6) == 1);
Second_class = d.D(d.D(:,6) == 2);
Third_class = d.D(d.D(:,6) == 3);
Size_of_1 = size(First_class,1);
Size_of_2 = size(Second_class,1);
Size_of_3 = size(Third_class,1);

Likelihood_Of_Class_1 = temp_1 / Size_of_1;
Likelihood_Of_Class_2 = temp_2 / Size_of_2;
Likelihood_Of_Class_3 = temp_3 / Size_of_3;

display('MLE is = ');
fprintf('Maximum likelihood estimation for First class = %f\n',Likelihood_Of_Class_1);
fprintf('Maximum likelihood estimation for Second class = %f\n',Likelihood_Of_Class_2);
fprintf('Maximum likelihood estimation for Third class = %f\n',Likelihood_Of_Class_3);

if(Likelihood_Of_Class_1 > Likelihood_Of_Class_2 && Likelihood_Of_Class_1 > Likelihood_Of_Class_3)
    display('Class 1 is predicted');
else if(Likelihood_Of_Class_2 > Likelihood_Of_Class_3 && Likelihood_Of_Class_2 > Likelihood_Of_Class_1)
        display('Class 2 is predicted');
    else if(Likelihood_Of_Class_3 > Likelihood_Of_Class_2 && Likelihood_Of_Class_3 > Likelihood_Of_Class_1)
        display('Class 3 is predicted');
            else
                display('All classes have equal chances');
        end
    end
end
fprintf('\n');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Code to Compute Maximum likelihood estimation (MLE) Ends Here %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Code to Compute Maximum a posteriori estimation (MAP) Starts From Here %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Applying Formula of P(y) given in the assignment!!!
P(1) = 0;
P(2) = 0;
P(3) = 0;

P(1) = ((3/10)*0) + ((1/10)*0) + ((6/10)*1);
P(2) = ((3/10)*0) + ((1/10)*1) + ((6/10)*0);
P(3) = ((3/10)*1) + ((1/10)*0) + ((6/10)*0);

MAP_For_Class_1 = Likelihood_Of_Class_1 * P(1);
MAP_For_Class_2 = Likelihood_Of_Class_2 * P(2);
MAP_For_Class_3 = Likelihood_Of_Class_3 * P(3);

display('Maximum a posteriori estimation (MAP) = ');
fprintf('Maximum a posteriori estimation for class 1 is = %f\n', MAP_For_Class_1);
fprintf('Maximum a posteriori estimation for class 2 is = %f\n', MAP_For_Class_2);
fprintf('Maximum a posteriori estimation for class 3 is = %f\n', MAP_For_Class_3);

if(MAP_For_Class_1 > MAP_For_Class_2 && MAP_For_Class_1 > MAP_For_Class_3)
    display('Class 1 will be predicted');
else if(MAP_For_Class_2 > MAP_For_Class_3 && MAP_For_Class_2 > MAP_For_Class_1)
        display('Class 2 will be predicted');
        else if(MAP_For_Class_3 > MAP_For_Class_2 && MAP_For_Class_3 > MAP_For_Class_1)
        display('Class 3 will be predicted');
            else
                display('All classes have equal chances');
            end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Code to Compute Maximum a posteriori estimation (MAP) Ends Here %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        