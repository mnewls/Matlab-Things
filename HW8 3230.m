%% Homework 8
clear
clc

s = tf('s');

sys_1 = 1/(s+1);
sys_2 = s/(s^2 +2);

sys_3 = series(sys_1, sys_2);

feed_1 = (4*s + 2) / (s^2 + 2*s +1);

loop_1 = feedback(sys_3,feed_1);

loop_2 = feedback((1/s^2),50,+1);

sys_5 = series(loop_1, loop_2);

sys_6 = (s^2 +2) / (s^3 +14);

sys_tot = feedback(sys_5, sys_6, 1);

T_of_s = 4 * sys_tot

pole = pole(T_of_s)

pzplot(T_of_s)

% Results

% T_of_s =
%  
%                                                   
%    4 s^6 + 8 s^5 + 4 s^4 + 56 s^3 + 112 s^2 + 56 s
%                                                   
%   --------------------------------------------------
%                                                     
%   s^10 + 3 s^9 - 45 s^8 - 125 s^7 - 200 s^6         
%                                                     
%           - 1179 s^5 - 2348 s^4 - 3491 s^3          
%                                                     
%                           - 7676 s^2 - 5602 s - 1400
%                                                     
%  
% Continuous-time transfer function.
% 
% 
% pole =
% 
%    7.0712 + 0.0000i
%   -7.0708 + 0.0000i
%    1.2050 + 2.0882i
%    1.2050 - 2.0882i
%    0.1223 + 1.8367i
%    0.1223 - 1.8367i
%   -2.4225 + 0.0000i
%   -2.3056 + 0.0000i
%   -0.4635 + 0.1993i
%   -0.4635 - 0.1993i
% appears to be 5 poles in positive s plane