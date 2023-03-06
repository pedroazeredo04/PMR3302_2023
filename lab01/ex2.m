% Exercício 2

% Integrantes:
% Pedro de Azeredo - 12550809
% Lucas Martins Marques - 12566592

clear all; close all; clc

A = [3 7 -4 12; -5 9 10 2; 6 13 8 11; 15 5 4 1]

% item 1:
A1 = sort(A)

% item 2:
A2 = (sort((A.'))).'

% item 3:
b1 = sum(A, 1)

% item 4:
b2 = sum(A, 2)

% item 5:
c1 = max(A2(:, 2) .* A(:, 1))

% item 6:
c2 = A(:, 1) / sum(A1(1:3, 3))
