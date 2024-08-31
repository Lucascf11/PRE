clear all; close all; clc;
pkg load statistics;

N = 10000;  % Número de realizações
Na = 100;  % Número de amostras temporais
ns = 1 : Na;  % Eixo dos tempos (discreto)
maxlag = 4;  % Atraso máximo
ells = -maxlag : maxlag;  % Eixo dos atrasos (discreto)

%------------------------------------------------------------------------
% Inicializando as variáveis do enunciado
%------------------------------------------------------------------------
X = sqrt(2) * randn(N, Na);  % Gera a matriz X com valores aleatórios
Y = zeros(N, Na);  % Inicializa a matriz Y com zeros
for i = 1 : N
  Y(i,1) = 3 * X(i,1);  % Fazendo a realização Y[1]. Temos que ignorar X[0] aqui por causa da iteração do octave que começa em 1
  for n = 2 : Na
    Y(i, n) = 3*X(i, n) + 4*X(i, n - 1);  % Calcula os valores de Y com base em X
  end
end

%------------------------------------------------------------------------
% Comando letra A
%------------------------------------------------------------------------
CX_sim = cov(X(:, Na/2), X(:, Na/2 + ells));  % Covariância simulada de X
CX_teo = 2*(ells == 0);  % Covariância teórica de X

figure;  % Cria uma nova figura
subplot(2, 1, 1); hold on; grid on;  % Subplot para autocovariância de X
stem(ells, CX_sim, 'm', 'LineWidth', 6);  % Plota a covariância simulada
stem(ells, CX_teo, 'b', 'LineWidth', 2);  % Plota a covariância teórica
xlabel('ℓ'); ylabel('C_X[ℓ]'); title('Autocovariância de X');  % Rótulos e título
legend('C_X[ℓ] simulada','C_X[ℓ] teórica');  % Legenda

%------------------------------------------------------------------------
% Comando letra B e letra C
%------------------------------------------------------------------------
CY_sim = cov(Y(:, Na/2), Y(:, Na/2 + ells));  % Covariância simulada de Y
CY_teo = 50*(ells == 0) + 24*(ells == -1) + 24*(ells == 1);  % Covariância teórica de Y

subplot(2, 1, 2); hold on; grid on;  % Subplot para autocovariância de Y
stem(ells, CY_sim, 'm', 'LineWidth', 6);  % Plota a covariância simulada
stem(ells, CY_teo, 'b', 'LineWidth', 2);  % Plota a covariância teórica
xlabel('ℓ'); ylabel('C_Y[ℓ]'); title('Autocovariância de Y');  % Rótulos e título
legend('C_Y[ℓ] simulada','C_Y[ℓ] teórica');  % Legenda

%------------------------------------------------------------------------
% Comando letra D
%------------------------------------------------------------------------
sigma = sqrt(50);  % Desvio padrão teórico
dy = 0.25; y = -4*sigma : dy : 4*sigma;  % Intervalo para a densidade de probabilidade

Y3 = Y(:,3);  % Pega a coluna 3 de Y, onde estão as realizações de Y[3]
PDF_Y3_Sim = hist(Y3,y) / (N * dy);  % Histograma da densidade de probabilidade simulada
PDF_Y3_Teo = (1 / sqrt(2*pi*sigma^2)) * exp(-(y).^2 / (2*sigma^2));  % Densidade de probabilidade teórica

figure; hold on; grid on;  % Cria uma nova figura
bar(y, PDF_Y3_Sim, 'y');  % Plota a densidade de probabilidade simulada
plot(y, PDF_Y3_Teo, 'b', 'LineWidth', 4);  % Plota a densidade de probabilidade teórica
xlabel('y'); ylabel('F_Y[[3](y)'); title('PDF de Y[3]')  % Rótulos e título
legend('PDF de Y[3] simulada','PDF de Y[3] teórica');  % Legenda

%------------------------------------------------------------------------
% Comando letra E
%------------------------------------------------------------------------
Y4 = Y(:,4);  % Pega a coluna 4 de Y

cov_Y3_Y4_sim = cov(Y3,Y4);  % Covariância simulada entre Y[3] e Y[4]
cov_Y3_Y4_teo = 24;  % Covariância teórica fornecida

printf('Pr[cov[Y[3],Y[4]]] simulada: %g\n', cov_Y3_Y4_sim);  % Imprime a covariância simulada
printf('Pr[cov[Y[3],Y[4]]] calculada: %g\n', cov_Y3_Y4_teo);  % Imprime a covariância teórica

%------------------------------------------------------------------------
% Comando letra F
%------------------------------------------------------------------------
Y1 = Y(:,1);  % Pega a coluna 1 de Y
Y3_Cond = Y3(0.9 < Y1 & Y1 < 1.1);  % Y[3] dado que Y[1] está entre 0.9 e 1.1
PrY3_Maior_0_sim = mean(Y3_Cond > 0);  % Probabilidade simulada de Y[3] > 0
PrY3_Maior_0_teo = 1 - normcdf((0 - 0)/sigma);  % Probabilidade teórica de Y[3] > 0

printf('Pr[Y[3] > 0] simulada: %g\n', PrY3_Maior_0_sim);  % Imprime a probabilidade simulada
printf('Pr[Y[3] > 0] calculada: %g\n', PrY3_Maior_0_teo);  % Imprime a probabilidade teórica

% Se o número de realizações for 10000, teremos resultados não tão convergentes, porém teremos uma execução mais rápida
% Se o número de realizações for 100000, teremos resultados mais convergentes, mas isso aumentará o tempo de execução
