clear all;close all;clc;
pkg load control

m = 1;
k = 1;
b = 0.01;
t_max = 1000;
Frequencia_da_forca_Hz = [100 50 10 1 0.2 0.17 0.159154943019895];

figure
for n = 1:length(Frequencia_da_forca_Hz)
  A = [0 1; -k/m -b/m];
  B = [0; 1/m];
  C = [1 0];
  D = [0];
  sys = ss(A,B,C,D);
  t = 0:0.01:t_max;
  u = sin(2*pi*Frequencia_da_forca_Hz(n)*t)+1;
  x0 = [0 0];
  [y]=lsim(sys,u,t,x0);
  
  subplot(4, 2, n)
  plot(t,y)
  grid on
endfor
