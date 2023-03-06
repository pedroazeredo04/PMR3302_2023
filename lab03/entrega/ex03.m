% Integrantes:
% Pedro de Azeredo - 12550809
% Artur Paparounis - 12550365
% Lucas Marques - 12566592

close all; clear all; clc
pkg load symbolic
pkg load control
pkg load signal

syms s t;

% 1)
% 2d²x/dt² - 4dx/dt + 5x = 3e^(-2t)
% (2s² - 4s + 5) * X(s) = 3/(s+2)

num1 = 3;
den1 = (s+2)*(2*s^2-4*s+5);
X1 = num1/den1;
G1 = tf(num1, sym2poly(den1))
ilaplace(X1)

subplot(3, 1, 1)
step(G1)


% 2)
% 1d²x/dt² - 2dx/dt + -2x = 5 sin(2t)
% (s² - 2s - 2) * X(s) = 10/(s² + 4)

num2 = 10;
den2 = s^2 + 4;
X2 = num2/den2;
G2 = tf(num2, sym2poly(den2))
ilaplace(X2)

subplot(3, 1, 2)
step(G2)


% 3)
% 5d²x/dt² + 0,5dx/dt - x = 8
% (5s² + 0,5s - 1) * X(s) = 8/s

num3 = 8;
den3 = s * (5 * s^2 + vpa(1/2) * s - 1);
X3 = num3/den3;
G3 = tf(num3, sym2poly(den3))
ilaplace(X3)

subplot(3, 1, 3)
step(G3)
