close all; clear all; clc
pkg load symbolic; 
pkg load control;

syms s t

% First Order Equation:
% dx/dt + 5x = sin(t)

freq = [1/pi 5/pi 10/pi 50/pi 100/pi];

T = (1);

for n = 1:length(freq)
  u = 100 + 2 * (sin((freq(n)) * t));

  num = laplace(u);
  den = T * s + 1;
  F = simplify((num)/(den));
  f = ilaplace(F);

  subplot(3, 2, n)
  ezplot(f, [0 25])
endfor
