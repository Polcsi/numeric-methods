
% Implicit Euler Method with MATLAB
% Equation to solve: y'=t+y; y(0)=1; t=[0,1];

clc, clear all, close all

n=10;
a=0;
b=1;
t0=0;
y0=1;
h = (b - t0) / n;
f = @(t,y) t+y;
exact = @(t) -t - 1 + 2 * exp(t);

t = a:h:b;
y = zeros(1, length(t));
y(1) = y0;

fprintf('%7s %7s %7s \n','i','t(i)','y(i)');
for i=1:1:n
 y(i+1) = y(i) + h * f(t(i+1), y(i+1));
 fprintf('%7d %7.2f %7.3f \n',i, t(i), y(i));
end

plot(t, y,'b-o', t, exact(t), 'g')

title('Euler-ODE---Numerical Solution---');
ylabel('y'); xlabel('t');
legend({'Approximate','Exact'},'Location','northwest');

grid on
hold on
hold off

