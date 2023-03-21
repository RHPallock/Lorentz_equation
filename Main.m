clear all;


global x_init Traj_time Guess_traj
% Initial guess

% 2nd equation:
%X0 = [0.22;1.25];
%X0 = [0.2096;1.3198];

% 3rd equation
%X0 = [-13.76361;-19.57875;27];

% AB Periodic orbit
X0 = [-13.5;-19.2;27];

% AAB periodic orbit
%X0 = [-12.4;-16.8;27];


% T guess for 2nd equation
%T0 = 9.60;

% T guess for AB PO
T0 = 1.5;

% T guess for AAB PO
%T0 = 2.32;

% test Phi by running X0 over T0 = 2*pi and same vector should appear
% Phi(T0,X0);
% test F_ by running a time dependent simulation
% test STM by using HW 8 from advanced dynamical system course

flag = 0;
n = length(X0);
iter = 1;
err(1) = 10;
%STM_perm = STM(T0,X0);
% Algorithm
while err >1e-2
    x_init = X0;

    % Guess trajectory
    if T0 >0
        tf = T0;
        dt = 0.0001;
        t = 0:dt:tf;
    else
        tf = T0;
        dt = 0.0001;
        t = 0:-dt:tf;
    end
    reltol = 1.0e-06; abstol = 1.0e-06;
    options = odeset('RelTol',reltol,'AbsTol',abstol);
    [Traj_time,Guess_traj] = ode45(@F_,t,X0,options);

    a = STM_Vectorized(T0,X0) - eye(n,n);
    b = F_(T0,Phi(T0,X0));
    c = transpose(F_(T0,X0));
    d = 0;

    A = [a b;c d];

    b1_l = -Phi(T0,X0) + X0;
    b2_l = 0;
    B = [b1_l;b2_l];

    Delta = A\B;
    %err(iter) = max(abs(Delta(1:end-1,1)));
    err(iter) = max(abs(-Phi(T0,X0) + X0));
    X0 = X0 + Delta(1:end-1,1)
    T0 = T0 + Delta(end,1)
    %if iter > 20 && err(iter) > 100
    %    X0 = Phi(-T0,X0)
    %end
    if  err(iter) > 10000 || iter > 150
        disp("50 iterations reached")
        flag = 1;
        break;
    end
    if T0<0
        disp('Period is negative');
        break;
    end
    iter = iter + 1
    %scatter(X0(1,1),X0(2,1))
    %hold on;
end
if flag ==0
    disp("Solution found")
end
disp('error')
disp(err)
disp('Time period')
disp(T0)
disp(X0)

