#import "@preview/klaro-ifsc-sj:0.1.0": report
#set text(lang: "pt")

#show: doc => report(
  title: "Avaliação 7 de Processos Estocásticos",
  subtitle: "Processos Estocásticos",
  // Se apenas um autor colocar , no final para indicar que é um array
  authors: ("Lucas Costa Fontes",),
  date: "27 de Agosto de 2024",
  doc,
)

#set text(18pt)

= Enunciado

#set text(14pt)
#figure(
  image("figures/Enunciado7.png", width: 100%),
  caption: "Enunciado da Avaliação",
  supplement: [Figura],
)<Enunciado>

#pagebreak()
#set text(18pt)

= Desenvolvimento

#set text(14pt)

== Determinando e esboçando $C_X [n]$

=== Determinando $C_X [n]$
Ao analisarmos o enunciado vemos que X[$n$] se distribui de modo que:
$ X[n] dash.wave^("iid") N(0,2) $
Agora, se verificarmos que precisamos encontrar a função autocovariância do processo estocástico e, recorrendo à fórmula da função autocovariância de um processo estocástico, temos que:
$ X[n_1,n_2] = "cov"[X[n_1],X[n_2]] $
Porém, ao analisarmos que as variáveis aleatórias são independentes, podemos afirmar que são descorrelacionadas, e se são descorrelacionadas, então a covariância entre elas é 0 a não ser que $n_1 = n_2$. Desse modo, teremos uma variância, de maneira que, se dissermos que $n_1,n_2=ell$ (ou seja, $n_2 - n_1 = ell$), então chegamos na conclusão que:

$ C_X [ell] := cases(
   2", se " ell = 0 "ou, se " n_1=n_2,
   0", se " ell eq.not 0 "ou, se" n_1 eq.not n_2
) $
=== Esboçando $C_X [n]$
#figure(
  image("figures/Gráfico_Cx[l].jpg", width: 100%),
  caption: "Gráfico de autocovariância de X[n]",
  supplement: [Figura],
)

== Determinando e esboçando $C_Y [n]$ sem usar o domínio da frequência

=== Determinando $C_Y [n]$
Para determinarmos a função do enunciado, podemos sair direto pela fórmula da covariância:

$ C_Y [n_1,n_2] = "cov"[Y_n_1,Y_n_2] \
  = E[Y_n_1,Y_n_2] - cancel(E[Y_n_1])cancel(E[Y_n_2]) \
  = E[(3X_n_1 + 4X_(n_1 - 1)) (3X_n_2 +4X_(n_2 - 1)] \
  = E[9X_n_1X_n_2 + 12X_n_1X_(n_2 - 1) + 12X_(n_1 - 1)X_n_2 + 16X_(n_1-1)X_(n_2-1)]\
  = 9 times E[X_n_1X_n_2] + 12 times E[X_n_1X_(n_2-1)] + 12 times E[X_(n_1 - 1)X_n_2] + 16 times E[X_(n_1 - 1)X_(n_2-1)] \
  = 9 times C_X [n_1,n_2] + 12 times C_X [n_1, n_2 - 1] + 12 times C_X [n_1-1, n_2] + 16 times C_X [n_1-1,n_2-1] \
  = 9 times C_X [ell] + 12 times C_X [ell -1] + 12 times C_X [ell + 1] + 16 times C_X [ell] \
  = 25 times 2delta[ell] + 12 times 2delta[ell-1] + 12 times 2delta[ell + 1]\
  = 50delta[ell] + 24delta[ell-1] + 24delta[ell+1]
$

Com os cálculos acima, chegamos na conclusão que:
$ C_Y [ell] := cases(
   50 ", se " ell=0 "ou, se " n_1=n_2,
   24 ", se " ell=-1 "ou, se" n_1 - n_2 = 1,
   24 ", se " ell=1 "ou, se" n_2 - n_1 = 1,
   0 ", se" abs(ell)>=2 "ou, caso" n_2-n_1 >= 2 "ou" n_1-n_2 >= 2 
) $

=== Esboçando $C_Y [n]$
#figure(
  image("figures/Grafico_CY[l]2.jpg", width: 90%),
  caption: "Gráfico de autocovariância de Y[n]",
  supplement: [Figura],
)

#pagebreak()
== Determinando $C_Y [ell]$, utilizando o domínio da frequência

Primeiramente, analisamos o problema interpretando o X[$n$] sendo:
- $mu_X = 0$
- $C_X [ell] = 2delta[ell]$
- $S_X [Phi] = F {2delta[ell]} = 2 $

Podemos então utilizar $h[n]$ e $h[Phi]$ sendo:
- $h[n] = 3delta[n] + 4delta[n-1]$
- $hat(h)[Phi] = 3 + 4e^(-j 2 pi Phi)$

E então podemos encontrar a PDF e, com isso a autocovariância de Y no domínio da frequência:

$ (abs(hat(h)(Phi)))^2 = abs(3 + 4e^(- j 2 pi Phi))^2\
= abs(3 + 4[cos(2pi Phi) -j sin(2pi Phi)])^2\
= [3 + 4cos(2pi Phi)]^2 + 16sin^2(2pi Phi)\
= 9 + 24cos(2pi Phi) + 16cos^2(2 pi Phi) + 16sin^2(2pi Phi) \
= 9 + 24 cos(2pi Phi) + 16(cos²(2pi Phi) + sin²(2 pi Phi)) \
= 9 +24 cos(2pi Phi) + 16\
= 25 + 24cos(2pi Phi)
$

$ S_Y(Phi) = abs(hat(h)(Phi))^2S_X (Phi)\
  = (25 + 24cos(2pi Phi)) times 2 = 50 + 48cos(2pi Phi)
$

$ C_Y [ell] = F^(-1) {S_Y(Phi)}\ 
  C_Y [ell] = F^(-1){50} + F^(-1){48cos(2pi Phi)}\
  C_Y [ell] = 50delta[l] + 24delta[ell - 1] + 24delta[ell + 1]
$

#pagebreak()
== Determinando a PDF de Y[3]
Sabemos que $Y[3]$ irá se distribuir de maneira gaussiana com média 0, afinal $X[n]$ se distribui de maneira gaussiana, logo $Y[n]$ sendo a sua saída, irá se distribuir de maneira gaussiana também. 
\
Mas ainda é necessário encontrar a variância dessa distribuição. Para encontrar a variância de Y[3], podemos aplicar: $"var"Y[3] = "cov"[Y[3],Y[3]]$. 
\
Podemos analisar que, nesse caso, $n_1=n_2=3$, ou seja, $ell=0$.
\
Guardamos essa informação e verificamos que esse processo estocástico segue todas as propriedades de um processo estocástico estacionário no sentido amplo, afinal:
- A função é par, pois $C_Y [ell-1] = C_Y [ell+1]$;
- O valor na origem é a própria variância ($C_Y [0] = sigma_Y^2$), afinal $ell=0$, significa dizer que $n_1=n_2$, em outras análises: $"cov"[n_1,n_2]$, se $n_1=n_2$, então essa covariância é $"cov"[n_1,n_1] = "var"[n_1]$;
- A desigualdade de Cauchy-Schwarz está sendo respeitada, afinal  Essa desigualdade é expressa por $-sigma_X^2 <= C_X[n] < = sigma_X^2$. \ Analisando $C_Y [ell]$, nós podemos observar claramente que a faixa de valores respeita a desigualdade de Cauchy-Schwarz para este processo estocástico ESA que é: $-50 <= C_Y [ell] <= 50$. Como $C_Y [ell]$ possui o seguinte intervalo ao analisarmos o gráfico $24 <= C_Y [ell] <= 50$, ele está dentro do intervalo da desigualdade, atendendo assim, essa propriedade.

Ao validarmos todas as propriedades e analisarmos que a relação entre $Y[n]$ e  $X[n]$ pode ser encarada como um SLIT, podemos assumir com toda a certeza que esse é um processo estocástico ESA, e aí a variância de Y[3] sai pela propriedade 2 aplicada à autocovariância anteriormente encontrada: 

$ "var"Y[3] = C_Y [0] = 50 therefore Y[3] dash.wave N(0,50) 
$

O restante é simples, pois agora basta utilizarmos a fórmula da PDF de uma distribuição gaussiana para uma única dimensão, que é expressa por:

$ F_X(x) = 1/sqrt(2pi sigma^2) exp(-((x-mu)^2)/(2sigma^2)) $<PDF_Gauss>

Aplicando esse caso particular na @PDF_Gauss, teremos que:

$ F_Y[3] = 1/sqrt(2pi times 50) exp(-(y^2)/(2 times 50)) $

#pagebreak()

== Determinando cov[Y[3],Y[4]]
Podemos analisar que, se generalizarmos essa covariância, nós teremos $C_Y [Y_("n1"),Y_("n2")]$. Se avaliarmos esse caso, temos que n1 = 3 e n2 = 4.
\
Isso significa dizer que, para esse caso:
$ ell = n_2 - n_1 = 4 - 3 = 1 $

Ou seja, como $ell =1$, já temos elementos suficientes para descobrir a covariância solicitada, pois sai pela função autocovariância $C_Y [ell]$ anteriormente calculada. Logo, ao analisarmos isso, chegamos à conclusão que:

$ C_Y [Y_3,Y_4] = 24 $

#pagebreak()

== Determinando Pr[$Y[3] > 0 | Y[1] = 1$]
Vamos primeiramente observar que Y[3] é independente de Y[1]. Podemos comprovar isso com a função autocovariância descoberta anteriormente, se analisarmos que $n_2 = 3$ e $n_1 = 1$. Isso irá nos conceder que:
$ ell = 3 - 1 = 2 $
Quando $abs(ell) >= 2$, para a autocovariância anteriormente descoberta, o seu resultado é igual a 0. Ou seja, $C_Y [Y_3,Y_1] = 0$, isso significa dizer que Y[3] e Y[1] são descorrelacionados e, como são conjuntamente gaussianos por causa da relação com $X[n]$, a descorrelação implica a independência entre eles. Saber disso, nos concede a possibilidade de realizar o seguinte procedimento:
$ Pr[Y[3] > 0 | Y[1] = 1] = Pr[Y[3] > 0] $
E agora para encontrarmos a probabilidade solicitada podemos sair pela diferença entre a probabilidade máxima de qualquer variável aleatória, que é 1, com a probabilidade de Y[3]. Se tratando de uma variável gaussiana, nós podemos utilizar a função $Phi$ para determinar a sua probabilidade.
\
Portanto, relembramos que $Y[3] dash.wave N(0,50)$ e determinamos a probabilidade solicitada:
$ Pr[Y[3] > 0] = 1 - Phi((0 - 0)/sqrt(50))\
  Pr[Y[3] > 0] = 1/2 = 50%
$