% Solve  y'(t)=2t+y with y0 = 1
n = 10;
y0 = 1;
t0 = 0;
h=0.1;
t=[t0 zeros(1, n)];
f = @(t, y) ((2 * t) + y);
yexact = @(t) ((-2) * (t + 1) + (3 * exp(t)));
y = zeros(size(t));
ye = zeros(size(t));

y(1) = y0;
t(1) = t0;
fprintf('%7s %7s %7s %7s \n','i','t(i)','y(i)', 'ye(i)');
for i=1:n
  t(i + 1)=t(i) + h;

  k1 = f(t(i), y(i));
  y1 = y(i) + k1 * h/2;
  t1 = t(i) + (h / 2);

  k2 = f(t1, y1);
  y2 = y(i) + k2 * h/2;
  t2 = t(i) + (h / 2);

  k3 = f(t2, y2);
  y3 = y(i) + k3 * h;
  t3 = t(i) + h;

  k4 = f(t3, y3);

  y(i+1) = y(i) + (k1+2*k2+2*k3+k4)*h/6;
  ye(i) = yexact(t(i));
  fprintf('%7d %7.2f %7.3f %7.3f \n',i, t(i), y(i), ye(i));
end

plot(t, yexact(t), 'g', t, y, 'b-o');
legend('Exact', 'Approximate');
grid on
