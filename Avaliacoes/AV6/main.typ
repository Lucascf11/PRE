#import "@preview/klaro-ifsc-sj:0.1.0": report
#set text(lang: "pt")

#show: doc => report(
  title: "Avaliação 6 de Processos Estocásticos",
  subtitle: "Processos de Poisson",
  // Se apenas um autor colocar , no final para indicar que é um array
  authors: ("Lucas Costa Fontes",),
  date: "25 de Agosto de 2024",
  doc,
)

#set text(18pt)

= Enunciado

#set text(14pt)
#figure(
  image("figures/Enunciado6.png", width: 130%),
  caption: "Enunciado da Avaliação",
  supplement: [Figura],
)<Enunciado>

#pagebreak()
#set text(18pt)

= Desenvolvimento

#set text(14pt)
== Determinando e esboçando a função média

Para descobrirmos a função média do processo de Poisson X(t), vamos precisar recorrer à fórmula da função média do processo de Poisson em geral:

$ mu_X(t) = lambda t[t > 0] $

Como nesse caso X(t) é uma soma entre X1(t) e X2(t), teremos que:

$ mu_X(t) = (lambda_1 + lambda_2)t[t>0] $<Soma_de_Poissons>

=== Determinando a função média

Aplicando a fórmula descrita na @Soma_de_Poissons, teremos que

$ mu_X(t) = (2,5 + 2)t[t>0] = 4,5t[t> 0] $

=== Esboçando a função média

Se esboçarmos uma possível função média obtida anteriormente, perceberemos que é uma reta com $mu_X$ em função de t valendo 4,5t para t > 0:

#figure(
  image("figures/Esbocada_Regiao.jpeg", width: 100%),
  caption: "Gráfico da média em função do tempo",
  supplement: [Figura],
)

#pagebreak()
== Determinando a probabilidade condiicional
Aqui precisamos calcular a probabilidade $Pr[X_(10,13) >=15 | X_(6,9) = 1]$.
\
Primeiramente, começamos analisando a definição de um processo de Poisson que dita que $X_("t1,t2")$ e  $X_("t1',t2'")$ são independentes, quaisquer que sejam os intervalos $("t1,t2"]$ e $("t1',t2'"]$ disjuntos.
\
Ou seja, O que ocorreu no intervalo $[6 <= t <= 9]$ em nada irá alterar o que ocorrerá no intervalo $[10 <= t <= 13]$. 
\
Matematicamente expressando a constatação acima, temos que:
$ Pr[X_(10,13) >= 15| X_(6,9) = 1] = Pr[X_(10,13) >= 15] $

E agora, para calcularmos a equação acima, basta recorrermos novamente à definição, onde temos que

$ X_("t1,t2") dash.wave "Poisson"(lambda("t2" - "t1")) $ Para qualquer que seja o intervalo (t1,t2].
\
Descobrindo o argumento dentro da distribuição de Poisson, nós teremos a média com a qual o intervalo se distribui. Isso nos auxiliará a descobrir a PMF com a seguinte equação:

$ p_X(x) = e^(-mu)mu/x!, " com" x = 0,1,2..., $

E descobrindo a PMF, para a descobrir a probabilidade acima, bastará pegar o valor máximo de uma PMF e subtrair da descoberta, fazendo o seguinte cálculo:

$ Pr[X_(10,13) >= 15] = 1 - p_X(x = 14) $

Com tudo isso bem detalhado, podemos finalmente partir para os cálculos e encontrar a probabilidade solicitada pelo enunciado:

$ X_(10,13) dash.wave "Poisson"(4,5(13-10))\
  X_(10,13) dash.wave "Poisson"(13,5) $
\
$ p_X(x) = e^(-13,5) times sum_(x = 0)^(14)((13,5^x)/x!)\
  p_X(x) = 0,6233
$
\
$ Pr[X_(10,13) >= 15] = 1 - 0,6233\
  Pr[X_(10,13) >= 15] = 0,3767 = 37,67%
$


#pagebreak()
== Determinando a probabilidade da variação de tempo entre eventos

Aqui precisaremos determinar $Pr[Delta_n > 0,1s]$ e nesse caso, podemos recorrer à seguinte fórmula:

$ Pr[T > t] = e^(-lambda t) $

Onde t é o tempo avaliado, que nesse caso, é de 0,1 segundos e portanto teremos que:

$ Pr[T>0,1] = e^(-(4,5 times 0,1)) = e^(-0,45)\
  Pr[T > 0,1] = 0,6376 = 63,76%
$


#pagebreak()

== Determinando a matriz covariância
Para começarmos nossa análise, verificamos aqui que a matriz covariância é composta por duas variáveis aleatórias, então isso irá gerar uma matriz covariância quadrada de duas dimensões, ou seja, uma matriz 2x2, cuja composição, pare este enunciado é:

$ mat("cov"[X(3),X(3)], "cov"[X(3),X(4)];
      "cov"[X(3),X(4)], "cov"[X(4)X(4)]) $

E aplicando conhecimentos de Poisson, avaliamos que a função autocovariância desse tipo de variável aleatória é dada por:

$ C_X("t1,t2") = lambda"min"{"t1,t2"}["t1,t2">0] $

Aplicando esses conhecimentos, nós teremos que a matriz covariância do enunciado poderá ser calculada do seguinte modo:

$ "cov"[X(3),X(3)] = 4,5 times "min"{3,3} = 4,5 times 3 = 13,5\
  "cov"[X(3),X(4)] = 4,5 times "min"{3,4} = 4,5 times 3 = 13,5\
  "cov"[X(4),X(3)] = 4,5 times "min"{4,3} = 4,5 times 3 = 13,5\
  "cov"[X(4),X(4)] = 4,5 times "min"{4,4} = 4,5 times 4 = 18
$

Com os cálculos elemento a elemento da matriz covariância realizados acima, finalmente teremos a matriz covariância solicitada pelo enunciado:

$ mat("13,5","13,5";
      "13,5", 18) $