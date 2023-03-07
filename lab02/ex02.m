% Integrantes:
% Pedro de Azeredo - 12550809
% Artur Paparounis - 12550365
% Lucas Marques - 12566592

clear all; close all; clc

pkg load symbolic

syms a b c x t A B 

constants = [2 -4 5; -1 2 -2]

# 1. 2d²x/dt² - 4dx/dt + 5x = 0
# 2. -1d²x/dt² + 2dx/dt - 2x = 0

for n = 1:2
  a = constants(n, 1);
  b = constants(n, 2);
  c = constants(n, 3);

  f = a*x^2 + b*x + c;
  S = solve(f, x)

  s_r = real(S(1));
  s_i = abs(imag(S(1)));
  
  if s_i != 0
    X = e^(s_r * t) * (A * cos(s_i * t) + B * sin(s_i * t))
  
    if s_r <= 0
      printf('A solução acima descreve um sistema estável \n')
    else
      printf('A solução acima descreve um sistema instável \n')
    endif
  else
    X = A * e^(s_r * t)
  endif
endfor
