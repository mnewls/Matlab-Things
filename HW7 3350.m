%% Homework 7 4.1-5
clear
clc

x = [ .59 .8 .95 .45 .79 .99 .90 .65 .79 .69 .79 .49 1.09 .95 .79 .65 .45 .6 .89 .79 .99 .85];
y = [3980 2200 1850 6100 2100 1700 2000 4200 2440 3300 2300 6000 1190 1960 2760 4330 6960 4160 1990 2860 1920 2160];

constants = polyfit(x, y, 1)

y_ind = polyval(constants,x);

RMSE = sqrt((sum((y - y_ind) .^2)) / 22)

plot(x,y,'r:',x,y_ind,'ko')
ylabel('sales / week')
xlabel('price')

c_1 = constants(1);
c_2 = constants(2) + -0.23 * constants(1);
c_3 = constants(2) * -0.23;

c_4 = 2 * c_1;
c_5 = c_2;

price_max = c_5 / - c_4

%Output
% 
% constants =
% 
%    1.0e+03 *
% 
%    -8.3144    9.5101
% 
% 
% RMSE =
% 
%   518.3059
% 
% 
% price_max =
% 
%     0.6869
