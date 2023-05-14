% Explicit és implicit módszer megoldása

clc, clear all, close all

n = input("Adja meg az iterációk számát: ") - 1;
input_h = input("Adja meg a lépés méretet: ");
t0 = input("Adja meg a t0 kezdő értékét: ");
y0 = input("Adja meg a y0 kezdő értékét: ");
b = input("Adja meg az intervalum végét: ");
f_inner = input("Adja meg a függvényt: ", "s");
f = str2func(['@(t, y)', f_inner]); % (2 * t) + y
a = t0;
backward_euler = @ ( f, to, yo, tp, yp ) yp - yo - ( tp - to ) * ( f ( tp, yp ) )';
exact = @(t) ((-2) * (t + 1) + (3 * exp(t)));
if !isempty(input_h)
  h = input_h;
else
  h=(b - a) / n;
endif
% explicit változók
ext=[a zeros(1, n)];
exy=[length(ext)];
exye=[length(ext)];
ext(1) = t0;
exy(1) = y0;
exye(1) = y0;
% implicit változók
m = length ( y0 );
t = zeros ( n + 1, 1 );
y = zeros ( n + 1, m );
ye = zeros( n + 1, m);

t(1,1) = t0(:);
y(1,:) = y0(:);
ye(1,:) = y0(:);

fprintf("========================\n");
% explicit módszer
fprintf("Explicit Euler Módszer:\n");
fprintf('%7s %7s %7s %7s \n','i','t(i)','y(i)', 'ye(i)');
for i=1:1:n + 1
  if i <= n
     ext(i + 1)=ext(i) + h;
  endif
  if i != 1
    exy(i)=exy(i - 1)+ h * f(ext(i - 1),exy(i - 1));
    exye(i)=exact(ext(i));
  endif
  fprintf('%7d %7.2f %7.3f %7.3f \n',i, ext(i), exy(i), exye(i));
end;

%implicit módszer
fprintf("\nImplicit Euler Módszer:\n");
fprintf('%7s %7s %7s %7s \n','i','t(i)','y(i)', 'ye(i)');
fprintf('%7d %7.2f %7.3f %7.3f \n', 1, t0(:), y0, y0);
for i = 1 : n

   to = t(i,1);
   yo = y(i,:);
   tp = to + h;
   yp = yo + h * f ( to, yo )';

   yp = fsolve ( @(yp)backward_euler(f, to, yo, tp, yp), yp );

   t(i+1,1) = tp;
   y(i+1,:) = yp;
   ye(i + 1, :) = exact(t(i + 1, 1));
   fprintf('%7d %7.2f %7.3f %7.3f \n',i + 1, t(i + 1), y(i + 1), ye(i + 1));
end

plot(ext, exy, 'b-o', t, y, 'r-o', t, exact(t), 'g');
title('Euler módszerek');
ylabel('y'); xlabel('t');
legend({'Explicit','Implicit','Egzakt'},'Location','northwest');
grid on

hold on
hold off


