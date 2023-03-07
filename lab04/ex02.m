close all; clear all; clc

pkg load symbolic;
pkg load control;
pkg load signal;

syms s

G1 = 1/(s+1);
G2 = 1/(s+2);
G3 = 1/(s+3);
H1 = 4;
H2 = 8;
H3 = 12;

num = G1 * G3 * (1 + G2)
den = (1 + G2*H2 + G1*G2*H1) * (1 + G3*H3)
G = simplify(num/den)
[num, den] = numden(G)

t = 0:3/300:3; % 3 s de simulacao


sys = tf(sym2poly(num), sym2poly(den))
y = impulse(sys, t);
subplot(2, 1, 1)
plot(t, y)

y = step(sys, t);
subplot(2, 1, 2)
plot(t, y)
