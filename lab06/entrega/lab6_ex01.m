% Integrantes:
% Pedro de Azeredo - 12550809
% Artur Paparounis - 12550365
% Lucas Marques - 12566592

clear all; close all; clc

pkg load symbolic
pkg load control
pkg load signal

syms t

t_max=100;
k1=16;
k2=16;
b1=2;
b2=2;
m1=40;
m2=40;
x0=[0.2 0.2 0 0];

%Por espaço de estados
t=0:0.01:t_max;
u=0*t;
A = [0 0 1 0; 0 0 0 1; -k1/m1 k1/m1 -b1/m1 b1/m1; k1/m2 -(k1+k2)/m2 b1/m2 -(b1+b2)/m2];
B = [0;0;1/m1;0];
C = [1 0 0 0; 0 1 0 0];
D=[0; 0];

sys=ss(A,B,C,D);
[y]=lsim(sys,u,t,x0);
figure
plot(t,y, 'LineWidth', 2);
ylabel('Posição da massa')
xlabel('Tempo (s)')
title('Espaço de Estados')
legend('Massa 1', 'Massa 2')
grid on

%Por ODE45
dx_dt=@(t,x)[x(3);
x(4);
-k1/m1*x(1)+k1/m1*x(2)-b1/m1*x(3)+b1/m1*x(4);
k1/m2*x(1)-(k1+k2)/m2*x(2)+b1/m2*x(3)-(b1+b2)/m2*x(4)];

[t,x]=ode45(dx_dt, t,x0);
figure
plot(t, x(:, 1:2), 'LineWidth', 2);
grid on;
title('ODE45');
ylabel('Posição da massa');
xlabel('Tempo (s)');
legend('Massa 1', 'Massa 2');
