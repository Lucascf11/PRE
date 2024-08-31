#import "@preview/klaro-ifsc-sj:0.1.0": report

#set text(lang: "pt")

#show: doc => report(
  title: "Avaliação 4 de Processos Estocásticos",
  subtitle: "Vetores Aleatórios",
  // Se apenas um autor colocar , no final para indicar que é um array
  authors: ("Lucas Costa Fontes",),
  date: "10 de julho de 2024",
  doc,
)

#set text(18pt)
= Enunciado

#set text(14pt)

#figure(
  image("images/Enunciado4.png", width: 100%),
  caption: "Enunciado da Avaliação",
  supplement: [Figura],
)<Enunciado>

#pagebreak()


#set text(18pt)
= Resolução

#set text(14pt)

== Vetor média de $arrow(Y)$

Quando analisamos o enunciado, verificamos que as variáveis aleatórias $X_1$ e $X_2$ são independentes e igualmente distribuídas entre si, onde $a = -2 ", " b = 1 "e altura (h) = " 1/3$.
\
Já sabemos que o valor esperado do quadrado de uma variável aleatória que se distribui uniformemente de maneira contínua é expresso por $ E[X^2] = integral_(a)^(b) x²f(x)"dx", \ "onde f(x) = h." $
\
Também precisamos entender que, ao analisar que $X_1$ e $X_2$ são variáveis independentes entre si, isso faz com que elas também sejam descorrelacionadas. Isso será útil na descoberta do valor esperado e da variância de $Y_3$, por exemplo, porque com essa informação nós poderemos fazer o seguinte procedimento matemático:

$ E[X_1X_2] = E[X_1] times E[X_2] $

Para que possamos determinar o vetor média de $arrow(Y)$, vamos encontrar o valor esperado dos componentes desse vetor. Portanto devemos encontrar $E[Y_1], E[Y_2], E[Y_3]$.
\
Com base no enunciado, nós teremos que: $ E[Y_1] = E[X_(1)^2] \ E[Y_2] = E[X_(2)^2] \ E[Y_3] = E[X_1X_2] = E[X_1] times E[X_2]. $ 

De modo que temos todas as informações necessárias para a descoberta do vetor média solicitado no enunciado, podemos finalmente dar início aos cálculos e determiná-lo:

$ E[Y_1] = E[X_1^2] = integral_(-2)^(1) 1/3 x² "dx" 
\ E[Y_1] = 1/3  times [(x³)/3]_(-2)^(1)
\ E[Y_1] = 1/3 times (1³ - (-2)³)/3
\ E[Y_1] = 1/cancel(3) times cancel(3) = 1 $


Se analisarmos o enunciado, perceberemos que $E[Y_2]$ é igual a $E[Y_1]$, pois as variáveis aleatórias $X_1$ e $X_2$ se distribuem uniformemente da mesma forma, ou seja $X_1 = X_2, "logo " X_1^2 = X_2^2$.

$ E[Y_2] = E[X_2^2] = E[X_1^2] = E[Y_1] = 1 $

Antes de calcular $E[Y_3]$, podemos lembrar que, o valor esperado de uma variável aleatória com distribuição uniforme contínua é expressa por:
$ E[X] = (a+b)/2 $


Logo, seguimos para o cálculo de $E[Y_3]$:

$ E[Y_3] = E[X_1X_2]
\ E[Y_3] = E[X_1] times E[X_2]
\ E[Y_3] = (-2+1)/2 times (-2+1)/2 = ((-2+1)/2)^2
\ E[Y_3] = (-1/2)^2 = 1/4 $

Após a realização de todos os cálculos, finalmente encontramos o vetor média $arrow(Y)$:
$ E[arrow(Y)] = [1 " " 1 " " 1/4]^T = vec(1,1,1/4). $



#pagebreak()

== Matriz covariância de $arrow(Y)$

Antes de prosseguirmos para o cálculo, é interessante expressar que a matriz covariância é dada por:
$ mat("var"[Y_1], "  cov"[Y_1,Y_2], "  cov"[Y_1,Y_3];
"cov"[Y_2,Y_1], "  var"[Y_2], "  cov"[Y_2,Y_3];
"cov"[Y_3,Y_1], "  cov"[Y_3,Y_2], "  var"[Y_3] ) $

Primeiramente, começaremos calculando os componentes da diagonal principal dessa matriz, que se refere às variâncias de $Y_1", " Y_2" e " Y_3$.

$ "var"[Y_1] = E[Y_1^2] - E[Y_1]^2 
\ E[Y_1^2] = E[(X_1^2)^2] = E[X_1^4] 
\ E[X_ 1^4] = integral_(-2)^(1) 1/3 x^4 "dx"
\ E[X_1^4] = 1/3[x^5/5]_(-2)^(1) = 1/3 times (1^5 - (-2)^5)/5 = 33/15 = 11/5 
\ E[Y_1]^2 = 1^2 = 1 
\ "var"[Y_1] = 11/5 - 1 = 6/5 $

Assim como no exercício do vetor média, chegaremos na conclusão que $"var"[Y_2] = "var"[Y_1]$ pois $X_2$ se distribui uniformemente da mesma maneira que $X_1$, variável aleatória essa da qual $Y_1$ depende, assim como $Y_2$ depende de $X_2$. Logo:

$ "var"[Y_2] = "var"[X_2^4] = "var"[X_1^4] = "var"[Y_1] = 6/5. $

$ "var"[Y_3] = E[Y_3^2] - E[Y_3]^2 
\ "var"[Y_3] = E[("X1X2")^2] - E[Y_3]^2 
\ "var"[Y_3] = E[X_1^2X_2^2] - E[Y_3]^2 
\ "var"[Y_3] = E[X_1^2]E[X_2^2] - E[Y_3]^2 
\ "var"[Y_3] = 1 times 1 - (1/4)^2 = 1 - 1/16 = 15/16 $

Depois de descobertas as variâncias, podemos partir para a descoberta das covariâncias. 
\
Por simetria, já sabemos que $"cov"[Y_1,Y_2] = "cov"[Y_2,Y_1]$, $"cov"[Y_1,Y_3] = "cov"[Y_3,Y_1]$ e $"cov"[Y_2,Y_3] = "cov"[Y_3,Y_2]$.
\
Ao nos atentarmos novamente ao fato de que $X_1$ e $X_2$ são variáveis aleatórias independentes e, portanto, descorrelacionadas entre si, chegamos na conclusão que $"cov"[Y_1,Y_2] = 0$, pois $Y_1$ depende unicamente de $X_1$ e $Y_2$ depende unicamente de $X_2$. Logo $Y_1 "e " Y_2$ são descorrelacionadas entre si também, e com isso, concluímos que a covariância entre essas variáveis aleatórias é zero.
\
Para continuarmos encontrando valores para preencher  a matriz covariância de $arrow(Y)$, precisamos encontrar o valor de $"cov"[Y_3,Y_1]$ e de $"cov"[Y_3,Y_2]$. 

$ "cov"[Y_1,Y_3] = E[Y_1Y_3] - E[Y_1]E[Y_3] 
\ "cov"[Y_1,Y_3] = E[(X_1^2)(X_1X_2)] - E[Y_1]E[Y_3] 
\ "cov"[Y_1,Y_3] = E[(X_1^3)(X_2)] - E[Y_1]E[Y_3]
\ "cov"[Y_1,Y_3] = (E[X_1^3] times E[X_2]) - E[Y_1]E[Y_3]
\ *E[X_1^3] = integral_(-2)^(1) 1/3x^3 
\ *E[X_1^3] = 1/3[x^4/4]_(-2)^(1)
\ *E[X_1^3] = 1/12 [x^4]_(-2)^(1) 
\ *E[X_1^3] = 1/12 [1^4 - (-2)^4]
\ *E[X_1^3] = -15/12 
\ "cov"[Y_1,Y_3] = (-15/12 times (-1/2)) - (1 times 1/4)
\ "cov"[Y_1,Y_3] = 5/8 - 1/4 = 3/8 $

Utilizaremos a mesma argumentação que utilizamos para definir que $E[Y_2] = E[Y_1]$ e que $"var"[Y_1] = "var"[Y_2]$, para chegar na conclusão de que $"cov"[Y_1,Y_3] = "cov"[Y_2,Y_3]$. Portanto:

$ "cov"[Y_1,Y_3] = "cov"[Y_2,Y_3] = 3/8 $

Com todos os cálculos necessários, podemos finalmente preencher a matriz covariância de $arrow(Y)$:

$ C_arrow(Y) = mat(6/5, 0, 3/8;
0, 6/5, 3/8;
3/8, 3/8, 15/16) $



#pagebreak()

== Vetor média de $arrow(Z)$
Para determinarmos o vetor média de $arrow(Z)$, vamos utilizar a solução matricial para os cálculos.
\
Temos que: 

$  cases(
   Z_1 = Y_1,
   Z_2 = Y_1 + Y_2,
   Z_3 = Y_1 + Y_2 + Y_3
) $

Para encontrarmos o vetor média solicitado no enunciado com a solução matricial, vamos utilizar a seguinte fórmula:
$ E[arrow(Z)] = A times E[arrow(Y)] + arrow(b) $
Com todas as informações que precisamos para prosseguir, podemos finalmente partir para o cálculo:

$   vec(Z_1,Z_2,Z_3) = mat(1,0,0;1,1,0;1,1,1) times vec(1,1,1/4) + vec(0,0,0) 
\ vec(Z_1,Z_2,Z_3) = vec((1 times 1) + (0 times 1) + (0 times 1/4), (1 times 1) + (1 times 1) + (0 times 1/4), (1 times 1) + (1 times 1) + (1 times 1/4)) + vec(0,0,0) 
\ vec(Z_1,Z_2,Z_3) = vec(1,2,9/4) + vec(0,0,0) = vec(1,2,9/4) $

Portanto:

$ E[arrow(Z)] = [1 " "2 " " 9/4]^T $

#pagebreak()

== Matriz covariância de $arrow(Z)$
A exemplo do vetor média de $arrow(Z)$, vamos utilizar a solução matricial para encontrarmos também a matriz covariância solicitada no enunciado. A fórmula que utilizaremos é dada por:

$ C_arrow(Z) = A times C_arrow(Y) times A^T $

Temos que: 

$  cases(
   Z_1 = Y_1,
   Z_2 = Y_1 + Y_2,
   Z_3 = Y_1 + Y_2 + Y_3
) $

Dessa forma, teremos que:

$ C_arrow(Z) = mat(1,0,0;1,1,0;1,1,1) times mat(6/5,0,3/8;0,6/5,3/8;3/8,3/8,15/16) times mat(1,1,1;0,1,1;0,0,1) 
\ C_arrow(Z) = mat(6/5,6/5,63/40;6/5,12/5,63/20;63/40,63/20,387/80) $

Nesse exercício em específico, para facilitar os cálculos e encurtar o procedimento, utilizamos o software *Octave* para realizar a multiplicação entre as matrizes.