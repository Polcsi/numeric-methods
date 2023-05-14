% Explicit Euler Módszer
% y'(t)=(2 * t) + y diff. egyenlet megoldása y(0) = 1, h = 0.1, b = 0.4

clc, clear all, close all

n = input("Adja meg az iterációk számát: ") - 1;          % Iterációk száma
input_h = input("Adja meg a lépés méretet: ");           % lépés mérete
t0 = input("Adja meg a t0 kezdő értékét: ");         % t0 értéke
y0 = input("Adja meg a y0 kezdő értékét: ");         % y0 értéke
b = input("Adja meg az intervalum végét: ");     % Intervalum vége
f_inner = input("Adja meg a függvényt: ", "s");   % függvény bekérése
f = str2func(['@(t, y)', f_inner]); % függvény paraméter átalakítása propgramozási függvényre
a = t0;                                   % Intervalum kezdő értékének beállítása                  % függvény meghatározása
exact = @(t) ((-2) * (t + 1) + (3 * exp(t)));   % függvény egzakt megoldása

if !isempty(input_h)          % h paraméter ellenőrzése, hogy megvan-e adva
  h = input_h;                % h változó beállítása, ha megvan adva
else
  h = (b - a) / n;            % lépés mértékének kiszámolása, ha nincs megadva
endif
t=[a zeros(1, n)];            % t tömb feltöltése nullákkal
y=[length(t)];                % y tömb hosszának megadása
ye=[length(t)];               % ye egzakt megoldásnak töm létrehozása
y(1) = y0;                    % y tömb első elemének megadása
t(1) = t0;                    % t tömb első elemének megadása
ye(1) = y0;                   % ye egzakt tömb első elemének beállítása

fprintf('%7s %7s %7s %7s \n','i','t(i)','y(i)', 'ye(i)'); % fejléc kiírása
for i=1:1:n + 1                              % for ciklus 1-től n + 1-ig
  if i <= n                       % túlcsordulás megakadályozása
     t(i + 1)=t(i) + h;           % t elemek kiszámolása
  endif
  if i != 1                       % az első elemet már inicializáltuk
    y(i)=y(i - 1)+ h * f(t(i - 1), y(i - 1)); % Explicit euler módszer képlete
    ye(i)=exact(t(i));        % egzakt megoldás kiszámítása ti pontban
  endif
  fprintf('%7d %7.2f %7.3f %7.3f \n',i, t(i), y(i), ye(i)); % Aktuális elem kiírása
end;

% Gráf készítése a becsült és egzakt függvényről
plot(t, y, 'b-o', t, exact(t), 'g');
title('Explicit Euler Módszer');
ylabel('y'); xlabel('t');
legend({'Közelítő','Egzakt'},'Location','northwest');
grid on

hold on
hold off


