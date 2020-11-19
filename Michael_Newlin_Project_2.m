%Michael Newlin 5A

clear
clc

s = tf('s');
% 
% t_s = 9;
% OS = 10;

%min_t_s = 1000;
% I was lazy and used an iterative method to solve for the appropriate
% values of K_a and K_2
% for sys_1_K_a = 0:1:100
%     for feed_1_K_2 = 0:.01:3
%         
        sys_2 = 1/s;
        sys_1_K_a = 99;

        sys_3 = series(sys_1_K_a, sys_2);

        sys_4 = 1/(s+1);

        sys_5 = series(sys_3, sys_4);
        
        feed_1_K_2 = 1.62;

        loop_1 = feedback(sys_5,feed_1_K_2);

        sys_6 = 1/s;

        sys_7 = series(loop_1, sys_6);

        feed_2 = 1;

        sys_tot = feedback(sys_7, feed_2);

        stepplot(sys_tot,20)
        this_OS = stepinfo(sys_tot).Overshoot;
        this_settle_time = stepinfo(sys_tot).SettlingTime;
        
        disp(this_OS)
        disp(this_settle_time)
        
%         if (this_OS < OS) && (this_settle_time < t_s)
%             
%             
%             if(this_settle_time < min_t_s)
%                 min_t_s = this_settle_time;
%                 good_K_a = sys_1_K_a;
%                 good_K_2 = feed_1_K_2;
%             end
%            
%          end
% 
%     end
% end

% this search resulted in K_2 = 1.62 and K_a = 99
figure

bode(sys_tot)

figure

pzplot(sys_tot)