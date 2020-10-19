% Homework #4
% MEEN 2240 - Spring 2019
% Newlin, Michael
%% Ch.4, Exc.2
clear
clc
x = nexthour(12);
fprintf('the next hour will be %d. \n', x);

%% Ch.4, Exc.7
clear
clc
year_1 = input('Employment August 2016: ');
year_2 = input('Employment August 2017: ');
if(year_2 > year_1)
    fprintf('There was a YOY gain\n');
elseif(year_2 < year_1)
    fprintf('There was a YOY loss\n');
else
    fprintf('There was no gain or loss\n');
end

%% Ch.4, Exc.9
clear
clc
load parttolerance.dat
PN = parttolerance(1);
p_min = parttolerance(2);
p_max = parttolerance(3);
weight = input('How much does the part weigh?:  ');
if( weight>=p_min && weight<=p_max)
    fprintf('This part meets the standard\n');
else
    fprintf('The part does not meet the standard\n');
end

%% Ch.4, Exc.11
clear
clc
number = 101
if(number > 100)
    number = 100
end

%% Ch.4, Exc.12
clear
clc
val = 11;
if(val>=10)
    disp('Hello');
else
    disp('Hi');
end

%% Ch.4, Exc.13
clear
clc
A_1 = input('What is the first area?:  ');
A_2 = input('What is the second area?:  ');
res = v1vsv2(A_1, A_2);
if (res)
    disp('v2 is greater than v1');
else
    disp('v1 is greater than v2');
end


%% Ch.4, Exc.18
clear
clc
letter = input('Enter your answer:  ', 's');
if(letter == 'y' || letter == 'Y')
    disp('Ok, continuing');
elseif(letter == 'n' || letter == 'N')
    disp('ok halting');
else
    disp('Error');
end

%% Ch.4, Exc.24
clear
clc
num = 3;
switch true
    case num >= -2 && num < 0
        %f3(num)
        disp('f3(num);')
    case num >= 0 && num <= 2
        %f2(num)
        disp('f2(num);')
    case num > 2 && num <= 4
        %f4(num)
        disp('f4(num);')
    otherwise
        %f1(num)
        disp('f1(num);')
end


%% Ch.4, Exc.26
clear
clc
% areamenu for rect, circ, cyl, user defined fxns for calculations
clear
clc
fprintf('Menu \n1. Cylinder\n2. Circle\n3. Rectangle\n');
choice = input('Please choose one:  ');
switch true
    case choice ==1
        rad_1 = input('Please enter radius:  ');
        height_1 = input('Please enter height:  ');
        two_circles = 2 * pi * (rad_1 ^ 2);
        circum = 2 * pi * rad_1;
        side_surface = circum * height_1;
        area = side_surface + two_circles;
    case choice == 2
        rad_2 = input('Please enter radius:  ');
        area = pi * (rad_2 ^ 2);
    case choice == 3
        len = input('Please enter length:  ');
        wid = input('Please enter width:  ');
        area = len * wid;
    otherwise
        disp('Please re run, you entered an invalid selection');
end
fprintf('The area is: %.2f\n',area);