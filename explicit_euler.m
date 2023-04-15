clc, clear all, close all

n = input("Enter iteration length: ");
input_h = input("Enter step size: ");
t0 = input("Enter t0 initial value: ");
y0 = input("Enter y0 initial value: ");
b = input("Enter end of interval value: ");
a = t0;
f = @(t, y) (2 * t) + y;
exact = @(t) ((-2) * (t + 1) + (3 * exp(t)));
if !isempty(input_h)
  h = input_h;
else
  h=(b - a) / n;
endif
t=[a zeros(1, n)];
y=[length(t)];
y(1) = y0;

fprintf('%7s %7s %7s \n','i','t(i)','y(i)');
for i=1:1:n + 1
  if i <= n
     t(i + 1)=t(i) + h;
  endif
  if i != 1
    y(i)=y(i - 1)+ h * f(t(i - 1),y(i - 1));
  endif
  fprintf('%7d %7.2f %7.3f \n',i, t(i), y(i));
end;

plot(t, y, 'b-o', t, exact(t), 'g');
title('Explicit Euler Method');
ylabel('y'); xlabel('t');
legend({'Approximate','Exact'},'Location','northwest');
grid on

hold on
hold off


