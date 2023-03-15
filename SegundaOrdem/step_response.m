close all; clear all; clc;

pkg load symbolic;
pkg load control;
pkg load signal;

syms s t x

U = 1/s;

# Polos reais distintos
# zeta > 1
# sistema sobreamortecido
G1 = 3/(4*s^2 + 12*s + 1);
Y1 = G1 * U;
subplot(2, 2, 1)
ezplot(ilaplace(Y1), [0 100])
title("Sobreamortecido")


# Polos reais duplos
# zeta = 1
# sistema criticamente amortecido
G2 = 3/(s^2 + 2*s + 1);
Y2 = G2 * U;
subplot(2, 2, 2)
ezplot(ilaplace(Y2), [0 100])
title("Criticamente Amortecido")


# Polos complexos conjugados
# 0 < zeta < 1
# Sistema subamortecido
G3 = 3/(2*s^2 + 2*s + 2);
Y3 = G3 * U;
subplot(2, 2, 3)
ezplot(ilaplace(Y3), [0 100 0 100])
title("Subamortecido")


# Polos imaginários puros
# zeta = 0
# Sistema não amortecido
G4 = 3/(s^2 + 1);
Y4 = G4 * U;
subplot(2, 2, 4)
ezplot(ilaplace(Y4), [0 100])
title("Não amortecido")


