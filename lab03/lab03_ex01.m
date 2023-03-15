pkg load symbolic

syms s t

% LaPlace em MatLab

y = vpa('-1.25') + vpa('3.5') * t * exp(-2*t) + vpa('1.25') * exp(-2*t)
Y = laplace(y, t, s)
% Y = simplify(Y)
