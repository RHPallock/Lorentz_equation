clear all;

% Initial condition
%X0 = [0.3583;1.3597];
%X0 = [0.2958;1.2498];
%X0 = [1.3467;0.4056];
%X0 = [0.2948;1.2605];
%X0 = [-13.7451;-19.5804;26.9363];

X0 = [-11.998477795349107;-15.684258645516412;26.999856614816636];

% AAB PO
%X0 = [-12.5784;-16.9705;26.9474];


% AB PO
%T0 = 3.820254163498718;

% AAB PO

%T0 = -6.3029;

%AAAB PO
T0 =3.023583703482913;

if T0 > 0
    dt = 0.001;
    t = 0:dt:T0;
else
    dt = 0.001;
    t = 0:-dt:T0;
end

reltol = 1.0e-06; abstol = 1.0e-06;
options = odeset('RelTol',reltol,'AbsTol',abstol);
[t,x] = ode45(@F_,t,X0,options);

 T = linspace(0,100,100/dt+1)';
 %for t = 1:10:100/dt
 a = 20000;
 plot3(x(:,1),x(:,2),x(:,3));
 hold on;
 x = Phi(T0,X0);
 scatter3(x(1,1),x(2,1),x(3,1));
 hold off;

%1plot(x(9030:10000,1),x(9030:10000,2));
%    pause(0.1)
%end
