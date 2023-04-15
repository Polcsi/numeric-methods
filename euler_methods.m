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
% implicit variables
t=[a zeros(1, n)];
y=[length(t)];
y(1) = y0;
t(1) = t0;
% explicit variables
et=[a zeros(1, n)];
ey=[length(t)];
et(1) = t0;
ey(1) = y0;

fprintf("========================\n");
% explicit method
fprintf("Explicit Euler Method:\n");
fprintf('%7s %7s %7s \n','i','t(i)','y(i)');
for i=1:1:n + 1
  if i <= n
     et(i + 1)=et(i) + h;
  endif
  if i != 1
    ey(i)=ey(i - 1)+ h * f(et(i - 1),ey(i - 1));
  endif
  fprintf('%7d %7.2f %7.3f \n',i, et(i), ey(i));
end;

%implicit method
fprintf("\nImplicit Euler Method:\n");
fprintf('%7s %7s %7s \n','i','t(i)','y(i)');
fprintf('%7d %7.2f %7.3f \n', 1, t0, y0);
for i=1:1:n
  t(i + 1)=t(i) + h;
  ye = y(i) + h * f(t(i), y(i));

  y(i + 1)=y(i)+ h * f(t(i + 1), ye);
  fprintf('%7d %7.2f %7.3f \n',i + 1, t(i + 1), y(i + 1));
end;

plot(et, ey, 'b-o', t, y, 'r-o', t, exact(t), 'g');
title('Explicit Euler Method');
ylabel('y'); xlabel('t');
legend({'Explicit','Implicit','Exact'},'Location','northwest');
grid on

hold on
hold off


