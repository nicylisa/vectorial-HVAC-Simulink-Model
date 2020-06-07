%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                                     %%%
%%%           INITIAL CONDITIONS        %%%
%%%                                     %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Temperatures here are given in degree Celsius, Kalvin are only used for within parameters...
% Since temperature behaviour all come from ODEs, and since Kalvin is just
% shifted celsius (1K= -272.15 C), we do not have a unit problem.

% 
% Boiler 
%        
initial_temp_water_in_boilers =  17*ones(nb_boilers,1); % This is water...   % Celsius

%
% Radiator
%
initial_temperature_water_in_radiator = ones(nb_radiators,1)*17; % Celsius     

%
% Zone
%
initial_temperature_rooms = ones(nb_rooms,1)*17; % Celsius            

initial_relative_humidity = ones(nb_rooms,1)*0.5; % Ratio [0,1]     