function x_t = F_(t,x)

% 1st case
%A = [2+cos(t) 1-sin(t);-1-cos(t) 2+sin(t)];
%x_t = A*x;

% 2nd case (stable solution)
% x1 = x(1,1);
% y1 = x(2,1);
% a = 0.08;
% b = 0.6;
%
% x_t(1,1) = -x1+a*y1+x1^2*y1;
% x_t(2,1) = b - a*y1 - x1^2*y1;

%3rd case: unstable at r = 2
% x1 = x(1,1);
% y1 = x(2,1);
% x_t(1,1) = x1*(sqrt(x1^2+y1^2)-1)*(sqrt(x1^2+y1^2)-2) - y1;
% x_t(2,1) = y1*(sqrt(x1^2+y1^2)-1)*(sqrt(x1^2+y1^2)-2) + x1;

% Lorentz equation
x1 = x(1,1);
y1 = x(2,1);
z1 = x(3,1);

sigma = 10;
b = 8/3;
r = 28;

f1 = sigma*y1-sigma*x1;
f2 = r*x1 - y1 - x1*z1;
f3 = x1*y1-b*z1;
x_t = [f1;f2;f3];

end