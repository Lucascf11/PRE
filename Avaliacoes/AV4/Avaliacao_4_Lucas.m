clear all; close all; clc;
pkg load statistics;

N = 10000000; % Número de tentativas

X1 = 3 * rand(1,N) - 2; % Gerando intervalo contínuo entre -2 e 1
X2 = 3 * rand(1,N) - 2; % Gerando intervalo contínuo igual a X1

%-----------------------------------------------------------------------------------
% Variáveis aleatórias do enunciado
%-----------------------------------------------------------------------------------

Y1 = X1.^2;
Y2 = X2.^2;
Y3 = X1.*X2;

Z1 = Y1;
Z2 = Y1 + Y2;
Z3 = Y1 + Y2 + Y3;

%------------------------------------------------------------------------------------
% Comando A
%------------------------------------------------------------------------------------

VetmediaY_sim = mean([Y1' Y2' Y3'])' % Vetor média de Y simulado
VetmediaY_teo = [1;1;1/4] % Vetor média de Y calculado

MatrizCovY_sim = cov([Y1' Y2' Y3'])' % Matriz covariância de Y simulada
MatrizCovY_teo = [6/5,0,3/8;0,6/5,3/8;3/8,3/8,15/16] % Matriz covariância de Y calculada

%------------------------------------------------------------------------------------
% Comando B
%------------------------------------------------------------------------------------

VetmediaZ_sim = mean([Z1' Z2' Z3'])' % Vetor média de Z simulado 
VetmediaZ_teo = [1,2,9/4]' % Vetor média de Z calculado

MatrizCovZ_sim = cov([Z1' Z2' Z3'])' % Matriz covariância de Z simulada
MatrizCovZ_teo = [6/5,6/5,63/40;6/5,12/5,63/20;63/40,63/20,387/80] % Matriz covariância de Z calculada