%% 4.10
clear
clc

t = [0:.01:30];

x_1 = -.333 .*sin(2 .* t + 1.571) - (0.5167*10^-20) .* sin(1.414 .* t + 1.371);
x_2 = sin(2.*t + 1.571) - (1.55 .* 10^-20) .* sin(1.414 .* t + 1.371);

subplot(2,1,1);
plot(t,x_1);
title("x1 vs time")
xlabel("time")
ylabel("displacement")

subplot(2,1,2);
plot(t,x_2);
title("x2 vs time")
xlabel("time")
ylabel("displacement")

%% 4.16
clear
clc

t = [0:.01:30];

x_1_1 = (1/6) .* (cos(sqrt(2) .*t) - cos(2.*t));
x_1_2 = (1/2) .* (cos(sqrt(2) .*t) + cos(2.*t));

x_2_1 = (1/12) .* (sqrt(2) .* sin(sqrt(2) .*t) - sin(2.*t));
x_2_2 = (1/4) .* (sqrt(2) .* sin(sqrt(2) .*t) + sin(2.*t));

subplot(2,2,1);
plot(t,x_1_1);
title("x1 vs time")
xlabel("time")
ylabel("displacement")

subplot(2,2,2);
plot(t,x_1_2);
title("x2 vs time")
xlabel("time")
ylabel("displacement")

subplot(2,2,3);
plot(t,x_2_1);
title("x3 vs time")
xlabel("time")
ylabel("displacement")

subplot(2,2,4);
plot(t,x_2_2);
title("x4 vs time")
xlabel("time")
ylabel("displacement")