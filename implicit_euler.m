% Backward Euler's method
 f = @(t, y) -(y^2);
exact = @(t) (1 / (t + 1));
 a = 0;
 b = 5;
 n = 10;
 y0 = 1;

 h = (b-a)/n;
 t=[a zeros(1, n)];
 y=[y0 zeros(1, n)];
 yex=[length(t)];

 for i = 1:n+1
   t(i+1)= t(i) + h;
   yprime = y(i) + h * f(t(i), y(i));
   y(i+1)= y(i) + h * f(t(i+1), yprime);
   fprintf('%5.4f  %11.8f\n', t(i), y(i));
   yex(i) = exact(t(i));
 end

plot(t, y,'b-o', t, yex, 'g');
title('Euler-Explicit-Method---Numerical Solution---');
xlabel('t');
ylabel('y');
legend({'Approximate','Exact'},'Location','northwest');
grid on;
hold on;
