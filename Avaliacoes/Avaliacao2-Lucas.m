clc; close all; clear all;
pkg load statistics;

N = 100000; % Número de tentativas do experimento probabilístico

%------------------------------------------------------------------------------------------------------------------

% Comando Letra A
x = 0:6; %x altera no intervalo de 0 a 6
y = -2:4; %y altera no intervalo de -2 a 4

%Os vetores U1 e U2 e U3 alternam no intervalo inteiro de 0 a 2, cria-se um vetor 1:N
U1 = randi([0 2], 1, N);
U2 = randi([0 2], 1, N);
U3 = randi([0 2], 1, N);

X = zeros(1, N);
Y = zeros(1, N);

% X assume a soma das variáveis U1,U2,U3, enquanto Y assume U1+U2-U3
X = U1+U2+U3;
Y = U1+U2-U3;

pmfXY_sim = hist3([X' Y'], {x, y}) / N
pmfXY_teo = [ 0 0 1 0 0 0 0;
              0 1 0 2 0 0 0;
              1 0 2 0 3 0 0;
              0 2 0 3 0 2 0;
              0 0 3 0 2 0 1;
              0 0 0 2 0 1 0;
              0 0 0 0 1 0 0;
                              ]/27

%------------------------------------------------------------------------------------------------------------------
% Comando letra B
pmfX_sim = hist(X , x) / N;
pmfX_teo = [1/27 1/9 2/9 7/27 2/9 1/9 1/27];

pmfY_sim = hist(Y , y) / N;
pmfY_teo = [1/27 1/9 2/9 7/27 2/9 1/9 1/27];

figure;
subplot(2, 2, 1); hold on; grid on;
bar(x, pmfX_sim, 'y');
stem(x, pmfX_teo, 'b', 'LineWidth', 4);
xlabel('x'); ylabel('p_X(x)'); title('PMF Marginal de X');

subplot(2, 2, 2); hold on; grid on;
bar(y, pmfY_sim, 'y');
stem(y, pmfY_teo, 'b', 'LineWidth', 4);
xlabel('y'); ylabel('p_Y(y)'); title('PMF Marginal de Y');

%------------------------------------------------------------------------------------------------------------------
% Comando letra C

%Estamos criando um vetor para a Px(X|Y=y). O vetor é de zeros, e possui 2 linhas e 7 colunas
pmfX_condY_sim = zeros(2,7);

% Primeiro fazemos o calculo quando Y é igual -2
XcondY = X(Y == -2);
pmfX_condY_sim(1, :) = hist(XcondY, x) / sum(Y == -2); % Aqui é a condicional simulada, perceba que para Y - -2, só a primeira linha do vetor deve ser preenchida
pmfX_condY_teo = [0 0 1 0 0 0 0]; % E aqui a teórica

subplot(2, 2, 3); hold on; grid on;
bar(x, pmfX_condY_sim(1, :), 'y');
stem(x, pmfX_condY_teo, 'b', 'LineWidth', 4);
xlabel('x'); ylabel('Px(X|Y=-2)'); title('Px(X|Y=-2)');

%Em seguida repetimos o procedimento para Y igual a 4
XcondY = X(Y == 4);
pmfX_condY_sim(2, :) = hist(XcondY, x) / sum(Y == 4); % % Aqui é a condicional simulada, perceba que para Y - 4, só a segunda linha do vetor deve ser preenchida
pmfX_condY_teo = [0 0 0 0 1 0 0]; % E aqui a teórica

subplot(2, 2, 4); hold on; grid on;
bar(x, pmfX_condY_sim(2, :), 'y');
stem(x, pmfX_condY_teo, 'b', 'LineWidth', 4);
xlabel('x'); ylabel('(Px(X|Y=4))'); title('Px(X|Y=4)');


