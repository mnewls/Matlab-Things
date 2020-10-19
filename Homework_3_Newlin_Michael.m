% Homework #3
% MEEN 2240 - Spring 2019
% Newlin, Michael
%% Ch.2, Exc.42
clear
clc
v = [33 10.5 40 18 20 7.5];
hours = v(1:2:end);
pay_per_hour = v(2:2:end);
total_pay = hours .* pay_per_hour

%% Ch.2, Exc.48
clear
clc
vec = randi([50 100],1,20)

evens = vec(~rem(vec,2))
odds = vec(rem(vec,2)~=0)

%% Ch.3, Exc.5
clear
clc
num = input('gimme a num: ');
fprintf('your num was: %.2f \n', num);


%% Ch.3, Exc.9
clear
clc
string = input('gimme a string: ', 's');
fprintf('Your string was: ''%s'' \n', string);

%% Ch.3, Exc.13
clear
clc

mynum = input('Please enter a number: ');
mychar = input('Please enter a character: ', 's');
fprintf('Your number is %.2f \n', mynum)
fprintf('Your char is   %c! \n', mychar)

%% Ch.3, Exc.14
clear
clc
num = input('how many kwh this month?: ');
fprintf('Your charge for %.0f KWH will be $%.2f. \n', num, power_charge(num));

%% Ch.3, Exc.18
clear
clc
x_10 = linspace(0,pi,10);
x_100 = linspace(0,pi,100);
y_10 = sin(x_10);
y_100 = sin(x_100);

plot(x_10,y_10,'m');axis([-.5 pi+.5 0 1.5]);grid on
xlabel('x')
ylabel('y')
title('sin(x) by 10')
figure;
plot(x_100,y_100,'k');axis([-.5 pi+.5 0 1.5]);
grid on

xlabel('x')
ylabel('y')
title('sin(x) by 100')

%% Ch.3, Exc.19
clear
clc
ch_3_ex_19();

%% Ch.3, Exc.23
clear
clc
rand = randi([50,100],3,6)
save randfile.dat rand -ascii
rand_2 = randi([50,100],2,6)
save randfile.dat rand_2 -ascii -append
clear
clc
load randfile.dat
randfile

%% Ch.3, Exc.27
clear
clc
inches = 36;

fprintf('that is %.2f feet\n', in2ft(inches));


%% Ch.3, Exc.28
clear
clc
rows = 6;
cols = 5;
fives = fives(rows,cols)

%% Ch.3, Exc.30
clear
clc
vec = [3 4]
ans = rotleft(vec)

vec = [3 4 1]
ans = rotleft(vec)

%% Ch.3, Exc.33
clear
clc
A = 3;
B = 4;
C = 5;
ans = ispythag(A, B, C)

%% Ch.3, Exc.37
clear
clc
amt_rain = 3;
amt_snow = snow_calc(amt_rain)
amt_snow_2 = r2s(amt_rain)

%% OP.1
clear
clc
load alt_temp.dat
height = alt_temp(:,1);
temp = alt_temp(:,2);

plot(height,temp,'k*');
grid on

xlabel('altitude (Ft)')
ylabel('temperatre (K)')
title('Temp by changes in altitude')



%%



function ans = snow_calc(rain)
    ans = rain * 6.5;
end
