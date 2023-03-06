close all; clear all; clc
pkg load symbolic;
pkg load control;
pkg load signal;

num = [1 1];
den = [1 -1 0.5]
sys = tf(num, den)
[z, p, k] = tf2zp(num, den)
zplane(num, den)
