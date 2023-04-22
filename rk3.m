% Rk3 Módszer
% y'(t)=2t+y diff. egyenlet megoldása y(0) = 1, h = 0.1, b = 0.4

n = 5; % Iteráció hossza
y0 = 1; % y0 értéke
t0 = 0; % t0 értéke
h = 0.1; % lépés mérete
f = @(t, y) (2 * t) + y; % függvény meghatározása
yexact = @(t) ((-2) * (t + 1) + (3 * exp(t))); % egzakt függvény meghatározása
t=[t0 zeros(1, n)]; % t tömb feltöltése nullákkal
y = zeros(size(t)); % y tömb feltöltése nullákkal
ye = zeros(size(t)); % ye tömb feltöltése nullákkal(egzakt megoldáshoz)

y(1) = y0; % y tömb első elemének inicializálása
t(1) = t0; % t tömb első elemének inicializálása
fprintf('%7s %7s %7s %7s \n','i','t(i)','y(i)', 'ye(i)'); % fejléc kiíratása
for i=1:n
  % Rk3 módszer megoldása:
  % k1 = f (ti, yi)
  % k2 = f (ti + h, yi + hk1)
  % k3 = f (ti + h/2, yi + (h/2) (k1+k2) /2)
  % y1 = yi + [(k1 + k2 + 4k3) /6] *h

  t(i + 1)=t(i) + h;

  k1 = f(t(i), y(i));
  y1 = y(i) + h * k1;
  t1 = t(i) + h;

  k2 = f(t1, y1);
  y2 = y(i) + (h / 2)*(k1 + k2)/2;
  t2 = t(i) + (h / 2);

  k3 = f(t2, y2);

  y(i+1) = y(i) + (k1 + k2 + (4 * k3)) * h / 6;
  ye(i) = yexact(t(i)); % egzakt függvény kiszámolása a t(i) pontban
  fprintf('%7d %7.2f %7.3f %7.3f \n',i, t(i), y(i), ye(i)); % iteráció eredményeinek kiírása
end

% függvények ábrázolása
plot(t, yexact(t), 'g', t, y, 'b-o');
legend('Exact', 'Approximate');
grid on
