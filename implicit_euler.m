clc, clear all, close all

%n = input("Enter iteration length: ");
%input_h = input("Enter step size: ");
%t0 = input("Enter t0 initial value: ");
%y0 = input("Enter y0 initial value: ");
%b = input("Enter end of interval value: ");
n = 5;
input_h = 0.1;
t0 = 0;
y0 = 1;
b = 1;
a = t0;
if !isempty(input_h)
  h = input_h;
else
  h = ( b - a) / n;
endif

backward_euler_residual = @ ( f, to, yo, tp, yp ) yp - yo - ( tp - to ) * ( f ( tp, yp ) )';
tspan = [0.0 1];
f = @(t, y) (2 * t) + y;
exact = @(t) ((-2) * (t + 1) + (3 * exp(t)));
m = length ( y0 );
t = zeros ( n + 1, 1 );
y = zeros ( n + 1, m );
ye = zeros( n + 1, m);

t(1,1) = tspan(1);
y(1,:) = y0(:);
ye(1,:) = y0(:);

fprintf('%7s %7s %7s %7s \n','i','t(i)','y(i)', 'ye(i)');
fprintf('%7d %7.2f %7.3f %7.3f \n', 1, tspan(1), y0, y0);
for i = 1 : n

   to = t(i,1);
   yo = y(i,:);
   tp = to + h;
   yp = yo + h * f ( to, yo )';

   yp = fsolve ( @(yp)backward_euler_residual(f, to, yo, tp, yp), yp );

   t(i+1,1) = tp;
   y(i+1,:) = yp;
   ye(i + 1, :) = exact(t(i + 1, 1));
   fprintf('%7d %7.2f %7.3f %7.3f \n',i + 1, t(i + 1), y(i + 1), ye(i + 1));
end


plot(t, y, 'b-o', t, exact(t), 'g');
title('Implicit Euler Method');
ylabel('y'); xlabel('t');
legend({'Approximate','Exact'},'Location','northwest');
grid on

hold on
hold off
