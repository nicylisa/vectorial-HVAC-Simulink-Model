

A = readmatrix(path_external_temp_data);

A(:,1)=[];
A = timeseries(A);
AA = getsampleusingtime(A,1,nb_time_unit_in_a_simulation);
filename_A= "Model_files/matlab_format_input_data/external_temperature.mat";
save(filename_A,"AA","-v7.3");

B = readmatrix(path_external_humidity_data);
B(:,1)=[];
B = timeseries(B);
BB = getsampleusingtime(B,1,nb_time_unit_in_a_simulation);
filename_B= "Model_files/matlab_format_input_data/external_humidity.mat";
save(filename_B,"BB","-v7.3");

C = readmatrix(path_human_location_data);
C(:,1)=[];
C = timeseries(C);
filename_C= "Model_files/matlab_format_input_data/huma_locations.mat";
save(filename_C,"C","-v7.3");

clear A;
clear AA;
clear B;
clear BB;
clear C;
clear filename_A;
clear filename_B;
clear filename_C;
clear i;




