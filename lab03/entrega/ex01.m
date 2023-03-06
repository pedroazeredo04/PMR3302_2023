% Integrantes:
% Pedro de Azeredo - 12550809
% Artur Paparounis - 12550365
% Lucas Marques - 12566592

close all; clear all; clc
pkg load symbolic
pkg load control
pkg load signal

syms s t;

num = 1;
den = 90 * s + 1;
G = tf(num, sym2poly(den));

T = 40;
s = 0.632 * T;
delta = 0.001;
t = 0:0.01:500;

G40 = step(G, t) .* 40;
plot(G40)

t(find(G40 < s + delta & G40 > s - delta))


printf('1. 90 segundos \n')
printf('2. 89,97 segundos \n')
printf('3. G(s) = 1/(45s + 1) \n')
