% Integrantes:
% Pedro de Azeredo - 12550809
% Artur Paparounis - 12550365
% Lucas Marques - 12566592

clear all; close all; clc

pkg load symbolic
pkg load control
pkg load signal

syms s t a b;

printf("md²x/dt² + cdx/dt +kx = A")

m = input("\nm = ");
c = input("\nc = ");
k = input("\nk = ");
A = sym(input("\nA = "));

% a = y(0), b = dy/dt(0)

% ms^2*Y -msa -mb + csY - ca + kY = A(s)
Y = simplify((laplace(A) + m*s*a + m*b + c*a)/(m*s^2 + c*s + k))
y = ilaplace(Y)
