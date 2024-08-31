clear all; close all; clc;

pkg load statistics;

N = 1_000_000;  % Número de realizações

mu = [0; 0; 0];  % Vetor média do enunciado
C = [9 2 0; 2 4 0; 0 0 1];  % Matriz covariância do enunciado

vetX = mvnrnd(mu, C, N);  % Geração de amostras da distribuição normal multivariada

X1 = vetX(:, 1)';  % Extração da primeira variável
X2 = vetX(:, 2)';  % Extração da segunda variável
X3 = vetX(:, 3)';  % Extração da terceira variável

%------------------------------------------------------------------------------------
% Comando A --> Pr[2 <= X1 <= 3]
%------------------------------------------------------------------------------------

% Cálculo da probabilidade simulada de X1 estar entre 2 e 3
PrX1_sim = mean(2 <= X1 & X1 <= 3);
% Cálculo da probabilidade teórica usando a função de distribuição normal acumulada
PrX1_teo = normcdf((3-0)/sqrt(9)) - normcdf((2-0)/sqrt(9));

printf('Pr[2 <= X1 <= 3] simulada: %g\n', PrX1_sim);
printf('Pr[2 <= X1 <= 3] calculada: %g\n', PrX1_teo);
printf('\n');

%------------------------------------------------------------------------------------
% Comando B --> Pr[2 <= X1 <= 3 | X2 = 2]
%------------------------------------------------------------------------------------

% Cálculo da probabilidade condicional simulada de X1 estar entre 2 e 3 dado que X2 está em torno de 2
X1cond = X1(1.9 < X2 & X2 < 2.1);
PrX1cond_sim = mean(2 <= X1cond & X1cond <= 3);
% Cálculo da probabilidade condicional teórica usando a função de distribuição normal acumulada
PrX1cond_teo = normcdf((3-1)/sqrt(8)) - normcdf((2-1)/sqrt(8));

printf('Pr[2 <= X1 <= 3 | X2 = 2] simulada: %g\n', PrX1cond_sim);
printf('Pr[2 <= X1 <= 3 | X2 = 2] calculada: %g\n', PrX1cond_teo);
printf('\n');

%------------------------------------------------------------------------------------
% Comando C --> Pr[2 <= X1 <= 3 | X2 = 2 ^ X3 = 3]
%------------------------------------------------------------------------------------

% Cálculo da probabilidade condicional simulada de X1 estar entre 2 e 3 dado que X2 está em torno de 2 e X3 está em torno de 3
X1cond = X1((1.9 < X2 & X2 < 2.1) & (2.9 <= X3 & X3 <= 3.1));
PrX1cond2_sim = mean(2 <= X1cond & X1cond <= 3);
% Cálculo da probabilidade condicional teórica usando a função de distribuição normal acumulada
PrX1cond2_teo = normcdf((3-1)/sqrt(8)) - normcdf((2-1)/sqrt(8));

printf('Pr[2 <= X1 <= 3 | X2 = 2 & X3 = 3] simulada: %g\n', PrX1cond2_sim);
printf('Pr[2 <= X1 <= 3 | X2 = 2 & X3 = 3] calculada: %g\n', PrX1cond2_teo);
printf('\n');

%------------------------------------------------------------------------------------
% Comando D --> Pr[X1 - X3 > 4]
%------------------------------------------------------------------------------------

% Cálculo da probabilidade simulada de X1 - X3 ser maior que 4
PrY_maior_4_sim = mean(X1 - X3 > 4);
% Cálculo da probabilidade teórica usando a função de distribuição normal acumulada
PrY_maior_4_teo = 1 - normcdf((4 - 0)/sqrt(10));

printf('Pr[X1 - X3 > 4] simulada: %g\n', PrY_maior_4_sim);
printf('Pr[X1 - X3 > 4] calculada: %g\n', PrY_maior_4_teo);
