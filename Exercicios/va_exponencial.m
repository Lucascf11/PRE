clear all; close all; clc;

N = 1000000;

beta = 100;

X = exprnd(beta,1,N);

dx = 5 ; x = -200 : dx : 1000;

pdfx_teo = (1/beta) * exp(-x/beta) .* (x>=0);
pdfx_sim = hist(X,x) / (N*dx);

figure; hold on; grid on;
bar(x,pdfx_sim,'y');
plot(x,pdfx_teo,'b','LineWidth',4);
xlabel('x');ylabel('y');


x0=10;
Pr_teo = 1-exp(-x0/beta)
Pr_sim = mean(X<=x0)