%% ch3 p21
clear
clc

t = [0:0.2:30];

x = [];

for i = 1:1:length(t)

    if t(i) <= 4
        x(i) = 5 * (t(i) - sin(t(i)));
    else
        x(i) = 5 * (t(i) - sin(t(i))) + 5 * (sin((t(i) - 4)) - (t(i) - 4));
    end
    
end

plot(t,x)

%% ch3 p23
clear
clc

t = [0:0.05:5];

x = 0.5 .* t - ( 0.05 .* sin(( 10 .*t)));

plot(t,x)
