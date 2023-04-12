% Implicit Euler módszer a differenciálegyenletek megoldására
% bemenetek:
%   f: A differenciálegyenlet jobb oldali oldala, egy függvénytábla
%   tspan: Az időintervallum, ahol a megoldást keresjük, [t0, tf]
%   y0: Az kezdeti érték
%   N: A lépésszám
% kimenetek:
%   t: Az időpontok vektora, ahol a megoldás értékeit számítjuk ki
%   y: A megoldás vektora az időponthoz tartozó értékeken
% Az időpontok kiszámítása
N=10;
t0 = 0; % kezdő időpont
y0=1;
tf = 1; % végpont
h = (tf - t0) / N; % lépéshossz
t = t0:h:tf; % időpontok vektora
f=@(t,y) t+y;

% Az kezdeti érték megadása
y = zeros(size(y0, 1), N+1);
y(:,1) = y0;

% Implicit Euler módszer
for i = 1:N
    % Az implicit Euler lépés:
    y(:,i+1) = y(:,i) + h * f(t(i+1), y(:,i+1));
end


plot(t, y,'b-o')

title('Euler-ODE---Numerical Solution---');
ylabel('y'); xlabel('t');
legend({'Approximate','Exact'},'Location','northwest');


