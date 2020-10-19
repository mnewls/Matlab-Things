% Homework #5
% MEEN 2240 - Spring 2019
% Newlin, Michael
%% Ch.5, Exc.4
%
% it would matter as your counter variable will go through 1,2,3 versus
% 3,5,6.  I do not know when it would not matter.

%% Ch.5, Exc.6
clear all
clc

in = input('tell me where to count to:  ');

sumsteps2(in)

%% Ch.5, Exc.8
clear all
clc
num = randi([2,5],1,1);
sum = 0;
for i = 1:num

    user_in = input('gimme a num:  ');
    sum = sum + user_in;
    fprintf('your running sum is:  %.1f \n',sum);
end


%% Ch.5, Exc.15
clear all
clc

vec = zeros(5);
for r_count = 1:1:5
    for c_count = 1:1:5
        vec(r_count,c_count) = r_count * c_count;
        % following ifs manulaly eliminate upper left corner. 
        if r_count == 1 && c_count > 1
            vec(r_count,c_count) = 0;
        end
         if r_count == 2 && c_count > 2
            vec(r_count,c_count) = 0;
         end
         if r_count == 3 && c_count > 3
            vec(r_count,c_count) = 0;
         end
         if r_count == 4 && c_count > 4
            vec(r_count,c_count) = 0;
        end
        
    end
end

disp(vec)

%% Ch.5, Exc.16
clear all
clc

test_vec = [1 5 10; 15 20 25; 30 35 40];

matrixavg(test_vec)

%% Ch.5, Exc.22
clear all
clc
count = 1;
num = randi([0 50],1,1);
disp(num);
while num < 25
count = count + 1;
    num = randi([0 50],1,1);
    disp(num);
end

fprintf('this took %.0f tries \n', count);

%% Ch.5, Exc.23
clear all
clc
actual_e_1 = exp(-1);
calc_e_1 = 1;
n = 1;
while abs((calc_e_1 - actual_e_1)) > 0.0001
    n = n + 1;
    calc_e_1 = ((1-1/n) ^ n );
end
fprintf('The real value is %.4f \n', actual_e_1);
fprintf('The approx value is %.4f \n', calc_e_1);
fprintf('The number of iterations it took is %d \n', n);

%% Ch.5, Exc.27
clear all
clc
max = input('Give me the max:  ');
if max >= -16 && max <= 20
    prtemps(max);
end

max_temp = ((max * (9/5)) + 32);
fprintf('C: %6.1f ', max);
fprintf('F: %6.1f \n', max_temp);

%% Ch.5, Exc.45
clear all
clc
A = [1,2,3;1,2,3;1,2,3];
B = [1,2,3;1,2,3;1,2,3];
[r_A c_A] = size(A);
[r_B c_B] = size(B);
C = zeros(r_A, c_B);
if (c_A == r_B)
for i = 1:r_A
    for j = 1:c_B
        indv = 0;
        for k = 1:c_A
    
        indv = indv + (A(i,k) * B(k,j));
            
        end
        C(i,j) = indv;
    end
end
end
disp(C)

D = A .* B;
disp(D)




function [] = prtemps(in)
    for i = 0:5:in
       f = ((i * (9/5)) + 32);
       fprintf('C: %6.1f ', i);
       fprintf('F: %6.1f \n', f);
    end
end
