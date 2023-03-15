% Integrantes:
% Pedro de Azeredo - 12550809
% Artur Paparounis - 12550365
% Lucas Marques - 12566592

clear all; close all; clc

figura_handler = figure;
a = 0;
b = 1;
y_init = 1;
yp = @(x) -6*x;
y(1) = y_init;

intervalos = [0.25 0.2 0.1 0.01]

for n1 = 1:4
  dt = intervalos(n1);
  t = a:dt:b;
  
  for n2 = 1:(length(t) - 1)
    y(n2+1) = y(n2) + dt*yp(y(n2));
  endfor
  plot(t, y, 'Linewidth', 3)
  hold on
  clear t y;
  y(1) = y_init;
endfor

y_solved = @(x) e^(-6*x);
fplot(y_solved, [0 1], 'Linewidth', 2)

grid on
legend({'dt = 0.25', 'dt = 0.20', 'dt = 0.10', 'dt = 0.01', 'Exata'}, 'FontSize', 12)
xlabel('t', 'FontSize', 20)
ylabel('y(t)', 'FontSize', 20)
set(figura_handler, 'Color', [1 1 1])
