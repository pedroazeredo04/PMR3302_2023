close all; clear all; clc
pkg load symbolic;

syms s;

B = s + 1;
A = s^3 + 4*s^2 + 4*s;

r = partfrac(B/A)

laplace = ilaplace(r)
