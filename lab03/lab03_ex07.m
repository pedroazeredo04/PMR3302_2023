close all; clear all; clc
pkg load symbolic;
pkg load control;

syms s t;

num = [1];
den = [1 2 10];
Gs = tf(num, den)
Y = (3)/((s+2)*(2*s^2-4*s+5));
ilaplace(Y)
step(Gs)
