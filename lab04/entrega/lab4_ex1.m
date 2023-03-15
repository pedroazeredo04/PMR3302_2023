% Integrantes:
% Pedro de Azeredo - 12550809
% Artur Paparounis - 12550365
% Lucas Marques - 12566592

clear all; close all; clc

pkg load symbolic
pkg load control
pkg load signal

syms s t P R

num1 = 10; den1 = [1 1];
G1 = tf(num1, den1);
num2 = 1; den2 = [2 0.5];
G2 = tf(num2, den2);
num3 = 540; den3 = 1;
G3 = tf(num3, den3);
H1 = tf(0.1, 1);
H2 = tf(1,1);

printf('\nA sáida Y(s) é definida por:\n')

GR = feedback(G3*feedback(G1*G2, H1), H2)
GP = (GR/5400)/((G1*G3)/5400)

Y = R * (5400/(2*s^2+vpa(2.5)*s+5402)) - P * ((s+1)/(2*s^2+vpa(2.5)*s+5402))

printf('\nResposta para uma entrada degrau, com perturbação nula:\n')

Y = (1/s) * (5400/(2*s^2+vpa(2.5)*s+5402))

step(GR)
