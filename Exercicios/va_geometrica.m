clear all; close all; clc

%Simulação de MonteCarlo

N = 100000; %Número de realizações
p_sucesso = 2/3; %Probabilidade de sucesso

X = zeros(1,N);

for i = 1 : N 
    do
        X(i) += 1;
    until rand() < p_sucesso
end

x = 1 : round(8/p_sucesso);

pmf_teorica = ((1-p_sucesso).^(x-1)) * p_sucesso;
pmf_sim = hist(X,x) / N;

figure; hold on; grid on;
bar(x,pmf_sim, 'y')
stem(x,pmf_teorica,'b','LineWidth',3)
xlabel('x'); ylabel('p_X(x)');

Pr_3t_Teoria = 2/3 + 2/9 + 2/27
Pr_3t_Pratica = mean(X <=3)