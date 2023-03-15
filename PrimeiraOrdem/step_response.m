close all; clear all; clc
pkg load symbolic;
pkg load control;

syms x

% First Order Equation:
% dx/dt + 5 = 5 * 1(t)

num = [5];
den = [1 5];
G = tf(num, den)

plot([1 1]*1/5, ylim, '-r')
hold on
step(G)
