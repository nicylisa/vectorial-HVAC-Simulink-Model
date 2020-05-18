%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CORIDOR LAYOUT CREATION  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% corridor is first room
% a boiler room is second room
% room number i for i>2 is an office space.



nb_room_without_corridor = nb_rooms-1;
nb_room_without_corridor_and_boiler = nb_rooms -2;

if mod(nb_room_without_corridor,2)==0
    length_corridor = nb_room_without_corridor/2*5;
else
    length_corridor = ((floor(nb_room_without_corridor/2))+1)*5;
end

%
% WALL AREAS with outside
%
area_outdoor_rooms  = zeros(nb_rooms,1);
area_outdoor_rooms(1) = 2*3*2;

for i=2:nb_rooms
    area_outdoor_rooms(i) = 5*3;
end

if nb_room_without_corridor == 1 
    area_outdoor_rooms(2) = (5*3)+(4*3);
end
if nb_room_without_corridor == 2
    area_outdoor_rooms(2) = (5*3)+(4*3);
    area_outdoor_rooms(3) = (5*3)+(4*3);
end
if nb_room_without_corridor >= 3
    area_outdoor_rooms(2) = (5*3)+(4*3); 
    area_outdoor_rooms(3) = (5*3)+(4*3); 
    area_outdoor_rooms(nb_rooms) = (5*3)+(4*3); 
    area_outdoor_rooms(nb_rooms) = (5*3)+(4*3); 
end

%
% WALL AREAS with other rooms
%
area_walls_between_rooms = zeros(nb_rooms,nb_rooms);
for i =2:nb_rooms
    area_walls_between_rooms(1,i) = 5*3;
    area_walls_between_rooms(i,1) = 5*3;
end   
for i =2:nb_rooms
    % left room border
    if i>3
        area_walls_between_rooms(i,i-2) = 4*3;
        area_walls_between_rooms(i-2,i) = 4*3;
    end
    % right room border
    if i<nb_rooms-1
        area_walls_between_rooms(i,i+2) = 4*3;
        area_walls_between_rooms(i+2,i) = 4*3;
    end   
end

%
% VOLUME
%
Volume_rooms = zeros(nb_rooms,1);
Volume_rooms(1)= 2*length_corridor*3;
for i =2:nb_rooms
    Volume_rooms(i) = 4*5*3;
end

area_rooms_ground = Volume_rooms./3;

%
% equipment locations
%
matrix_boiler_rooms_locations = zeros(nb_boilers,nb_rooms);
matrix_boiler_rooms_locations(1,2) = 1;
matrix_boiler_rooms_locations(2,3) = 1;

matrix_radiator_rooms_locations = zeros(nb_radiators,nb_room_without_corridor);
for i =2:nb_radiators
    matrix_radiator_rooms_locations(i,i+2) =1;
end

matrix_AC_rooms_locations =  zeros(nb_air_cons,nb_room_without_corridor);
for i =1:nb_air_cons  
    matrix_AC_rooms_locations(i,i+2) =1;
end

matrix_boiler_radiator_connection = zeros(nb_boilers,nb_radiators);
for i =1:nb_radiators
   if mod(i,2)==0
       matrix_boiler_radiator_connection (1,i) = 1; 
   else
       matrix_boiler_radiator_connection (2,i) = 1; 
   end
end

%
% other easy parameters (unchanged from base version)
%
air_mass_kg_rooms = Volume_rooms(i)*1.225;
thickness_walls_between_rooms= ones(nb_rooms,nb_rooms)*0.08 ; %metters
thickness_outdoor_rooms = ones(nb_rooms,1)*0.08 ; 
k_wall_outdoor_rooms =  ones(nb_rooms,1)*0.3; 		% Joul/(second*metter*Kalvin) alternatively Watts/(metter*Kalvin)
k_walls_between_rooms =  ones(nb_rooms,nb_rooms)*0.3; 

%
% CLEAR USELESS DATA
%
clear i
clear nb_AC
clear nb_radiator
clear nb_room_without_corridor
clear nb_room_with_corridor
clear length_corridor
