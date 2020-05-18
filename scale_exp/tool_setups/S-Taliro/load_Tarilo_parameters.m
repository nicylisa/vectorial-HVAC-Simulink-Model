% This demo runs five on-line monitors for five MTL formulas

% %temperature
ii=1;
preds(ii).str = 'p1';
preds(ii).A = eye(nb_rooms);
preds(ii).b = 26.5*ones(nb_rooms,1);
ii=2;
preds(ii).str = 'p2';
preds(ii).A = -1*eye(nb_rooms);
preds(ii).b = -23.5*ones(nb_rooms,1);

stalPhiRoom='[]_[1, 287]( p1 /\ p2) ';

% %humidity
hh=1;
preds1(hh).str = 'h1';
preds1(hh).A = eye(nb_rooms);
preds1(hh).b = 0.65*ones(nb_rooms,1);
hh=2;
preds1(hh).str = 'h2';
preds1(hh).A = -1*eye(nb_rooms);
preds1(hh).b = -0.25*ones(nb_rooms,1);

stalPhih='[]_[1, 287]( h1 /\h2) ';

% %var15
vv=1;
preds2(vv).str = 'v1';
preds2(vv).A = [[eye(nb_rooms) zeros(nb_rooms,nb_rooms)];zeros(nb_rooms,nb_rooms*2)];
preds2(vv).b = [26.5*ones(nb_rooms,1);zeros(nb_rooms,1)];
vv=2;
preds2(vv).str = 'v2';
preds2(vv).A = -1*[[eye(nb_rooms) zeros(nb_rooms,nb_rooms)];zeros(nb_rooms,nb_rooms*2)];
preds2(vv).b = [-23.5*ones(nb_rooms,1);zeros(nb_rooms,1)];
vv=3;
preds2(vv).str = 'v3';
preds2(vv).A = [zeros(nb_rooms,nb_rooms*2);[zeros(nb_rooms,nb_rooms) eye(nb_rooms)]];
preds2(vv).b =[zeros(nb_rooms,1);1.1*ones(nb_rooms,1)];
stalPhi15='[]_[1, 287]( (v1 /\ v2) -> v3) ';
% %var30
vv=1;
preds3(vv).str = 'vv1';
preds3(vv).A = [[eye(nb_rooms) zeros(nb_rooms,nb_rooms)];zeros(nb_rooms,nb_rooms*2)];
preds3(vv).b = [26.5*ones(nb_rooms,1);zeros(nb_rooms,1)];
vv=2;
preds3(vv).str = 'vv2';
preds3(vv).A = -1*[[eye(nb_rooms) zeros(nb_rooms,nb_rooms)];zeros(nb_rooms,nb_rooms*2)];
preds3(vv).b = [-23.5*ones(nb_rooms,1);zeros(nb_rooms,1)];
vv=3;
preds3(vv).str = 'vv3';
preds3(vv).A = [zeros(nb_rooms,nb_rooms*2);[zeros(nb_rooms,nb_rooms) eye(nb_rooms)]];
preds3(vv).b =[zeros(nb_rooms,1);1.7*ones(nb_rooms,1)];
stalPhi30='[]_[1, 287]( (vv1 /\ vv2) -> vv3) ';

% %var1h
vv=1;
preds4(vv).str = 'vvv1';
preds4(vv).A = [[eye(nb_rooms) zeros(nb_rooms,nb_rooms)];zeros(nb_rooms,nb_rooms*2)];
preds4(vv).b =[26.5*ones(nb_rooms,1);zeros(nb_rooms,1)];
vv=2;
preds4(vv).str = 'vvv2';
preds4(vv).A = -1*[[eye(nb_rooms) zeros(nb_rooms,nb_rooms)];zeros(nb_rooms,nb_rooms*2)];
preds4(vv).b = [-23.5*ones(nb_rooms,1);zeros(nb_rooms,1)];
vv=3;
preds4(vv).str = 'vvv3';
preds4(vv).A = [zeros(nb_rooms,nb_rooms*2);[zeros(nb_rooms,nb_rooms) eye(nb_rooms)]];
preds4(vv).b =[zeros(nb_rooms,1);2.2*ones(nb_rooms,1)];
stalPhi1h='[]_[1, 287]( (vvv1 /\ vvv2) -> vvv3) ';

% %airflow
vv=1;
preds5(vv).str = 'a1';
preds5(vv).A =  [eye(nb_rooms) -eye(nb_rooms) zeros(nb_rooms,nb_rooms)];
preds5(vv).b = zeros(nb_rooms,1);
vv=2;
preds5(vv).str = 'a2';
preds5(vv).A =  [eye(nb_rooms) zeros(nb_rooms,nb_rooms) -eye(nb_rooms)];
preds5(vv).b = zeros(nb_rooms,1);
stalPhiairflow='[]_[1, 287]( a1 /\ a2) ';

