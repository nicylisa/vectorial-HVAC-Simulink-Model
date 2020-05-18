function err = test_validity_human_location_data(path_to_data, nb_humans, nb_time_unit_in_a_simulation)

A = readmatrix(path_to_data);
err=0;

%
disp("--- HUMAN LOCATION DATA")


if size(A,2) < (nb_humans+1)
    disp("There are more humans in the model than in the data")
    disp("SIMULATION WILL ENCOUNTER A PROBLEM")
    err=1;
    return
end
if size(A,1) < nb_time_unit_in_a_simulation
    disp("There are more simulation steps than there is data entries lines")
    disp("SIMULATION WILL ENCOUNTER A PROBLEM")
    err=1;
    return
end  
if size(A,2) > (nb_humans+1)
    disp("There are more humans in the data than in the model. The simulation ignores the extra data.")
end
if size(A,1) > nb_time_unit_in_a_simulation
    disp("There are more lines in the data than there are simulations steps. The simulation ignores the extra data.")
end

list_errors = []; 
for i  = 1:nb_time_unit_in_a_simulation
    for j = 2:(nb_humans+1)
        if isnan(A(i,j)) | not(floor(A(i,j))== A(i,j)) 
            list_errors = [list_errors,[i;j]];
            err = 1;
        end
    end
end
if err ==1

    s="";
    for i =1:size(list_errors,2)
        if i== size(list_errors,2)
            s= s +"("+list_errors(i,1)+","+list_errors(i,1)+")"+".";
        else
            s=s+"("+list_errors(i,1)+" "+list_errors(i,1)+")"+",";
        end
    end
    disp("there are errors on lines/columns: "+s);
    return
else
    disp("All data entries are okay.");
end

disp(" ")

