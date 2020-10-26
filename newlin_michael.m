%% 4120 project 4b & 4c
%inputs
% H: pressure altitude (m)
% W: weight (N)
% S: wing area (m^2)
% AR: aspect ratio
% cd_0: parasite drag
% e: oswald
% N: # turbofans
% Ta: thrust available (N)

clear
clc


given_weight = 103047;
given_area = 47;
given_AR = 6.5;
given_para_drag = .032;
given_oswald = 0.87;
given_num_turbo = 2;
given_thrust = 40298;

calc_airplane_perf(0, given_weight, given_area, given_AR, given_para_drag, given_oswald, given_num_turbo, given_thrust)

%calc_airplane_perf(17400, given_weight, given_area, given_AR, given_para_drag, given_oswald, given_num_turbo, given_thrust)

function [] = calc_airplane_perf(alt, weight, wing_area, aspect_rat, para_drag, oswald, n_turbo, thrust_avail)

    %assume bank angle = 0
    phi = 0;
    
    rho_sls = 1.225;
    
    %eta = 1
    %T_a = 
    velo = [0:10:1000];
    
    if alt ~= 0
        [T, a, P, rho] = atmoscoesa(alt, 'Warning');
        T_a = n_turbo * (rho / rho_sls) * thrust_avail;
        c_l = weight ./ ( 0.5 .* rho .* ((velo.^2)) .* wing_area);
        
    else
        T_a = n_turbo * thrust_avail;
        c_l = weight ./ ( 0.5 .* rho_sls .* ((velo.^2)) .* wing_area);
    end
    
    c_d = para_drag + ((c_l .^2) ./ (pi * oswald * aspect_rat));
    
    c_d_induced = ((c_l .^2) ./ (pi * oswald * aspect_rat));
    
    l_div_d = c_l ./ c_d;
    
    T_r = weight ./ (l_div_d);
    
    P_r = T_r .* velo;
    
    P_a = T_a .*velo;
    
    plot(velo, T_r, velo, T_a, 'r+')
    xlabel('velocity (m/s)')
    ylabel('thrust required (N)')
    
    figure
    
    plot(velo, P_r, velo, P_a, 'b+')
    xlabel('velocity (m/s)')
    ylabel('Power')
    
    figure
    
    plot(velo, l_div_d)
    xlabel('velocity (m/s)')
    ylabel('Cl / Cd')
    
    figure
    
    plot(velo, para_drag, 'r', velo, c_d_induced, 'k')
    xlabel('velocity (m/s)')
    ylabel('drag coefficients')
    
    
end

% stall speed somewhere around 17 m/s
% max speed somewhere around 295 m/s
% max altitude 17400 m 




