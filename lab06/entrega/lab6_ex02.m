% Integrantes:
% Pedro de Azeredo - 12550809
% Artur Paparounis - 12550365
% Lucas Marques - 12566592

clear all; close all; clc

pkg load symbolic
pkg load control
pkg load signal

syms t

% Constantes do sistema
m1=300;
m2=120;
m3=150;
m4=700;
m5=80;

k1=48.866;
k2=915522.58;
k3=1206875.43;
k4=1178694.84;
k5=36.7265;
k6=136.4661;
k7=38.6678;
k8=4761249.39;
k9=389232.42;

b4=0.8981;
b5=33114.21;
b6=1.7284;
b7=6764.6574;
b8=8648277.61;
b9=1595.52;


% Condições iniciais
V1 = 40/3.6 % m/s
V2 = 50/3.6 % m/s
x0_40=[0 0 0 0 0 V1 V1 V1 V1 V1];
x0_50=[0 0 0 0 0 V2 V2 V2 V2 V2];

% Constantes da simulação
t_max=1;
step = 0.001;
t=0:step:t_max;
t_lenght = t_max/step;

%Resolvendo por ODE45
dx_dt=@(t,x)[x(6);
x(7);
x(8);
x(9);
x(10);
-((k1+k2+k3+k4)/m1)*x(1)+(k2/m1)*x(2)+(k3/m1)*x(3)+(k4/m1)*x(4)-(b4/m1)*x(6)+(b4/m1)*x(9);
(k2/m2)*x(1)-((k2+k5+k6)/m2)*x(2)+(k6/m2)*x(4)-((b5+b6)/m2)*x(7)+(b6/m2)*x(9);
(k3/m3)*x(1)-((k3+k7+k8)/m3)*x(3)+(k8/m3)*x(4)-((b7+b8)/m3)*x(8)+(b8/m3)*x(9);
(k4/m4)*x(1)+(k6/m4)*x(2)+(k8/m4)*x(3)-((k4+k6+k8+k9)/m4)*x(4)+(k9/m4)*x(5)+(b4/m4)*x(6)+(b6/m4)*x(7)+(b8/m4)*x(8)-((b4+b6+b8+b9)/m4)*x(9)+(b9/m4)*x(10);
(k9/m5)*x(4)-(k9/m5)*x(5)+(b9/m5)*x(9)-(b9/m5)*x(10)];

% Ode45 para a primeira velocidade
[t,x1]=ode45(dx_dt, t, x0_40);
y1 = x1(:, 10); % Vetor velocidade 1 (em m/s)
dy1 = diff(y1)./diff(t);  % Derivada de y1: vetor aceleração 1 (em m/s^2)

% Ode45 para a segunda velocidade
[t,x2]=ode45(dx_dt, t, x0_50);
y2 = x2(:, 10); % Vetor velocidade 2 (em m/s)
dy2 = diff(y2)./diff(t);  % Derivada de y2: vetor aceleração 2 (em m/s^2)

dt = (t(2:end) + t(1:(end-1)))/2;  % Pega o ponto médio entre t(n) e t(n+1)

figure;
% Plot 1
plot(dt, dy1/9.8, 'LineWidth', 2);
hold on;
% Plot 2
plot(dt, dy2/9.8, 'LineWidth', 2);
grid on;

axis([0 t_max -40 15])
title('Comparativo de reações do motorista à um impacto');
ylabel('Aceleração do passageiro (mmúltiplos de g)');
xlabel('Tempo (s)');
legend('40km/h', '50km/h');
