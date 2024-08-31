pkg load statistics;

clear all; close all; clc;

N = 10000;  % Número de realizações
dt = 0.01; t = 0 : dt : 20;  % Vetor dos tempos
Nt = length(t);  % Número de pontos no vetor de tempo

lambda1 = 2.5;  % Taxa de eventos para o primeiro processo
lambda2 = 2;    % Taxa de eventos para o segundo processo
lambdaX = lambda1 + lambda2 ;  % Taxa total de eventos (soma das duas taxas)

X = zeros(N,  Nt);  % Inicializa a matriz para armazenar os eventos
for i = 1 : N
  T = 0;  % Tempo inicial
  while T < t(end)
    T += rande() / lambdaX;  % Gera o próximo evento
    X(i, :) += t > T;  % Atualiza a matriz com o novo evento
  end
end

% ------------------------------------------------------------------------------------------------------------
% Comando Letra A
% ------------------------------------------------------------------------------------------------------------
muX_sim = mean(X);  % Média simulada de X
muX_teo = lambdaX * t;  % Média teórica de X

figure; hold on; grid on;  % Cria uma nova figura
for i = 1 : 100
  stairs(t, X(i, :))  % Plota os eventos para 100 amostras
end
plot(t, muX_sim, 'm', 'LineWidth', 6);  % Plota a média simulada
plot(t, muX_teo, 'b', 'LineWidth', 3);  % Plota a média teórica
xlabel('t (s)'); ylabel('X(t)');  % Rótulos dos eixos

% ------------------------------------------------------------------------------------------------------------
% Comando Letra B
% ------------------------------------------------------------------------------------------------------------

idx10 = (10 / dt) + 1;  % Índice correspondente ao tempo 10
idx13 = (13 / dt) + 1;  % Índice correspondente ao tempo 13

X10 = X(:, idx10);  % Valores de X no tempo 10
X13 = X(:, idx13);  % Valores de X no tempo 13

% Cálculo da probabilidade simulada de que a diferença entre X13 e X10 seja maior ou igual a 15
Pr_Cond_Sim = mean(X13 - X10 >= 15)
% Cálculo da probabilidade teórica (valor calculado)
Pr_Cond_Teo = (37.67)/100

% ------------------------------------------------------------------------------------------------------------
% Comando Letra C
% ------------------------------------------------------------------------------------------------------------

T_Evento2 = zeros(1,N);  % Vetor para armazenar o tempo do segundo evento
T_Evento3 = zeros(1,N);  % Vetor para armazenar o tempo do terceiro evento

for i = 1 : N
  % Percorre todas as linhas das matrizes calculando diferenças
  T_Diferencas = diff(X(i, :));  % Calcula as diferenças entre eventos
  % Encontra os índices onde a diferença é igual a 1 (onde houve eventos)
  T_Eventos = find(T_Diferencas == 1);
  % Coloca o terceiro evento do vetor de eventos no vetor de evento3
  T_Evento3(i) = (T_Eventos(3)) * dt;
  % Coloca o segundo evento do vetor de eventos no vetor de evento2
  T_Evento2(i) = (T_Eventos(2)) * dt;
end

% Calcula a probabilidade da diferença entre o terceiro e o segundo evento ser maior que 0,1s
Pr_delta3_Sim = mean((T_Evento3 - T_Evento2) > 0.1)
% Cálculo da probabilidade teórica (valor fornecido)
Pr_delta3_Teo = 0.6376

% ------------------------------------------------------------------------------------------------------------
% Comando Letra D
% ------------------------------------------------------------------------------------------------------------

idx3 = (3 / dt) + 1;  % Índice correspondente ao tempo 3
idx4 = (4 / dt) + 1;  % Índice correspondente ao tempo 4

X3 = X(:, idx3);  % Valores de X no tempo 3
X4 = X(:, idx4);  % Valores de X no tempo 4

% Cálculo da matriz de covariância simulada entre X3 e X4
Cov_sim = [cov(X3,X3) cov(X3,X4); cov(X4,X3) cov(X4,X4)]
% Cálculo da matriz de covariância teórica fornecida
Cov_teo = [13.5 13.5; 13.5 18]
