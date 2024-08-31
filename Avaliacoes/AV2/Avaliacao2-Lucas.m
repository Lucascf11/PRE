clc; close all; clear all;
pkg load statistics;

N = 100000; % Número de tentativas do experimento probabilístico

%------------------------------------------------------------------------------------------------------------------
% Comando Letra A
%-------------------------------------------------------------------------------------------------------------------
x = 0:6; % Vetor de valores possíveis para a variável aleatória X, variando de 0 a 6.
y = -2:4; % Vetor de valores possíveis para a variável aleatória Y, variando de -2 a 4.

% Geração de três variáveis aleatórias U1, U2 e U3 com valores inteiros uniformemente distribuídos entre 0 e 2.
% Cada vetor tem comprimento N, representando o número de tentativas do experimento.
U1 = randi([0 2], 1, N);
U2 = randi([0 2], 1, N);
U3 = randi([0 2], 1, N);

% Inicialização de vetores X e Y, que irão armazenar os valores das variáveis aleatórias X e Y.
X = zeros(1, N);
Y = zeros(1, N);

% X é definido como a soma de U1, U2 e U3.
% Y é definido como a diferença da soma de U1 e U2 com U3.
X = U1 + U2 + U3;
Y = U1 + U2 - U3;

% Estimação da função de massa de probabilidade conjunta (pmf) de X e Y com base nas simulações.
pmfXY_sim = hist3([X' Y'], {x, y}) / N

% Função de massa de probabilidade conjunta teórica para X e Y.
% Esta matriz é predefinida com base na análise teórica e normalizada pela quantidade de combinações possíveis (27).
pmfXY_teo = [ 0 0 1 0 0 0 0;
              0 1 0 2 0 0 0;
              1 0 2 0 3 0 0;
              0 2 0 3 0 2 0;
              0 0 3 0 2 0 1;
              0 0 0 2 0 1 0;
              0 0 0 0 1 0 0; ] / 27

%------------------------------------------------------------------------------------------------------------------
% Comando letra B
%-------------------------------------------------------------------------------------------------------------------
% Estimação da pmf marginal de X a partir das simulações.
pmfX_sim = hist(X, x) / N;

% Pmf marginal teórica de X.
pmfX_teo = [1/27 1/9 2/9 7/27 2/9 1/9 1/27];

% Estimação da pmf marginal de Y a partir das simulações.
pmfY_sim = hist(Y, y) / N;

% Pmf marginal teórica de Y.
pmfY_teo = [1/27 1/9 2/9 7/27 2/9 1/9 1/27];

% Plotagem das pmfs marginais de X e Y comparando simulações e teoria.

figure;
subplot(2, 2, 1); hold on; grid on;
bar(x, pmfX_sim, 'y'); % Pmf simulada de X em barras amarelas.
stem(x, pmfX_teo, 'b', 'LineWidth', 4); % Pmf teórica de X em haste azul.
xlabel('x'); ylabel('p_X(x)'); title('PMF Marginal de X');

subplot(2, 2, 2); hold on; grid on;
bar(y, pmfY_sim, 'y'); % Pmf simulada de Y em barras amarelas.
stem(y, pmfY_teo, 'b', 'LineWidth', 4); % Pmf teórica de Y em haste azul.
xlabel('y'); ylabel('p_Y(y)'); title('PMF Marginal de Y');

%------------------------------------------------------------------------------------------------------------------
% Comando letra C
%-------------------------------------------------------------------------------------------------------------------
% Inicialização de uma matriz para armazenar a pmf condicional de X dado Y, com base nas simulações.
% A matriz tem duas linhas (para Y = -2 e Y = 4) e 7 colunas (valores possíveis de X).
pmfX_condY_sim = zeros(2, 7);

% Cálculo da pmf condicional para X dado Y = -2.
XcondY = X(Y == -2); % Filtra os valores de X onde Y é igual a -2.
pmfX_condY_sim(1, :) = hist(XcondY, x) / sum(Y == -2); % Pmf condicional simulada para X dado Y = -2.
pmfX_condY_teo = [0 0 1 0 0 0 0]; % Pmf condicional teórica para X dado Y = -2.

subplot(2, 2, 3); hold on; grid on;
bar(x, pmfX_condY_sim(1, :), 'y'); % Pmf condicional simulada para X dado Y = -2 em barras amarelas.
stem(x, pmfX_condY_teo, 'b', 'LineWidth', 4); % Pmf condicional teórica para X dado Y = -2 em haste azul.
xlabel('x'); ylabel('Px(X|Y=-2)'); title('Px(X|Y=-2)');

% Cálculo da pmf condicional para X dado Y = 4.
XcondY = X(Y == 4); % Filtra os valores de X onde Y é igual a 4.
pmfX_condY_sim(2, :) = hist(XcondY, x) / sum(Y == 4); % Pmf condicional simulada para X dado Y = 4.
pmfX_condY_teo = [0 0 0 0 1 0 0]; % Pmf condicional teórica para X dado Y = 4.

subplot(2, 2, 4); hold on; grid on;
bar(x, pmfX_condY_sim(2, :), 'y'); % Pmf condicional simulada para X dado Y = 4 em barras amarelas.
stem(x, pmfX_condY_teo, 'b', 'LineWidth', 4); % Pmf condicional teórica para X dado Y = 4 em haste azul.
xlabel('x'); ylabel('Px(X|Y=4)'); title('Px(X|Y=4)');
