clear all;close all;clc;
pkg load control

m = 1;
k = 1;
b = 0.01;
t_max = 1000;
Frequencia_da_forca_Hz = 1;
A = [0 1; -k/m -b/m];
B = [0; 1/m];
C = [1 0];
D = [0];
sys = ss(A,B,C,D);
t = 0:0.01:t_max;
u = sin(2*pi*Frequencia_da_forca_Hz*t)+1;
x0 = [0 0];
[y]=lsim(sys,u,t,x0);
figure
plot(t,y)
grid on
