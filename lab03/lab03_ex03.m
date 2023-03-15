close all; clear all; clc
pkg load symbolic

num = [1 -5];
den = [1 4 4 0];
[r, p, k] = residue(num, den)
