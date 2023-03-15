% Integrantes:
% Pedro de Azeredo - 12550809
% Artur Paparounis - 12550365
% Lucas Marques - 12566592

clear all; close all; clc

pkg load symbolic
pkg load control
pkg load signal

G1 = tf(1, [1 0 0]);
G2 = tf(50, [1 1]);
G3 = tf([1 0], 1);
G4 = tf(2, 1);
H1 = tf(2, [1 0]);
H2 = tf(1, 1);

G = feedback(G1*feedback(G2, H1)*(G3-G4), H2)

t = 0:1/100:10;
step(G,t)
