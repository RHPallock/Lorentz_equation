clear all;
format long
global x_init 
% Initial guess


% AB Periodic orbit
%X0 = [-13.5;-19.2;27];

% AAB periodic orbit
%X0 = [-12.4;-16.8;27];


% AAABB Periodic orbit
X0 = [-12;-15.6;27];


% T guess for 2nd equation
%T0 = 9.60;

% T guess for AB PO
%T0 =  1.5;

% T guess for AAB PO
%T0 = 2.32;

% T guess for AAABB PO
T0 =  3.02;



flag = 0;
n = length(X0);
iter = 1;
err(1) = 10;

% Algorithm
while err >1e-10
    x_init = X0;

    a = STM_Vectorized(T0,X0,length(X0)) - eye(n,n);
    b = F_(T0,Phi(T0,X0));
    c = transpose(F_(0,X0));
    d = 0;

    A = [a b;c d];

    b1_l = -Phi(T0,X0) + X0;
    b2_l = 0;
    B = [b1_l;b2_l];

    Delta = A\B;
    %err(iter) = max(abs(Delta(1:end-1,1)));
    err(iter) = max(abs(-Phi(T0,X0) + X0));
    disp("error = ")
    disp(err(iter))
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
end
if flag ==0
    disp("Solution found")
end
disp('error')
disp(err)
disp('Time period')
disp(T0)
disp(X0)

