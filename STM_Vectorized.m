function STM_output = STM_Vectorized(T0,X0)

n = length(X0);
I = eye(n,n);

if T0 >0
    tf = T0;
    dt = 0.0001;
    t = 0:dt:tf;
else
    tf = T0;
    dt = 0.0001;
    t = 0:-dt:tf;
end

%Dumm_STM = zeros(n,n);

% for i = 1:n
%     reltol = 1.0e-06; abstol = 1.0e-06;
%     options = odeset('RelTol',reltol,'AbsTol',abstol);
%     %[t,phi] = ode45(@F_,t,I(:,i)); %without jacobian
%     % equation 2 in F_
%     %[t,phi] = ode45(@STM_jacobian_equ2,t,I(:,i),options);
%     % equation 3 in F_
%     %[t,phi] = ode45(@STM_jacobian_equ3,t,I(:,i),options);
%     [t,phi] = ode45(@STM_jacobian_Lorentz,t,I(:,i),options);
%     Dumm_STM(:,i) = phi(end,:)';
% end

reltol = 1.0e-06; abstol = 1.0e-06;
options = odeset('RelTol',reltol,'AbsTol',abstol);
[t,phi] = ode45(@(t,phi) STM_jacobian_Lorentz(t,phi,n),t,I,options);
nt = n*n;


%STM_output = Dumm_STM;
%STM_output = [phi(end,1:nt/n)' phi(end,(nt/n+1):(2*nt/n))' phi(end,((2*nt/n)+1):nt)'];


STM_output = [phi(end,1:nt/n).'];
for k = 1:n-1
    STM_output = cat(2,STM_output,phi(end,((k*nt/n)+1):(k+1)*(nt/n)).');
end

end
