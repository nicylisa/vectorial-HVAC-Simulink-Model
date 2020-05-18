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
else
    external_data_okay = 1;
end
%%
if external_data_okay ==1
    
    NB_ROOMS_STARTS = 4;
    NB_ROOMS_TOY_EX = 4; % upper and lower bounds on the number of room
    
    rate_posssible_table = [1] ; % table of rates we wish to analyse. A table allows us to have a non-linear scaling.
    
    time_max_for_simulation = 60*8; % specify the time max allowed per simulation
    % A timer will be added inside the simulink model and this timer
    % callback will stop the simulation past the time
        
    result_table = zeros(NB_ROOMS_TOY_EX-NB_ROOMS_STARTS+1,1); % initialize a table in which we will sort our results.
    
    for tool_id = 1 :1 % loops for each tools.
              
        for nb_rooms = NB_ROOMS_STARTS: NB_ROOMS_TOY_EX   % loop on the number of rooms in the building
            
            for rate_index = 1:size(rate_posssible_table,2) % loop on the rate of the monitoring tool
                rate = rate_posssible_table(rate_index);
                
                % Load Building layout parameters. 
                run("load_parameters");

                % load initial condition based on outside temperature of external data
                run("Initial_conditions/init_cond_Take_values_from_external_data");  

                % LOAD TOOL INPUT - TOOL DEPENDANT
                run("tool_setups/Breach/load_breach_inputs.m");
                
                if tool_id==1
                    run("tool_setups/Breach/load_breach_inputs.m");
                end
                %if tool_id==2                    
                %if tool_id==3 % nothing to do
                if tool_id==4
                    run("tool_setups/S-Taliro/load_Tarilo_parameters.m");
                end
                
                

                % Simulation itself with timer management                
                if tool_id==1
                    mytimer = timer('StartDelay',time_max_for_simulation, 'TimerFcn','set_param("model_breach", "SimulationCommand", "stop")');
                    start(mytimer)
                    t = cputime;
                    disp("Running simulation for tool Breach on building with " + nb_rooms +" rooms and a rate of " +rate);                  
                    sim('model_breach',nb_time_unit_in_a_simulation);
                end
                if tool_id==2
                    mytimer = timer('StartDelay',time_max_for_simulation, 'TimerFcn','set_param("model_GT", "SimulationCommand", "stop")');
                    start(mytimer)
                    t = cputime;
                    disp("Running simulation for library GT on building with " + nb_rooms +" rooms and a rate of " +rate);                  
                    sim('model_GT',nb_time_unit_in_a_simulation);
                end
                if tool_id==3
                    mytimer = timer('StartDelay',time_max_for_simulation, 'TimerFcn','set_param("model_socrates", "SimulationCommand", "stop")');
                    start(mytimer)
                    t = cputime;
                    disp("Running simulation for tool Socrates on building with " + nb_rooms +" rooms and a rate of " +rate);                  
                    sim('model_socrates',nb_time_unit_in_a_simulation);
                end
                if tool_id==4
                    mytimer = timer('StartDelay',time_max_for_simulation, 'TimerFcn','set_param("model_S_taliro", "SimulationCommand", "stop")');
                    start(mytimer)
                    t = cputime;
                    disp("Running simulation for tool S-Taliro on building with " + nb_rooms +" rooms and a rate of " +rate);                  
                    sim('model_S_taliro',nb_time_unit_in_a_simulation);
                end
                
                stop(mytimer)
                delete(mytimer)
                
                e = cputime-t;
                result_table(tool_id,nb_rooms,rate_index) = e;
                clear e;
                clear t;                                       
            end
        end
    end
end
    
