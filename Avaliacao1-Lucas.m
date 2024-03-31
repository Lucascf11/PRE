clc; close all; clear all;

% Comando letra A

N = 1000000; % Quantidade de execuções do experimento probabilístico

U = randi([1 6],1,N); % Cria um vetor de números aleatórios de 1 até 6 de dimensões 1XN

% Representando os resultados dos dados
idx1 = (U == 1 | U == 4);
idx2 = (U == 2 | U == 5);
idx3 = (U == 3 | U == 6);

X = zeros(1,N);

X(idx1) = 4 * rand(1, sum(idx1)) - 2; % Se idx1 é verdade, então U = 1 ou U = 4, logo, X é intervalo regular de -2 a 2
X(idx2) = rand(1,sum(idx2)) < 1/3; % Se idx2 é verdade, então U = 2 ou U = 5, logo, X é Bernoulli 1/3
X(idx3) = rand(1,sum(idx3)) < 2/3; % Se idx3 é verdade, então U = 3 ou U = 6, logo, X é Bernoulli 2/3

dx = 0.01; x = -3 : dx : 3;

pdfX_sim = hist(X,x) / (N * dx); % Gráfico da PDF simulada
pdfX_teo = (1/12) .* (-2 < x & x < 2); % Gráfico da PDF calculada sem os impulsos

% Plotagem dos gráficos
figure;

subplot(2, 1, 1); hold on; grid on;
bar(x, pdfX_sim, 'y'); % Plota o gráfico da PDF simulada em linhas barras amarelas
plot(x, pdfX_teo, 'b', 'LineWidth', 4) % Plota o gráfico da PDF calculada em linhas azuis

% Representando os impulsos:
plot([0, 0], [0, 1/3], 'b', 'LineWidth', 4')
plot([0], [1/3], 'b^', 'MarkerSize', 12, 'MarkerFaceColor', 'b')
plot([1, 1], [0, 1/3], 'b', 'LineWidth', 4')
plot([1], [1/3], 'b^', 'MarkerSize', 12, 'MarkerFaceColor', 'b')
xlabel('x'); ylabel('f_X(x)'); 
xlim([-2.2 2.2]); ylim([-0.1, 0.4]) % Limita o gráfico em X indo de -2.2 até 2.2 e em Y indo de -0.1 até 0.4

%-------------------------------------------------------------------------------------------------

%Comando Letra B

cdfX_sim = cumsum(pdfX_sim) * dx; % Calculo da soma acumulada simulada
% Calculo da soma acumulada teorica
cdfX_teo = ((x+2)/12)        .* (-2 <= x & x < 0) + ...
           ((1/2)+(x/12))    .* (0 <= x & x < 1) + ...
           ((11/12) +((x-1))/12) .* (1 <= x & x < 2) + ...
           1                 .* (2 <= x); 

subplot(2, 1, 2); hold on; grid on
plot(x, cdfX_sim, 'y', 'LineWidth', 4) % Plota o gráfico da soma acumulada simulada em linha amarela
plot(x, cdfX_teo, 'b', 'LineWidth', 2) % Plota o gráfico da soma acumulada teorica em linha azul
xlim([-2.2 2.2]); ylim([-0.2, 1.2]) % Limita o gráfico em X indo de -2.2 até 2.2 e em Y indo de -0.2 até 1.2
xlabel('x'); ylabel('F_X(x)')

%-------------------------------------------------------------------------------------------------
% Comando Letra C

printf('Media Simulada: E[X] = %g\n', mean(X)); % Mostra o valor da Esperança matemática simulada
printf('Media Teorica: E[X] = %g\n', 1/3); % Mostra o valor da Esperança matemática calculada

%-------------------------------------------------------------------------------------------------
% Comando Letra D

printf('Probabilidade para X <=0 Simulada: %g\n', mean(X <= 0)); % Mostra a probabilidade para X <= 0 simulada
printf('Probabilidade para X <=0 teorica: %g\n', 1/2); % Mostra a probabilidade para X <= 0 calculada








