
def signal_name_operative_temperature(nb_rooms):
    nb_rooms = int(nb_rooms)
    s = ''
    for i in range(0, nb_rooms-1):
        s = s+'T_'+str(i)+','
    s = s+'T_'+str(nb_rooms-1)
    return s

def formula_operative_temperature(nb_rooms,time_start,time_end):
    nb_rooms = int(nb_rooms)
    time_start = int(time_start)
    time_end = int(time_end)
    r = 'alw_'
    r = r + '['+str(time_start)+','+str(time_end)+']'
    r = r+' ( '

    for i in range(0, nb_rooms-1):
        r = r + ' ('
        r = r + '(T_' + str(i) + '[t]>23.5)'
        r = r + ' and '
        r = r + '(T_' + str(i) + '[t]<26.5)'
        r = r + ') '
        r = r + ' and '

    r = r+' ((T_'+str(nb_rooms-1) + '[t]>23.5) and (T_'+str(nb_rooms-1)+'[t]<26.5))'
    r = r+'  )'
    return r

#######################################################

def signal_name_relative_humidity(nb_rooms):
    nb_rooms = int(nb_rooms)
    hs = ''
    for i in range(0, nb_rooms-1):
        hs = hs+'RH_'+str(i)+','
    hs = hs+'RH_'+str(nb_rooms-1)
    return hs


def formula_relative_humidity(nb_rooms,time_start,time_end):
    nb_rooms = int(nb_rooms)
    time_start = int(time_start)
    time_end = int(time_end)
    rh = 'alw_'
    rh = rh + '['+str(time_start)+','+str(time_end)+']'
    rh = rh+' ( '
    for i in range(0, nb_rooms-1):
        rh = rh + ' ('
        rh = rh + '(RH_' + str(i) + '[t]>0.25)'
        rh = rh + ' and '
        rh = rh + '(RH_' + str(i) + '[t]<0.65)'
        rh = rh + ') '
        rh = rh + ' and '
    rh = rh+' ((RH_'+str(nb_rooms-1) + \
    '[t]>0.25) and (RH_'+str(nb_rooms-1)+'[t]<0.65))'
    rh = rh+'  )'

    return rh


#####################################################

def signal_name_variations(nb_rooms):
    nb_rooms = int(nb_rooms)
    hs = signal_name_operative_temperature(nb_rooms)
    hs = hs + ','
    for i in range(0, nb_rooms-1):
        hs = hs+'v_'+str(i)+','
    hs = hs+'v_'+str(nb_rooms-1)
    return hs


def formula_variations_fifteen_min(nb_rooms,time_start,time_end, nb_timestep_to_fifteen_min):
    nb_rooms = int(nb_rooms)
    time_start = int(time_start)
    time_end = int(time_end)
    nb_timestep_to_fifteen_min = int(nb_timestep_to_fifteen_min)
    rh = 'alw_'
    rh = rh +'['+str(time_start)+','+str(time_end)+']'
    rh = rh + '('
    for i in range(0, nb_rooms - 1):
        rh = rh + ' ('
        rh = rh + ' ('
        rh = rh + '(T_' + str(i) + '[t]>23.5)'
        rh = rh + ' and '
        rh = rh + '(T_' + str(i) + '[t]<26.5)'
        rh = rh + ') '
        rh = rh + '=> '
        rh = rh + '(v_' + str(i) + '[t]<1.1)'
        rh = rh + ')  and '
    rh = rh+' ( ((T_' + str(nb_rooms-1) + '[t]>23.5) and (T_' + str(nb_rooms-1) + '[t]<26.5)) => '
    rh = rh + '(v_' + str(nb_rooms-1) + '[t]<1.1))'
    rh = rh+'  )'
    return rh


####################################################
def formula_variations_thirty_min(nb_rooms, time_start,time_end, nb_timestep_to_thrity_min):
    nb_rooms = int(nb_rooms)
    time_start = int(time_start)
    time_end = int(time_end)
    nb_timestep_to_thrity_min = int(nb_timestep_to_thrity_min)
    rh = 'alw_'
    rh = rh +'['+str(time_start)+','+str(time_end)+']'
    rh = rh+' ( '
    for i in range(0, nb_rooms-1):
        rh = rh + ' ( ('
        rh = rh + '(T_' + str(i) + '[t]>23.5)'
        rh = rh + ' and '
        rh = rh + '(T_' + str(i) + '[t]<26.5)'
        rh = rh + ') '
        rh = rh + '=> '
        rh = rh + '(v_' + str(i) + '[t]<1.7) '
        rh = rh + ')  and '
    rh = rh+' ( ((T_' + str(nb_rooms-1) + '[t]>23.5) and (T_' + str(nb_rooms-1) + '[t]<26.5)) => '
    rh = rh + '(v_' + str(nb_rooms-1) + '[t]<1.7))'
    rh = rh+'  )'

    return rh
####################################################

def formula_variations_oneh(nb_rooms, time_start,time_end, nb_timestep_to_one_h):
    nb_rooms = int(nb_rooms)
    time_start = int(time_start)
    time_end = int(time_end)
    nb_timestep_to_one_h = int(nb_timestep_to_one_h)
    rh = 'alw_'
    rh = rh +'['+str(time_start)+','+str(time_end)+']'
    rh = rh+' ( '
    for i in range(0, nb_rooms-1):
        rh = rh + '( (';
        rh = rh + '(T_' + str(i) + '[t]>23.5)';
        rh = rh + ' and ';
        rh = rh + '(T_' + str(i) + '[t]<26.5)';
        rh = rh + ') ';
        rh = rh + '=> ';         	
        rh = rh + ' (' + 'v_' + str(i) + '[t]<2.2) ';
        rh = rh + ')  and ';
    rh = rh + ' ( ((T_' + str(nb_rooms-1) + '[t]>23.5) and (T_' + str(nb_rooms-1) + '[t]<26.5)) =>'; 	
    rh = rh + '(v_' + str(nb_rooms-1) + '[t]<2.2))';
    rh = rh + '  )';

    return rh

######################################################
def signal_name_outdoor_airflow(nb_rooms):
    nb_rooms = int(nb_rooms)
    hs = ''
    # m_out_i
    for i in range(0,nb_rooms):
        hs = hs + 'm_out_'+str(i)+','

    # area_i
    for i in range(0,nb_rooms):
        hs = hs + 'area_'+str(i)+','
    # nb_hum_i
    for i in range(0,nb_rooms-1):
        hs = hs + 'nb_hum_'+str(i)+','
    hs = hs + 'nb_hum_'+str(nb_rooms-1) 
    return hs


def formula_outdoor_airflow(nb_rooms, time_start,time_end):
    nb_rooms = int(nb_rooms)
    time_start = int(time_start)
    time_end = int(time_end)
    rh = 'alw_'
    rh = rh +'['+str(time_start)+','+str(time_end)+']'
    rh = rh+' ( '
    # first rroom is coridor 
    rh = rh  + '(nb_hum_0[t] < m_out_0[t]) and (area_0[t] < m_out_0[t]) and '
    for i in range(1,nb_rooms-1):
	    rh = rh  + '(nb_hum_'+str(i)+'[t] < m_out_'+str(i)+'[t]) and (area_'+str(i)+' [t]< m_out_'+str(i)+'[t]) and '
    rh = rh + '(nb_hum_'+str(nb_rooms-1)+'[t] < m_out_'+str(nb_rooms-1)+'[t]) and (area_'+str(nb_rooms-1)+'[t] < m_out_'+str(nb_rooms-1)+'[t]) '
    rh = rh + '  )'
    return rh
 





#############################################

#print(formula_variations_oneh(10, 1,50, 10))
#print(" ")
#print(signal_name_variations(5))
#print(formula_outdoor_airflow(4, 1,10))
#print(' ')
#print(signal_name_outdoor_airflow(4))
