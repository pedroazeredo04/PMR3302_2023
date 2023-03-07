close all; clear all; clc

pkg load symbolic;
pkg load control;
pkg load signal;

num = 2; den = [1 2];
t = 0:3/300:3; % 3 s de simulacao
sys = tf(num, den)
y = impulse(sys, t);
subplot(2, 1, 1)
plot(t, y)

y = step(sys, t);
subplot(2, 1, 2)
plot(t, y)
