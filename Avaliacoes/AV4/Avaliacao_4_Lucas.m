clear all; close all; clc
pkg load statistics % Carrega o pacote de estatísticas

N = 10000000; % Número de tentativas

X1 = 3 * rand(1, N) - 2; % Gera um vetor X1 de N valores aleatórios uniformemente distribuídos entre -2 e 1
X2 = 3 * rand(1, N) - 2; % Gera um vetor X2 de N valores aleatórios uniformemente distribuídos entre -2 e 1

%-----------------------------------------------------------------------------------
% Variáveis aleatórias do enunciado
%-----------------------------------------------------------------------------------

Y1 = X1.^2; % Calcula Y1 como o quadrado de X1
Y2 = X2.^2; % Calcula Y2 como o quadrado de X2
Y3 = X1 .* X2; % Calcula Y3 como o produto de X1 e X2

Z1 = Y1; % Define Z1 igual a Y1
Z2 = Y1 + Y2; % Define Z2 como a soma de Y1 e Y2
Z3 = Y1 + Y2 + Y3; % Define Z3 como a soma de Y1, Y2 e Y3

%------------------------------------------------------------------------------------
% Comando A
%------------------------------------------------------------------------------------

VetmediaY_sim = mean([Y1' Y2' Y3'])' % Calcula o vetor média dos vetores Y1, Y2 e Y3 simulados
VetmediaY_teo = [1;1;1/4] % Define o vetor média teórica calculada para Y1, Y2 e Y3

MatrizCovY_sim = cov([Y1' Y2' Y3'])' % Calcula a matriz de covariância dos vetores Y1, Y2 e Y3 simulados
MatrizCovY_teo = [6/5,0,3/8; % Define a matriz de covariância teórica calculada para Y1, Y2 e Y3
                  0,6/5,3/8;
                  3/8,3/8,15/16]

%------------------------------------------------------------------------------------
% Comando B
%------------------------------------------------------------------------------------

VetmediaZ_sim = mean([Z1' Z2' Z3'])' % Calcula o vetor média dos vetores Z1, Z2 e Z3 simulados
VetmediaZ_teo = [1;2;9/4] % Define o vetor média teórica calculada para Z1, Z2 e Z3

MatrizCovZ_sim = cov([Z1' Z2' Z3'])' % Calcula a matriz de covariância dos vetores Z1, Z2 e Z3 simulados
MatrizCovZ_teo = [6/5,6/5,63/40; % Define a matriz de covariância teórica calculada para Z1, Z2 e Z3
                  6/5,12/5,63/20;
                  63/40,63/20,387/80]
