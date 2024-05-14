clear all; close all; clc;
pkg load statistics;

N = 100000;  % Número de realizações

dx = 0.05; x = -1.2 : dx : 1.2;
dy = 0.05; y = -1.2 : dy : 1.2;

X = zeros(1, N);
Y = zeros(1, N);

for i = 1 : N
  do
    X(i) = 2 * rand() - 1;
    Y(i) = 2 * rand() - 1;
  until X(i)^2 + Y(i)^2 <= 1  % Checa se está dentro do circulo
end

% PDF conjunta de X e Y

[xx, yy] = meshgrid(x, y);

pdfXY_sim = hist3([X' Y'], {x, y})' / (N*dx*dy);
pdfXY_teo = (1/pi) * (xx.^2 + yy.^2 <= 1);

% PDF marginal de X

pdfX_sim = hist(X, x) / (N * dx);
pdfX_teo = (2 / pi) * sqrt(1 - x.^2) .* (-1 <= x & x <= 1);

% PDF condicional de X dado Y = y0

eps = 0.02;
y0 = [0, 0.5, 0.8, 0.95];

pdfX_condY_sim = zeros(length(y0), length(x));
pdfX_condY_teo = zeros(length(y0), length(x));
for i = 1 : length(y0)
  X_condY = X(abs(Y - y0(i)) <= eps);
  pdfX_condY_sim(i, :) = hist(X_condY, x) / (length(X_condY) * dx);
  pdfX_condY_teo(i, :) = 0.5 / sqrt(1 - y0(i)^2) * (abs(x) <= sqrt(1 - y0(i)^2));
end

% Plots

figure; hold on; grid on;
scatter(X(1:5000), Y(1:5000));
axis('square');
xlabel('x'); ylabel('y');

figure;
subplot(1, 2, 1); hold on; grid on;
surf(xx, yy, pdfXY_sim);
view(135, 30); zlim([0 0.4]);
xlabel('x'); ylabel('y'); zlabel('f_{X,Y}(x, y)');
subplot(1, 2, 2); hold on; grid on;
surf(xx, yy, pdfXY_teo);
view(135, 30); zlim([0 0.4]);
xlabel('x'); ylabel('y'); zlabel('f_{X,Y}(x, y)');

figure; hold on; grid on;
bar(x, pdfX_sim, 'y');
plot(x, pdfX_teo, 'b', 'LineWidth', 4);
xlabel('x'); ylabel('f_X(x)');

figure;
for i = 1 : 4
  subplot(2, 2, i); hold on; grid on;
  bar(x, pdfX_condY_sim(i, :), 'y');
  plot(x, pdfX_condY_teo(i, :), 'b', 'LineWidth', 4);
  xlabel('x'); ylabel(sprintf('f_X(x | Y=%d)', y0(i)));
  ylim([0, 2]);
end
