name_op_temp = py.script_vector_to_string_for_breach_block.signal_name_operative_temperature(nb_rooms);
name_op_temp = char(name_op_temp);
formula_op_temp = py.script_vector_to_string_for_breach_block.formula_operative_temperature(nb_rooms,1,nb_time_unit_in_a_simulation-1);
formula_op_temp = char(formula_op_temp);

%%
name_rh = py.script_vector_to_string_for_breach_block.signal_name_relative_humidity(nb_rooms);
name_rh = char(name_rh);
formula_rh = py.script_vector_to_string_for_breach_block.formula_relative_humidity(nb_rooms,1,nb_time_unit_in_a_simulation-1);
formula_rh = char(formula_rh);

%%
name_variation = py.script_vector_to_string_for_breach_block.signal_name_variations(nb_rooms);
name_variation = char(name_variation);
formula_fifteen_min_var = py.script_vector_to_string_for_breach_block.formula_variations_fifteen_min(nb_rooms,1, nb_time_unit_in_a_simulation-1, nb_step_to_fifteen_min);
formula_fifteen_min_var = char(formula_fifteen_min_var);
formula_thirty_min_var = py.script_vector_to_string_for_breach_block.formula_variations_thirty_min(nb_rooms,1, nb_time_unit_in_a_simulation-1, nb_step_to_thirty_min);
formula_thirty_min_var = char(formula_thirty_min_var);
formula_one_h_var = py.script_vector_to_string_for_breach_block.formula_variations_oneh(nb_rooms,1, nb_time_unit_in_a_simulation-1, nb_step_to_one_h);
formula_one_h_var = char(formula_one_h_var);

%%
name_out_airflow = py.script_vector_to_string_for_breach_block.signal_name_outdoor_airflow(nb_rooms);
name_out_airflow = char(name_out_airflow);
formula_out_airflow = py.script_vector_to_string_for_breach_block.formula_outdoor_airflow(nb_rooms,1, nb_time_unit_in_a_simulation-1);
formula_out_airflow = char(formula_out_airflow);








