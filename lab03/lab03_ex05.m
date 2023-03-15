close all; clear all; clc
pkg load symbolic;

syms Y t s
y0 = 4;
dy0 = 5;
f = exp(-t)
F = laplace(f, t, s)
Y1 = s*Y - y0;
Y2 = s*Y1 - dy0;

Sol_s = solve(Y2 + 3*Y1 + 2*Y - F, Y)
Sol_t = ilaplace(Sol_s)


