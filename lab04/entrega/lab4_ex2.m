% Integrantes:
% Pedro de Azeredo - 12550809
% Artur Paparounis - 12550365
% Lucas Marques - 12566592

clear all; close all; clc

pkg load symbolic
pkg load control
pkg load signal

G1 = tf(1, [1 1]);
G2 = tf(1, [1 2]);
G3 = tf(1, [1 3]);
H1 = tf(4, 1);
H2 = tf(8, 1);
H3 = tf(12, 1);

G = (G1*G3*(1+G2))/((1+G2*H2+G1*G2*H1)*(1+G3*H3))

t = 0:1/100:4;
impulse(G, t)
