%%Homework 7
% p9.16
clear
clc
x = [-.86113631, -.33998104, .33998104, .86113631];
f_x = exp(-1*((x+1).^2));
const = [.3478548, .6521452, .6521452, .3478548];
f_tot = sum(const .* f_x);

integral_approx = (2/ sqrt(pi)) * f_tot


% integral_approx =
% 
%    0.995488921128100

%% p9.17
clear
clc
format long

x = [-.86113631, -.33998104, .33998104, .86113631];
const = [.3478548, .6521452, .6521452, .3478548];
x_fix = ( 3 .* x + 3 ) / 2;

f_x = -0.5*x_fix.^5 + 3.9*x_fix.^4 - 8.1*x_fix.^3 + 2.7 * x_fix.^2 + 5.9 * x_fix + 1.5;
f_int = sum(const .* f_x);

integral_approx = f_int * 1.5


% integral_approx =
% 
%   20.114999519776340

%% p 9.37
clear
clc
format short

x = [-.90617985, -.53846931, 0, .53846931, .90617985];
const = [.2369269, .4786287, .5688889, .4786187, .2369269];

t = ((24 .* x) + 24)/2;

force = 160 .* ( t ./ (t+4)) .* exp(((-1*t)./8));
f_int = sum(force .* const);

integral_approx = 12 * f_int

% integral_approx =
% 
%   633.9429


