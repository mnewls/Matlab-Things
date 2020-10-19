% Homework #1
% MEEN 2240 - Spring 2019
% Newlin, Michael
%% Ch.1, Exc.1
clear all, clc

myage = 25
myage + 2
myage - 3

%% Ch.1, Exc.3
clear all, clc
result = 9*2
result = 9*2;
% the first result is not suppressed and displays to the user. the second
% gets completed in the background

%% Ch.1, Exc.8
clear all, clc
format rat 
5/16+2/7

%% Ch.1, Exc.11
%resetting format from last excersize
format short
clear all, clc

ftemp = 97;
ctemp = (ftemp -32) * 5/9

%% Ch.1, Exc.15
clear all, clc
rand_1 = rand() * 30
rand_2 = 10 + rand() * 90
rand_3 = randi(20)
rand_4 = randi(21) - 1
rand_5 = randi([30,80],1)

%% Ch.1, Exc.19
clear all, clc
R_1 = 20;
R_2 = 10.2;
R_3 = 30.5;

R_T = 1 / ( (1/R_1) + (1/R_2) + (1/R_3))

%% Ch.1, Exc.22
clear all, clc
result = -20;

0 <= result

result <= 10

0 <= result <= 10

% Matlab performs the first comparison between 0 and -20, and comes to a
% false logical. Then matlab performs the comparison between -20 and 10.
% Leading to a final boolean true.

%% Ch.1, Exc.29
clear all, clc
%fix(3.5) floor(3.5) are the same Y
%fix(3.4) fix(-3.4) are not the same N
%fix(3.2) floor(3.2) are the same Y
%fix(-3.2) floor(-3.2) are not the same N
%fix(-3.2) ceil(-3.2) are the same Y - have same results at least

%% Ch.1, Exc.35
clear all, clc
%(Use a speed value, v, of 2.2 x 108 m/s) 
v = 2.2 * 10^8;
c = 3.0 * 10^8;
Lorentz = 1/sqrt( ( 1 - ( (v^2) / (c^2)))) 

%% Ch.1, Exc.36
clear all, clc
% (Use a weight value of 50.4, and N = 2) 

weight = 50.4;
N = 2;
max = weight + (weight * (N/100))
min = weight - (weight * (N/100))





