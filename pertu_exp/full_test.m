clear all;
do_the_external_data_validity_test = 1; 

% time_unit parameters : 1 time_unit = 1 simulink step
nb_second_in_timeunit = 60*5; 
timeunit_in_a_day = 2*6*24; 
nb_time_unit_in_a_simulation = 2*6*24;                                                                        
nb_step_to_fifteen_min = 3;
nb_step_to_thirty_min = 6;
nb_step_to_one_h = 12;

%% Load physical constants (independant of inputs.)
run("Model_files/Physics_constant/physic_constants"); %DO NOT TOUCH

%% check and adapt to matlab format the external datas
run("external_data/meta_variables_external_data.m");
if do_the_external_data_validity_test == 1
    external_data_okay = load_external_data(nb_time_unit_in_a_simulation,nb_humans);
end
%%
    
nb_rooms = 4;
rate = 1;
                
% Load Building layout parameters. 
run("load_parameters");
% load initial condition based on outside temperature of external data
run("Initial_conditions/init_cond_Take_values_from_external_data");  