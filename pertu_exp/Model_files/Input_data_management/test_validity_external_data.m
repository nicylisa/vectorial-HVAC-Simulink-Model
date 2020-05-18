function err = test_validity_external_data(filepath_temp, filepath_humidity, nb_time_unit_in_a_simulation)

% first line is not read as it has no number
A = readmatrix(filepath_temp);
nA = size(A,1);
B = readmatrix(filepath_humidity);
nB = size(B,1);
err=0;

%
disp(" ")
disp("---------------------------------")
disp("---- CHECKING EXTERNAL DATA -----")
disp("---------------------------------")
disp(" ")
disp("--- TEMPERATURE")


if nA < nb_time_unit_in_a_simulation
    disp("There is more simulation step than there is temperature data")
    disp("SIMULATION WILL ENCOUNTER A PROBLEM")
    err=1;
    return
else
    if (nA > nb_time_unit_in_a_simulation)
        disp("There is more temperature data than there is simulations steps. The additional data will not be used, but the simulation can happen.")
    end
    list_errors = []; 
    for i  = 1: nb_time_unit_in_a_simulation
        if not(isnumeric(A(i,2))) | isnan(A(i,2))
            list_errors = [list_errors,i];
            err = 1;
        end
    end
    if err ==1
        s="";
        for i =1:size(list_errors)
            if i== size(list_errors)
                s= s + list_errors(i) +".";
            else
                s=s+list_errors(i)+", ";
            end
        end
        disp("there are errors on lines: "+s);
        return
    else
        disp("All data entries are okay.");
    end
end

disp(" ")
disp("--- HUMIDITY")

if nB < nb_time_unit_in_a_simulation
    disp("There is more simulation step than there is humidity data")
    disp("SIMULATION WILL ENCOUNTER A PROBLEM")
    err =1;
    return
else
    if (nB > nb_time_unit_in_a_simulation)
        disp("There is more humidity data than there is simulations steps. The additional data will not be used, but the simulation can happen.")
    end
    list_errors = []; err=0;
    for i  = 1: nb_time_unit_in_a_simulation
        if not(isnumeric(B(i,2))) | isnan(B(i,2))
            list_errors = [list_errors,i];
            err = 1;
        end
    end
    if err ==1
        s="";
        for i =1:size(list_errors)
            if i== size(list_errors)
                s= s + list_errors(i) +".";
            else
                s=s+list_errors(i)+", ";
            end
        end
        disp("there are errors on lines: "+s);
        err = 1;
        return
    else
        disp("All data entries are okay.");
    end
end
disp(" ")