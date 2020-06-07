function okay = check_and_load_external_data(nb_time_unit_in_a_simulation,nb_humans)

    % check external temperature and humidity data validity
    path_external_temp_data = "external_data/temperature_data.csv";
    path_external_humidity_data = "external_data/humidity_data.csv";

    addpath("Model_files/Input_data_management");  %DO NOT TOUCH
    err_external_data = test_validity_external_data(path_external_temp_data, path_external_humidity_data, nb_time_unit_in_a_simulation);  %DO NOT TOUCH

    if err_external_data == 0
        % check human location data validity 
        path_human_location_data = "external_data/data_human_locations.csv";
        err_human_data =  test_validity_human_location_data(path_human_location_data,nb_humans,nb_time_unit_in_a_simulation) ; %DO NOT TOUCH
   
        if err_human_data ==0
            okay = 1;
        else
            okay = 0;
        end
    else
        okay = 0;
    end
    
    % Format data to matlab files in order to speed up the simulations
    run("format_external_data");
    run("format_human_location_data");
    
    % clear temp data
    clear path_external_temp_data; %DO NO TOUCH
    clear path_external_humidity_data; %DO NOT TOUCH
    clear path_human_location_data; %DO NOT TOUCH
    clear err_external_data; %DO NOT TOUCH
    clear err_human_data; %DO NOT TOUCH    
end

   
   
