%% 3850 Project 5.5 - 4 PJ c,d
clear
clc

slopes = [];

h = 75;
left = [201:h:876];
right = [275:h:950];

r_p = [2.5,2.5,5.0,7.5,12.5,17.5,42.5,5.0,2.5,2.5];
c_p = [2.5,5.0,10.0,17.5,30.0,47.5,90.0,95.0,97.5,100];

n_interval = length(r_p);

slopes(1) = c_p(1) / (h/2);
slopes(n_interval) = (c_p(n_interval) - c_p(n_interval - 1)) / (1.5 * h);

for i = 2:1:(n_interval-1)

    slopes(i) = (c_p(i) - c_p(i-1)) / h;
    
end

% this number may vary ** 
n_sims = 500;

pool_pay = 45;
overtime_pay = 81;

cost = [];

s_count = 1;
size = [100:100:900];

for S = size
    C = 0;
    for j = 1:1:n_sims
        r_d = rand;
        
        if r_d < c_p(1)
            x_0 = (left(1) + right(1)) / 2;
            y_0 = c_p(1);
            x = x_0 + (r_d - y_0) / slopes(1);
        elseif r_d < c_p(2)
            x_0 = (left(2) + right(2)) / 2;
            y_0 = c_p(2);
            x = x_0 + (r_d - y_0) / slopes(2);
        elseif r_d < c_p(3)
            x_0 = (left(3) + right(3)) / 2;
            y_0 = c_p(3);
            x = x_0 + (r_d - y_0) / slopes(3);
        elseif r_d < c_p(4)
            x_0 = (left(4) + right(4)) / 2;
            y_0 = c_p(4);
            x = x_0 + (r_d - y_0) / slopes(4);
        elseif r_d < c_p(5)
            x_0 = (left(5) + right(5)) / 2;
            y_0 = c_p(5);
            x = x_0 + (r_d - y_0) / slopes(5);
        elseif r_d < c_p(6)
            x_0 = (left(6) + right(6)) / 2;
            y_0 = c_p(6);
            x = x_0 + (r_d - y_0) / slopes(6);
        elseif r_d < c_p(7)
            x_0 = (left(7) + right(7)) / 2;
            y_0 = c_p(7);
            x = x_0 + (r_d - y_0) / slopes(7);
        elseif r_d < c_p(8)
            x_0 = (left(8) + right(8)) / 2;
            y_0 = c_p(8);
            x = x_0 + (r_d - y_0) / slopes(8);
        elseif r_d < c_p(9)
            x_0 = (left(9) + right(9)) / 2;
            y_0 = c_p(9);
            x = x_0 + (r_d - y_0) / slopes(9);
        else
            x_0 = right(10);
            y_0 = c_p(10);
            x = x_0 + (r_d - y_0) / slopes(10);
        end
        
        if x < S 
            c_x_s = pool_pay * S;
        else
            c_x_s = (pool_pay * S) + (x - S) * overtime_pay;
        end
        C = C + c_x_s;
    end
    cost(s_count) = C / n_sims;
    s_count = s_count +1;
end

plot(size, cost, '*')
