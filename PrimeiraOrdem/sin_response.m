close all; clear all; clc
pkg load symbolic; 
pkg load control;

syms s t

% First Order Equation:
% dx/dt + 5x = sin(t)

freq = vpa(1/pi);
u = 2*sin(freq * t);
T = vpa(0.1);

num = laplace(u);
den = T * s + 1;
F = num/den;

ezplot(ilaplace(F), [0 5])
