% Integrantes:
% Pedro de Azeredo - 12550809
% Artur Paparounis - 12550365
% Lucas Marques - 12566592

close all; clear all; clc
pkg load symbolic
pkg load control
pkg load signal

syms s t;

A = [0.1 1 2 1];
B = [1 1 1 -1];

for n1 = 1:4
  a = vpa(A(n1))
  b = vpa(B(n1))
  num = 1;
  den = (s^2 + a*s + b);
  X = num/den;
  G = tf(num, sym2poly(den))
  figure(1)
  subplot(2, 2, n1)
  step(G)
  
  figure(2)
  subplot(2, 2, n1)
  zplane(num, sym2poly(den))
endfor


% Não há zeros na função de transferência.
% Quanto aos polos, nos casos A, B, C eles se encontram no semiplano esquerdo do z-plane
% Isso indica que o sistema que eles caracterizam é estável, como pode ser observado nos gráficos, pois os 3 casos tendem a 1
% Já no quarto caso, um dos polos se encontra no semiplano direito, o que implica um sistema instável; como também pode ser observado no gráfico, que não é limitado.
