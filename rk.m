% Solve  y'(t)=2t+y with y0 = 1
n = 5;
y0 = 1;
t0 = 0;
h = 0.1;
t=[t0 zeros(1, n)];
f = @(t, y) (2 * t) + y;
yexact = @(t) ((-2) * (t + 1) + (3 * exp(t)));
y = zeros(size(t));
ye = zeros(size(t));

y(1) = y0;
t(1) = t0;
fprintf('%7s %7s %7s %7s \n','i','t(i)','y(i)', 'ye(i)');
for i = 1:n
  t(i + 1)=t(i) + h;

  k1 = f(t(i), y(i));

  y(i+1) = y(i) + h * k1;
  ye(i) = yexact(t(i));
  fprintf('%7d %7.2f %7.3f %7.3f \n',i, t(i), y(i), ye(i));
end

plot(t, yexact(t), 'g', t, y, 'b-o');
grid on
legend('Exact', 'Approximate')



