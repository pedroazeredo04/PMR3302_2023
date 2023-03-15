% Integrantes:
% Pedro de Azeredo - 12550809
% Artur Paparounis - 12550365
% Lucas Marques - 12566592

clear all; close all; clc

pkg load symbolic
pkg load control
pkg load signal

syms s t P R

% A equação diferencial m*dV/dt + v*V = F pode ser escrita em função da posição ao invés da velocidade:
% m*dx²/dt² + v*dx/dt = F. Assim, a função de transferência da posição é:
% X/F = Gx = 1/(m*s² + v*s)

% Para esse exercício, a força foi modelada como idealmente impulsiva.
% No programa, isso foi feito adicionando um ganho de 200 na função de transferência
% e aplicando um impulso unitário nela, com a função impulse.

m = 10;
v = 20;
F = 200;

Gx = tf(F, [m v 0]);
Gv = 1/(m*s + v);

impulse(Gx)

V = ilaplace(F * Gv)

printf("Para V chegar em 1 por cento do valor inicial de 20, \n")
printf("Basta resolver a equação: 20*exp(-2t) = 0.01 * 20 \n")

tempo_um_porcento = solve(exp(-2*t) == vpa(0.01), t)
