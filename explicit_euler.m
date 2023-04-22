% Explicit Euler Módszer
% y'(t)=2t+y diff. egyenlet megoldása y(0) = 1, h = 0.1, b = 0.4

clc, clear all, close all

n = input("Enter iteration length: ");          % Iterációk száma
input_h = input("Enter step size: ");           % lépés mérete
t0 = input("Enter t0 initial value: ");         % t0 értéke
y0 = input("Enter y0 initial value: ");         % y0 értéke
b = input("Enter end of interval value: ");     % Intervalum vége
a = t0;                                   % Intervalum kezdő értékének beállítása
f = @(t, y) (2 * t) + y;                      % függvény meghatározása
exact = @(t) ((-2) * (t + 1) + (3 * exp(t)));   % függvény egzakt megoldása

if !isempty(input_h)          % h paraméter ellenőrzése, hogy megvan-e adva
  h = input_h;                % h változó beállítása, ha megvan adva
else
  h = (b - a) / n;            % lépés mértékének kiszámolása, ha nincs megadva
endif
t=[a zeros(1, n)];            % t tömb feltöltése nullákkal
y=[length(t)];                % y tömb hosszának megadása
y(1) = y0;                    % y tömb első elemének megadása
t(1) = t0;                    % t tömb első elemének megadása

fprintf('%7s %7s %7s \n','i','t(i)','y(i)'); % fejléc kiírása
for i=1:1:n + 1                              % for ciklus 1-től n + 1-ig
  if i <= n                       % túlcsordulás megakadályozása
     t(i + 1)=t(i) + h;           % t elemek kiszámolása
  endif
  if i != 1                       % az első elemet már inicializáltuk
    y(i)=y(i - 1)+ h * f(t(i - 1), y(i - 1)); % Explicit euler módszer képlete
  endif
  fprintf('%7d %7.2f %7.3f \n',i, t(i), y(i)); % Aktuális elem kiírása
end;

% Gráf készítése a becsült és egzakt függvényről
plot(t, y, 'b-o', t, exact(t), 'g');
title('Explicit Euler Method');
ylabel('y'); xlabel('t');
legend({'Approximate','Exact'},'Location','northwest');
grid on

hold on
hold off


