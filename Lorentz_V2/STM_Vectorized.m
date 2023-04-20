function STM_output = STM_Vectorized(T0,X0,n)

%n = length(X0);
I = eye(n,n);

% Initial condition with EYE matrix
I = I(:);
I = cat(1,X0,I);



reltol = 1.0e-10; abstol = 1.0e-10;
options = odeset('RelTol',reltol,'AbsTol',abstol);
[t,phi] = ode45(@(t,phi) STM_jacobian_Lorentz(t,phi,n),[0,T0],I,options);
nt = n*n;
phi(:,1:n) = [];




STM_output = [phi(end,1:nt/n).'];
for k = 1:n-1
    STM_output = cat(2,STM_output,phi(end,((k*nt/n)+1):(k+1)*(nt/n)).');
end

end
