clear all; close all; clc;

N = 100000; % Número de realizações de um experimento

D1 = randi([1 6], 1, N); 
D2 = randi([1 6], 1, N);
X = D1 + D2;
x = 2 : 12;

pmfx_teorica = [1 2 3 4 5 6 5 4 3 2 1] / 36;
pmfx_sim = hist (X,x) / N

figure; hold on; grid on;
bar(x,pmfx_sim, 'y')
stem(x,pmfx_teorica,'b','LineWidth',3)
xlabel('x'); ylabel('p_X(x)');

Pr_primo_teo = 15/36
Pr_primo_sim = mean(((X==2)|(X==3)|(X==5)|(X==7)|(X==11)))