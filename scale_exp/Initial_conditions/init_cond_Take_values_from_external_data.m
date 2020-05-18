%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                                     %%%
%%%           INITIAL CONDITIONS        %%%
%%%                                     %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Temperatures here are given in degree Celsius, Kalvin are only used for within parameters...
% Since temperature behaviour all come from ODEs, and since Kalvin is just
% shifted celsius (1K= -272.15 C), we do not have a unit problem.

load("../Model_files/matlab_format_input_data/external_temperature.mat")
a = AA.Data(1);

% 
% Boiler 
%        
initial_temp_water_in_boilers =  a*ones(nb_boilers,1); % This is water...   % Celsius

%
% Radiator
%
initial_temperature_water_in_radiator = a*ones(nb_radiators,1); % Celsius     

%
% Zone
%
initial_temperature_rooms = a*ones(nb_rooms,1); % Celsius            

initial_relative_humidity = a*ones(nb_rooms,1); % Ratio [0,1]   

clear a;
clear AA: % from loading external temperature.