pkg load statistics;

clear all; close all; clc;

N = 10000;  % Número de realizações
dt = 0.01; t = 0 : dt : 20;  % Vetor dos tempos
Nt = length(t);

lambda1 = 2.5;
lambda2 = 2;
lambdaX = lambda1 + lambda2 ;  % eventos / s

X = zeros(N,  Nt);
for i = 1 : N
  T = 0;
  while T < t(end)
    T += rande() / lambdaX;
    X(i, :) += t > T;
  end
end

% ------------------------------------------------------------------------------------------------------------
% Comando Letra A
% ------------------------------------------------------------------------------------------------------------
muX_sim = mean(X);
muX_teo = lambdaX * t;

figure; hold on; grid on;
for i = 1 : 100
  stairs(t, X(i, :))
end
plot(t, muX_sim, 'm', 'LineWidth', 6);
plot(t, muX_teo, 'b', 'LineWidth', 3);
xlabel('t (s)'); ylabel('X(t)');

% ------------------------------------------------------------------------------------------------------------
% Comando Letra B
% ------------------------------------------------------------------------------------------------------------

idx10 = (10 / dt) + 1;
idx13 = (13 / dt) + 1;

X10 = X(:, idx10);
X13 = X(:, idx13);

Pr_Cond_Sim = mean(X13 - X10 >= 15)
Pr_Cond_Teo = (37.67)/100

% ------------------------------------------------------------------------------------------------------------
% Comando Letra C
% ------------------------------------------------------------------------------------------------------------

T_Evento2 = zeros(1,N);
T_Evento3 = zeros(1,N);

for i = 1 : N
  %Percorre todas as linhas das matrizes calculando diferenças
  T_Diferencas = diff(X(i, :));
  % Encontra os índices onde a diferença é igual a 1 (onde houve eventos)
  T_Eventos = find(T_Diferencas == 1);
  %Coloca o terceiro evento do vetor de eventos no vetor de evento3
  T_Evento3(i) = (T_Eventos(3)) * dt;
  %Coloca o segundo evento do vetor de eventos no vetor de evento2
  T_Evento2(i) = (T_Eventos(2)) * dt;
end

% Calcula a probabilidade da diferença entre as ocorrências de eventos ser maior que 0,1s
Pr_delta3_Sim = mean((T_Evento3 - T_Evento2) > 0.1)
Pr_delta3_Teo = 0.6376



% ------------------------------------------------------------------------------------------------------------
% Comando Letra D
% ------------------------------------------------------------------------------------------------------------

idx3 = (3 / dt) + 1;
idx4 = (4 / dt) + 1;

X3 = X(:, idx3);
X4 = X(:, idx4);

Cov_sim = [cov(X3,X3) cov(X3,X4); cov(X4,X3) cov(X4,X4)]
Cov_teo = [13.5 13.5; 13.5 18]

