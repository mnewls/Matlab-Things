%% 4120 project 4b & 4c
clear
clc

given_mass = 103047;
given_wing_area = 47;
given_A_R = 6.5;
given_para_drag = .032;
given_oswald = 0.87;
given_num_turbo = 2;
given_thrust_per = 40298;

calc_airplane_perf(0, given_mass, given_wing_area, given_A_R, given_para_drag, given_oswald, given_num_turbo, given_thrust_per)
%calc_airplane_perf(16000, given_mass, given_wing_area, given_A_R, given_para_drag, given_oswald, given_num_turbo, given_thrust_per)
%calc_airplane_perf(17000, given_mass, given_wing_area, given_A_R, given_para_drag, given_oswald, given_num_turbo, given_thrust_per)
%calc_airplane_perf(17400, given_mass, given_wing_area, given_A_R, given_para_drag, given_oswald, given_num_turbo, given_thrust_per)


function [] = calc_airplane_perf(alt, mass, wing_area, aspect_ratio, para_drag, oswald, n_engine, thrust_avail_per)

    velo = [0:5:1000];
    
    %bank angle = 0
    %given rho_sls
    phi = 0;
    rho_sls = 1.225;
    
    % calculate life coefficient depending on if SLS or if high in air
    if alt == 0
         % assume eta = 1 
        total_thrust_avail = n_engine * thrust_avail_per;
        c_l = mass ./ ( 0.5 .* rho_sls .* ((velo.^2)) .* wing_area);
    else
         % assume eta = 1 
        [T, a, P, rho] = atmoscoesa(alt, 'Warning');
        total_thrust_avail = n_engine * (rho / rho_sls) * thrust_avail_per;
        c_l = mass ./ ( 0.5 .* rho .* ((velo.^2)) .* wing_area);
    end
    
    %total drag
    c_d = para_drag + ((c_l .^2) ./ (pi * oswald * aspect_ratio));
    
    %total induced drag
    c_d_induced = ((c_l .^2) ./ (pi * oswald * aspect_ratio));
    
    %lift:drag ratio
    c_l_div_c_d = c_l ./ c_d;
    
    thrust_required = mass ./ (c_l_div_c_d);
    
    power_required = thrust_required .* velo;
    
    power_avail = total_thrust_avail .*velo;
    
    %subplotting to see all in one window
    subplot(2,2,1)
    plot(velo, thrust_required, velo, total_thrust_avail, 'r+')
    legend("thrust required", "thrust available")
    xlabel('velocity (m/s)')
    ylabel('thrust required (N)')
    
    subplot(2,2,2)
    plot(velo, power_required, velo, power_avail, 'b+')
    legend("power required", "power available")
    xlabel('velocity (m/s)')
    ylabel('power (W)')
    
    subplot(2,2,3)
    plot(velo, c_l_div_c_d)
    xlabel('velocity (m/s)')
    ylabel('Cl / Cd')
    
    subplot(2,2,4)
    plot(velo, c_d_induced, 'k')
    xlabel('velocity (m/s)')
    ylabel('induced drag')
    
    figure
    
    plot(velo, para_drag, 'b+')
    xlabel('velocity (m/s)')
    ylabel('parasitic drag')
end




