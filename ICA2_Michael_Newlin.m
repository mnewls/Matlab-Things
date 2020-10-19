%% Michael Newlin In Class Assignment 2
%% 10/1/2019
clear all
clc

left = 0;
right_1 = 0;
right_2 = 0;

for i = 1:10
    left = left + ((2 * i) + (i^2));
    right_1 = right_1 + i;
    right_2 = right_2 + (i^2);
end

right_tot = (2*right_1) + right_2;

if left == right_tot
    disp('equal');
    disp(left);
    disp(right_tot);
else
    disp('not equal');
end
