% Meta parameters
% nb_rooms= ; DONE IN PREVIOUS STEP VIA LOOP
nb_boilers = 2;
nb_radiators = nb_rooms-2; % boiler room and and coridor no AC/radiator
nb_air_cons = nb_rooms-2;

run("Scaling_parameters/create_corridor_layout");
run("Scaling_parameters/some_average_equipments_parameters.m");
