
% Explicit Euler Method with MATLAB
% Equation to solve: y'=t+y; y(0)=1; t=[0,1];

clc, clear all, close all

h=0.1;
n=10;
a=0;
b=1;
t0=0;
y0=1;
f = @(t,y) t+y;
exact = @(t) -t - 1 + 2 * exp(t);

t = a + h * (0:n - 1);
y = zeros(1,length(t));
y(1) = 1; % initial condition

fprintf('%7s %7s %7s \n','i','t(i)','y(i)');
for i=1:1:n
 y(i+1) = y(i) + h * f(t(i), y(i));
 fprintf('%7d %7.2f %7.3f \n',i, t(i), y(i));
end

y(length(t))=[ ];

plot(t, y,'b-o', t, exact(t), 'g')

title('Euler-ODE---Numerical Solution---');
ylabel('y'); xlabel('t');
legend({'Approximate','Exact'},'Location','northwest');

grid on
hold on
hold off

