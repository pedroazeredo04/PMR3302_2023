clear all;close all;clc;
pkg load control

% Constants
m = 1;
k = 1;
b = [0.1 0.5 1 2 5 10 100];
t_max = 20;

for n = 1:length(b)
  A = [0 1; -k/m -b(n)/m];
  B = [0; 1/m];
  C = [1 0];
  D = [0];
  sys = ss(A,B,C,D);
  [y t]=impulse(sys,t_max);

  % Plot
  plot(t,y)
  grid on
  axis([0 t_max -1.1 1.1])
  hold on
endfor