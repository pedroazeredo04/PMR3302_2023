close all; clear all; clc
pkg load symbolic; 
pkg load control;

syms s

% First Order Equation:
% dx/dt + 5 = 5 * t

num = 5 / s^2;
den = s + 5;
F = (num/den);

ezplot(ilaplace(F), [0 5])
