clear all;close all;clc;
pkg load control
m = 1;
k = 1;
b = 0.01;
t_max = 20;

A = [0 1; -k/m -b/m];
B = [0; 1/m];
C = [1 0];
D = [0];
sys = ss(A,B,C,D);
[y t]=step(sys,t_max);

figure
plot(t,y)
grid on
axis([0 t_max 0 2])
