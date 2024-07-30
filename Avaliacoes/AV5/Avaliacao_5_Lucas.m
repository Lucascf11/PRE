clear all; close all; clc;

pkg load statistics;

N = 1_000_000;  % Número de realizações

mu = [0; 0; 0];  % Vetor média do enunciado
C = [9 2 0; 2 4 0; 0 0 1];  % Matriz covariância do enunciado

vetX = mvnrnd(mu, C, N);

X1 = vetX(:, 1)';
X2 = vetX(:, 2)';
X3 = vetX(:, 3)';

%------------------------------------------------------------------------------------
% Comando A --> Pr[2 <= X1 <= 3]
%------------------------------------------------------------------------------------

PrX1_sim = mean(2 <= X1 & X1 <= 3);
PrX1_teo = normcdf((3-0)/sqrt(9)) - normcdf((2-0)/sqrt(9));

printf('Pr[2 <= X1 <= 3] simulada: %g\n', PrX1_sim);
printf('Pr[2 <= X1 <= 3] calculada: %g\n', PrX1_teo);
printf('\n');

%------------------------------------------------------------------------------------
% Comando B --> Pr[2 <= X1 <= 3 | X2 = 2]
%------------------------------------------------------------------------------------

X1cond = X1(1.9 < X2 & 2.1 < X2);

PrX1cond_sim = mean(2 <= X1cond & X1cond <= 3);
PrX1cond_teo = normcdf((3-1)/sqrt(8)) - normcdf((2-1)/sqrt(8));

printf('Pr[2 <= X1 <= 3 | X2 = 2] simulada: %g\n', PrX1cond_sim);
printf('Pr[2 <= X1 <= 3 | X2 = 2] calculada: %g\n', PrX1cond_teo);
printf('\n');

%------------------------------------------------------------------------------------
% Comando C --> Pr[2 <= X1 <= 3 | X2 = 2 ^ X3 = 3]
%------------------------------------------------------------------------------------

X1cond = X1((1.9 < X2 & X2 < 2.1) & (2.9 <= X3 & X3 <= 3.1));

PrX1cond2_sim = mean(2 <= X1cond & X1cond <= 3);
PrX1cond2_teo = normcdf((3-1)/sqrt(8)) - normcdf((2-1)/sqrt(8));

printf('Pr[2 <= X1 <= 3 | X2 = 2 & X3 = 3] simulada: %g\n', PrX1cond2_sim);
printf('Pr[2 <= X1 <= 3 | X2 = 2 & X3 = 3] calculada: %g\n', PrX1cond2_teo);
printf('\n');

%------------------------------------------------------------------------------------
% Comando D --> Pr[X1 - X3 > 4]
%------------------------------------------------------------------------------------

PrY_maior_4_sim = mean(X1 - X3 > 4);
PrY_maior_4_teo = 1 - normcdf((4 - 0)/sqrt(10));

printf('Pr[X1 - X3 > 4] simulada: %g\n', PrY_maior_4_sim);
printf('Pr[X1 - X3 > 4] calculada: %g\n', PrY_maior_4_teo);






