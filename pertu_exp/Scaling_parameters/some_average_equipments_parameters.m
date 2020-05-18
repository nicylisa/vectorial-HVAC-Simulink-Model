%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                                 	%%%
%%%	    Equipment Inputs                %%%
%%%                                 	%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%
% BOILER
%
tau_boiler = 600;           % Thermal Time Constant          % second.                              If all boilers have the same, no need to be a vector.
k_boiler_border = 50;       % Thermal conductivity for a carbon steel boiler                        If all boilers have the same, no need to be a vector.
                            % Joul/(second*metter*Kalvin) alternatively Watts/(metter*Kalvin)                                    
thickness_boiler = 0.05 ;   % metter                                                                If all boilers have the same, no need to be a vector.
                            % radius = 0.4, height = 1.7
Area_boiler = 5.278 ;               % metter^2                                                      If all boilers have the same, no need to be a vector.
volume_water_boiler = 0.855;        % metters^3         
water_weight_in_boiler = 1000*volume_water_boiler ;    % KiloGramme

%
% RADIATOR
%
k_radiators = 52; % Joul/(second*metter^2*Kalvin) 	for cast iron		  Is a 1d- vector of size (nb_private_rooms)    If all boilers have the same, no need to be a vector.
Area_radiators = 1.5*1.5*2; 		% metter^2                        Is a 1d- vector of size (nb_private_rooms)    If all boilers have the same, no need to be a vector.
Volume_radiators = 1.5*1.5*0.08; 	% metter^3                    Is a 1d- vector of size (nb_private_rooms)    If all boilers have the same, no need to be a vector.
thickness_radiator_pipes = 0.019;		% metters		for (3/4") pipes  Is a 1d- vector of size (nb_private_rooms)    If all boilers have the same, no need to be a vector.
mass_water_radiator = 1000*Volume_radiators; % kg/m3

%
% ENERGY CONSUMPTION (UNUSED FEATURE AT THE MOMENT)
%
Energy_used_by_air_conditioner_for_1_timeunit_in_Watts_vector = zeros(nb_air_cons,1) ; % Joul/second alternatively Watts	Is a 1d- vector of size (nb_private_rooms)
Energy_used_by_air_mixer_for_1_timeunit_in_Watts = 0; 
Energy_used_by_boiler_for_1_timeunit_in_Watts = 0; 

