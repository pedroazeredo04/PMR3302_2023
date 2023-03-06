close all; clear all; clc

pkg load symbolic

syms s

sys1 = partfrac(s^2/(s^3 - 3*s + 2))
