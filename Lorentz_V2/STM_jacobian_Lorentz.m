function x_t = STM_jacobian_Lorentz(T0,X0,n)
global x_init Traj_time Guess_traj


%First n number of variables are for the RHS.
x1_ = X0(1:n);
x2_ = X0(n+1:n^2+n);

% RHS of the dot equation
sigma = 10;
b = 8/3;
r = 28;

x1 = x1_(1,1);
y1 = x1_(2,1);
z1 = x1_(3,1);

f1 = sigma*y1-sigma*x1;
f2 = r*x1 - y1 - x1*z1;
f3 = x1*y1-b*z1;

x_t(1:n,1) = [f1;f2;f3];
% ---------------------------

%x_guess = interp1(Traj_time,Guess_traj,T0,'linear');

% Required for vectorization: Converts 9x1 vector to 3x3 matrix in this
% case
x2_ = reshape(x2_,[],n);

x = x1_(1,1);
y = x1_(2,1);
z = x1_(3,1);

sigma = 10;
b = 8/3;
r = 28;

A = [-sigma sigma 0;r-z -1 -x;y x -b];

% Vectorized format
y_t = A*x2_;
y_t = y_t(:);
x_t = cat(1,x_t,y_t);
%x_t = x_t(:);

% With for loop initial conditions
%x_t = A*X0;
end