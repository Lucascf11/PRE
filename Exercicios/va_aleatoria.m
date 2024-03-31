clear all; close all; clc;

N = 1000000;  % Número de realizações

U = 4*rand(1, N);
idx1 = U <= 1;
idx2 = U > 1;
X = zeros(1, N);
X(idx1) = 2*rand(1, sum(idx1));
X(idx2) = rand(1, sum(idx2)) < 2/3;

dx = 0.01; x = -0.5 : dx : 2.5;

pdfX_sim = hist(X, x) / (N * dx);
pdfX_teo = (1/8) .* (0 < x & x < 2);  % Sem os impulsos

cdfX_sim = cumsum(pdfX_sim) * dx;
cdfX_teo = (1/4 + x/8)     .* (0 <= x & x < 1) + ...
           (7/8 + (x-1)/8) .* (1 <= x & x < 2) + ...
           1               .* (2 <= x);

           figure;

           subplot(2, 1, 1); hold on; grid on;
           bar(x, pdfX_sim, 'y');
           plot(x, pdfX_teo, 'b', 'LineWidth', 4);
           % Representando os impulsos:
           plot([0, 0], [0, 1/4], 'b', 'LineWidth', 4');
           plot([0], [1/4], 'b^', 'MarkerSize', 12, 'MarkerFaceColor', 'b');
           plot([1, 1], [0, 1/2], 'b', 'LineWidth', 4');
           plot([1], [1/2], 'b^', 'MarkerSize', 12, 'MarkerFaceColor', 'b');
           xlim([-0.5 2.5]); ylim([-0.1, 0.6]);
           xlabel('x'); ylabel('f_X(x)');

           subplot(2, 1, 2); hold on; grid on;
           plot(x, cdfX_sim, 'y', 'LineWidth', 4);
           plot(x, cdfX_teo, 'b--', 'LineWidth', 2);
           xlim([-0.5 2.5]); ylim([-0.2, 1.2]);
           xlabel('x'); ylabel('F_X(x)');

printf('Sim: E[X] = %g\n', mean(X));
printf('Teo: E[X] = %g\n', 3/4);