clear all; close all; clc;
pkg load statistics;

% Probabilidade do X ser maior ou igual a Y (Comando letra B)

N = 1000000; % Número de realizações

X = zeros(1,N); % Inicializa o vetor X com zeros
Y = zeros(1,N); % Inicializa o vetor Y com zeros

% Laço que irá se repetir N vezes
i = 1;
while i <= N
  X(i) = 20 * rand(); % X é um intervalo contínuo de 0 a 20
  Y(i) = 40 * rand() - 10; % Y é um intervalo contínuo de -10 até 30

  % Vamos definir o intervalo completo da figura
  intervalo_total_de_X = 0 <= X(i) && X(i) <= 20;
  intervalo_total_de_Y = -10 <= Y(i) && Y(i) <= 30;
  intervalo_figura_completa = intervalo_total_de_X && intervalo_total_de_Y;

  % Vamos vazar o vazio da figura
  intervalo_vazio_de_X = 0 <= X(i) && X(i) <= 10;
  intervalo_vazio_de_Y = 0 <= Y(i) && Y(i) <= 20;
  intervalo_vazio_figura = intervalo_vazio_de_X && intervalo_vazio_de_Y;
  
  % O intervalo só vai iterar, se o valor dos intervalos forem diferentes, ou seja, o ponto caiu dentro do espaço hashurado 
  % do enunciado
  if (intervalo_figura_completa) != (intervalo_vazio_figura)
    i += 1;
  end
end

% Calcula a probabilidade simulada de X ser maior ou igual a Y
PrX_maior_igual_Y_sim = mean(X >= Y);
% Valor teórico da probabilidade
PrX_maior_igual_Y_teo = 7/12;

printf('Probabilidade de X ser maior ou igual a Y no simulado: %g\n', PrX_maior_igual_Y_sim);
printf('Probabilidade de X ser maior ou igual a Y na teoria: %g\n', PrX_maior_igual_Y_teo);

%------------------------------------------------------------------------------------------------------------------------

% PDF Marginal de Y (Comando letra C)

dy = 0.05; % Tamanho do intervalo para histograma
y = -15 : dy : 35; % Intervalo de valores para Y

% Histograma da variável Y
pdfY_sim = hist(Y,y) / (N * dy);
% PDF teórica para Y
pdfY_teo = 1/30 .* (-10 <= y & y < 0) + ...
           1/60 .* (0 <= y & y < 20) + ...
           1/30 .* (20 <= y & y < 30);

figure
subplot(3, 1, 1); grid on; hold on;
bar(y, pdfY_sim, 'y'); % Histograma simulado
plot(y, pdfY_teo, 'b', 'LineWidth', 4); % PDF teórica
xlabel('y'); ylabel('f_Y(y)'); title('PDF Marginal de Y')

%------------------------------------------------------------------------------------------------------------------------

% CDF Marginal de Y (Comando letra D)

% CDF simulada
cdfY_sim = cumsum(pdfY_sim) * dy;
% CDF teórica
cdfY_teo = (y + 10) / 30  .*  (-10 <= y & y < 0)  + ...
           (y + 20) / 60  .*  (0 <= y & y < 20)   + ...
           (2 * y) / 60   .*  (20 <= y & y < 30)  + ...
           1              .*  (30 <= y);

subplot(3, 1, 2); grid on; hold on;
bar(y, cdfY_sim, 'y'); % CDF simulada
plot(y, cdfY_teo, 'b', 'LineWidth', 4); % CDF teórica
xlabel('y'); ylabel('F_Y(y)'); title('CDF Marginal de Y')

%------------------------------------------------------------------------------------------------------------------------

% PDF condicional de Y dado que X é igual a 5 (Comando letra E)

% IMPORTANTE ENTENDER AQUI:
% Se o programa for executado com 1.000.000 de tentativas, o gráfico simulado ficará mais fidedigno ao gráfico teórico,
% Porém a demora para o término de execução será maior
% Se o programa for executado com 100.000 tentativas, o gráfico simulado ficará relativamente diferente do gráfico teórico,
% Mas a execução será mais rápida

% Seleciona os valores de Y onde X está entre 4 e 6
intervalo_X_5 = (4 <= X) & (X <= 6);

% Condiciona Y dado X está entre 4 e 6
Y_condX = Y(intervalo_X_5);

% PDF condicional simulada
pdfY_condX_sim = hist(Y_condX, y) / (length(Y_condX) * dy);
% PDF condicional teórica
pdfY_condX_teo = 1/20 .*  (-10 <= y & y < 0)  + ...
                 0    .*  (0 <= y & y < 20)   + ...
                 1/20 .*  (20 <= y & y < 30);

subplot(3, 1, 3); grid on; hold on;
bar(y, pdfY_condX_sim, 'y'); % PDF condicional simulada
plot(y, pdfY_condX_teo, 'b', 'LineWidth', 4); % PDF condicional teórica
xlabel('y'); ylabel('F_Y(y / X = 5)'); title('PDF condicional de Y, dado que X é 5')

%------------------------------------------------------------------------------------------------------------------------

% Covariância de X e Y (Comando letra F)

% Covariância teórica
covariancia_teorica = 0;
% Covariância simulada
covariancia_simulada = cov(X,Y);

printf('Covariância entre X e Y no simulado: %g\n', covariancia_simulada);
printf('Covariância entre X e Y na teoria: %g\n', covariancia_teorica);
