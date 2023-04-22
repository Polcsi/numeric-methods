% Implicit Euler Módszer
% y'(t)=2t+y diff. egyenlet megoldása y(0) = 1, h = 0.1, b = 0.4

clc, clear all, close all

n = input("Enter iteration length: ");          % Iterációk száma
input_h = input("Enter step size: ");           % lépés mérete
t0 = input("Enter t0 initial value: ");         % t0 értéke
y0 = input("Enter y0 initial value: ");         % y0 értéke
b = input("Enter end of interval value: ");     % Intervalum vége
a = t0;                                   % Intervalum kezdő értékének beállítása
if !isempty(input_h)          % h paraméter ellenőrzése, hogy megvan-e adva
  h = input_h;                % h változó beállítása, ha megvan adva
else
  h = (b - a) / n;            % lépés mértékének kiszámolása, ha nincs megadva
endif

% Nemlineáris egyenletrendszer
backward_euler = @ ( f, to, yo, tp, yp ) yp - yo - ( tp - to ) * ( f ( tp, yp ) )';
f = @(t, y) (2 * t) + y; % függvény meghatározása
exact = @(t) ((-2) * (t + 1) + (3 * exp(t))); % függvény egzakt megoldása
m = length ( y0 );
t = zeros ( n + 1, 1 ); % t tömb feltöltése nullákkal
y = zeros ( n + 1, m ); % y tömb feltöltése nullákkal
ye = zeros( n + 1, m); % ye(egzakt megoldáshoz) tömb feltöltése nullákkal

% tömbök első elmeinek beállítása
t(1,1) = t0(:);
y(1,:) = y0(:);
ye(1,:) = y0(:);

fprintf('%7s %7s %7s %7s \n','i','t(i)','y(i)', 'ye(i)'); % fejléc kiírása
fprintf('%7d %7.2f %7.3f %7.3f \n', 1, t0(:), y0, y0); % első iteráció kiírása
for i = 1 : n

   to = t(i,1);
   yo = y(i,:);
   tp = to + h;
   yp = yo + h * f ( to, yo )';

   % Nemlineáris egyenletrendszer megoldása
   yp = fsolve ( @(yp)backward_euler(f, to, yo, tp, yp), yp );

   t(i+1,1) = tp; % Tároljuk a t tömben a kiszámolt idő értékét
   y(i+1,:) = yp; % tároljuk a y tömben a megoldott egyenlet rendszert
   ye(i + 1, :) = exact(t(i + 1, 1)); % egzakt függvény kiszámolása a t(i) pontban
   fprintf('%7d %7.2f %7.3f %7.3f \n',i + 1, t(i + 1), y(i + 1), ye(i + 1)); % aktuális pontok kiíratása
end

% Gráf készítése a becsült és egzakt függvényről
plot(t, y, 'b-o', t, exact(t), 'g');
title('Implicit Euler Method');
ylabel('y'); xlabel('t');
legend({'Approximate','Exact'},'Location','northwest');
grid on

hold on
hold off
