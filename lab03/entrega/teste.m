% Integrantes:
% Pedro de Azeredo - 12550809
% Artur Paparounis - 12550365
% Lucas Marques - 12566592

close all; clear all; clc
pkg load symbolic
pkg load control
pkg load signal

% 2d²x/dt² - 4dx/dt + 5x = 3e^(-2t)
% (2s² - 4s + 5)*X(s) = 3/(s+2)

syms s t;

laplace(8 * heaviside(t))
