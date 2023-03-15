close all; clear all; clc
pkg load symbolic;

syms s t

A = s^2 + 2*s + 10;
B = 2/s^3;

Y = B/A

y = ilaplace(Y)

fh=ezplot(y,[0,5]); set(fh,'Color','r','LineWidth', 4);
