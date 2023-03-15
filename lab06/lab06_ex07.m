pkg load control

m = 1;
k = 1;
b = 0.01;
t_max = 1000;
Frequencia_da_forca_Hz = 1;

y0 = [0 0];
dy_dt = @(t,y) [y(2);
-(b/m)*y(2)-(k/m)*y(1)+(1/m)*(sin(2*pi*Frequencia_da_forca_Hz*t)+1)];
[t,y]=ode45(dy_dt,[0 t_max],y0);

figure
plot(t,y(:,1))
grid on
