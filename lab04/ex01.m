close all; clear all; clc

pkg load symbolic;
pkg load control;
pkg load signal;

syms s t R P

G1 = tf(10, [1 1]);
G2 = tf(2, [4 1]);
G3 = 540;
H1 = 1;
H2 = (0.1);

% Função de Transferência:
G = (G1*G2*G3 / (G1*G2*G3*H1 + H2*G1*G2 + 1))

% Laplace da entrada e da perturbação:
R = 1/s;
P = 0;

% Saída:
%Y = G * (R + P/(G1*G3));

step(G)
