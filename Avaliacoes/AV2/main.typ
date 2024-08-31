#import "@preview/klaro-ifsc-sj:0.1.0": report

#show: doc => report(
  title: "Prova 2 de PRE",
  subtitle: "Variáveis aleatórias conjuntamente distribuídas e Distribuição Condicional",
  // Se apenas um autor colocar , no final para indicar que é um array
  authors: ("Lucas Costa Fontes",),
  date: "15 de Abril de 2024",
  doc,
)

#set text(20pt)
= ENUNCIADO

#set text(16pt)
\
Sejam U1, U2 e U3 $~$ Unif ({0,1,2}) variáveis aleatórias sorteadas independementemente. Sejam

$ X = U_1 + U_2 + U_3, $
$ Y= U_1+U_2-U_3, $

(a) Determine a PMF conjunta de X e Y\
(b) Determine e esboce as PMFs marginais de X e Y\
(c) Determine e esboce as PMFs condicionais de X dado que $Y=y$, para dois valores de $y epsilon S_y$ à sua escolha.

#pagebreak()

#set text(20pt)
= RESOLUÇÃO
#set text(18pt)
== Determinando a PMF conjunta
#set text(16pt)

Para que possamos descobrir a PMF conjunta entre duas variáveis aleatórias, primeiro precisamos de uma tabela com todos os resultados possíveis dos experimentos probabilísticos. Em seguida somam-se as probabilidades de X e Y assumirem conjuntamente um valor e faz-se a tabela da PMF conjunta de X e Y.
\

=== Tabela dos resultados
Os valores de X e Y foram dados pelas equações presentes no enunciado. Como as variáveis aleatórias U1, U2 e U3 assumem valores inteiros contidos no intervalo de 0 a 2 de maneira uniforme, a probabilidade é dada por $1/3 times 1/3 times 1/3=(1/3)^3=1/27$ em todas as linhas da tabela

#table(
  columns: (auto,auto,auto,auto,auto,auto),
  inset:10pt,
  align: center,
  table.header(
    table.cell(
      align: center,
      colspan: 6,
      [*Tabela dos resultados*],
    ),
    [*U1*],[*U2*],[*U3*],[*X*],[*Y*],[*Pr*],
    table.hline(y:0),
    table.hline(y:1),
    table.hline(y:2),
    table.hline(y:29),

    table.vline(x:0),
    table.vline(x:3),
    table.vline(x:5),
    table.vline(x:6),
  ),
  stroke: none,
  [0],[0],[0],[0],[0],[1/27],
  [0],[0],[1],[1],[-1],[1/27],
  [0],[0],[2],[2],[-2],[1/27],
  [0],[1],[0],[1],[1],[1/27],
  [0],[1],[1],[2],[0],[1/27],
  [0],[1],[2],[3],[-1],[1/27],
  [0],[2],[0],[2],[2],[1/27],
  [0],[2],[1],[3],[1],[1/27],
  [0],[2],[2],[4],[0],[1/27],
  [1],[0],[0],[1],[1],[1/27],
  [1],[0],[1],[2],[0],[1/27],
  [1],[0],[2],[3],[-1],[1/27],
  [1],[1],[0],[2],[2],[1/27],
  [1],[1],[1],[3],[1],[1/27],
  [1],[1],[2],[4],[0],[1/27],
  [1],[2],[0],[3],[3],[1/27],
  [1],[2],[1],[4],[2],[1/27],
  [1],[2],[2],[5],[1],[1/27],
  [2],[0],[0],[2],[2],[1/27],
  [2],[0],[1],[3],[1],[1/27],
  [2],[0],[2],[4],[0],[1/27],
  [2],[1],[0],[3],[3],[1/27],
  [2],[1],[1],[4],[2],[1/27],
  [2],[1],[2],[5],[1],[1/27],
  [2],[2],[0],[4],[4],[1/27],
  [2],[2],[1],[5],[3],[1/27],
  [2],[2],[2],[6],[2],[1/27],
)

=== Tabela da PMF conjunta de X e Y
Agora, com base na tabela onde todos os resultados do experimento probabilístico estão contidos, podemos fazer a PMF conjunta de X,Y para cada valor que as variáveis aleatórias podem assumir.
\
Analisando a tabela anterior, podemos listar os valores que X e Y podem assumir.
$X = ({0,1,2,3,4,5,6})$ e $Y = ({-2,1,0,1,2,3,4})$. Dadas essas constatações, a PMF conjunta para cada valor de X e Y é dada pela tabela abaixo:
\
#table(
  inset: 10pt,
  align: center,
  columns: (auto,auto,auto,auto,auto,auto,auto,auto),
  table.header(
    table.cell(
      align: center,
      colspan: 8,
      [*P#sub[X,Y] (x,y)*]
    ),
    table.hline(y: 0),
    table.hline(y: 1),
    table.hline(y: 2),
    table.hline(y: 9),
    
    table.vline(x: 0),
    table.vline(x: 1),
    table.vline(x: 2),
    table.vline(x: 3),
    table.vline(x: 4),
    table.vline(x: 5),
    table.vline(x: 6),
    table.vline(x: 7),
    table.vline(x: 8),
    
    [],[y = -2],[y = -1],[y = 0],[y = 1],[y = 2],[y = 3],[y = 4],
  ),
  stroke: none,
  [x = 0],[0],[0],[1/27],[0],[0],[0],[0],
  [x = 1],[0],[1/27],[0],[2/27],[0],[0],[0],
  [x = 2],[1/27],[0],[2/27],[0],[3/27],[0],[0],
  [x = 3],[0],[2/27],[0],[3/27],[0],[2/27],[0],
  [x = 4],[0],[0],[3/27],[0],[2/27],[0],[1/27],
  [x = 5],[0],[0],[0],[2/27],[0],[1/27],[0],
  [x = 6],[0],[0],[0],[0],[1/27],[0],[0],
)

#set text(18pt)

#pagebreak()

== Determinando e esboçando as PMFs marginais de X e Y

#set text(16pt)

Para determinarmos as PMFs marginais das variáveis X e Y, precisamos utilizar a definição dadas nas equações abaixo:

$ P_(X)(x) = sum_(y epsilon S_Y) P_(X,Y)(x,y) $
$ P_(Y)(y) = sum_(x epsilon S_X) P_(X,Y)(x,y) $

Desse modo, percebemos que, para encontrar as marginais de X, basta somar os valores contidos na linha em que se quer encontrar $P_X (x)$ e os valores contidos na coluna em que se quer encontrar $P_Y (y)$. Dadas essas constatações, podemos partir para a determinação das PMFs marginais de X e Y:
\
=== Determinando PMFs marginais

Primeiramente realizamos a determinação das PMFs marginais para X através da definição:

- $P_X (x = 0) = 1/27$
- $P_X (x = 1) = 1/27 plus 2/27  = 3/27 = 1/9$
- $P_X (x = 2) = 1/27 plus 2/27 plus 3/27 = 6/27 = 2/9$
- $P_X (x = 3) = 2/27 plus plus 3/27 plus 2/27 = 7/27$
- $P_X (x = 4) = 3/27 plus 2/27 plus 1/27 = 6/27 = 2/9$
- $P_X (x = 5) = 2/27 plus 1/27 = 3/27 = 1/9$
- $P_X (x = 6) = 1/27$

Em seguida realizamos o mesmo procedimento para determinarmos as PMFs de Y:

- $P_Y (y = minus 2) = 1/27$
- $P_Y (y = minus 1) = 1/27 plus 2/27 = 3/27 = 1/9$
- $P_Y (y = 0) = 1/27 plus 2/27 plus 3/27 = 6/27 = 2/9$
- $P_Y (y = 1) = 2/27 plus 3/27 plus 2/27 = 7/27$
- $P_Y (y = 2) = 3/27 plus 2/27 plus 1/27 = 6/27 = 2/9$
- $P_Y (y = 3) = 2/27 + 1/27 = 3/27 = 1/9$
- $P_Y (y = 4) = 1/27$

E finalmente, temos a tabela contendo as PMFs conjuntas de X e Y e as marginais de cada variável aleatória para cada valor que a própria pode assumir:

#table(
  inset: 7pt,
  align: center,
  columns: (auto,auto,auto,auto,auto,auto,auto,auto,auto),
  table.header(
    table.cell(
      align: center,
      colspan: 9,
      [*P#sub[X,Y] (x,y)*]
    ),
    table.hline(y: 0),
    table.hline(y: 1),
    table.hline(y: 2),
    table.hline(y: 9),
    table.hline(y: 10),
    
    table.vline(x: 0),
    table.vline(x: 1),
    table.vline(x: 2),
    table.vline(x: 3),
    table.vline(x: 4),
    table.vline(x: 5),
    table.vline(x: 6),
    table.vline(x: 7),
    table.vline(x: 8),
    table.vline(x: 9),
    
    [],[y = -2],[y = -1],[y = 0],[y = 1],[y = 2],[y = 3],[y = 4],[P#sub[X] (x)]
  ),
  stroke: none,
  [x = 0],[0],[0],[1/27],[0],[0],[0],[0],[1/27],
  [x = 1],[0],[1/27],[0],[2/27],[0],[0],[0],[1/9],
  [x = 2],[1/27],[0],[2/27],[0],[3/27],[0],[0],[2/9],
  [x = 3],[0],[2/27],[0],[3/27],[0],[2/27],[0],[7/27],
  [x = 4],[0],[0],[3/27],[0],[2/27],[0],[1/27],[2/9],
  [x = 5],[0],[0],[0],[2/27],[0],[1/27],[0],[1/9],
  [x = 6],[0],[0],[0],[0],[1/27],[0],[0],[1/27],
  [P#sub[Y] (y)],[1/27],[1/9],[2/9],[7/27],[2/9],[1/9],[1/27],[1],
)

=== Esboçando as PMFs marginais para X e Y

#figure(
  image("figures/PMF_de_X.png"),
  caption: "PMF marginal de X",
  supplement: [Figura]
)

#figure(
  image("figures/PMF_de_Y.png"),
  caption: "PMF marginal de Y",
  supplement: [Figura]
)

#set text(18pt)
#pagebreak()

== Determinando e esboçando $P_X (X|Y = y)$

#set text(16pt)
=== Determinando $P_X (X|Y = y)$

Para determinarmos o valor de X dado que Y=y, podemos utilizar a definição da PMF Condicional, onde:
$ P_X (X|Y = y) = (P_(X,Y) (x,y))/(P_Y (y)), $
Definida apenas se $P_Y (y) eq.not 0$.
\
\
Para demosntração, iremos escolher os valores y = -2 e y = 4. Portanto, temos que:

$P_X (X|Y = -2) = (P_(X,Y) (x,-2))/(P_Y (-2)) $ e
$P_X (X|Y = 4) = (P_(X,Y) (x,4))/(P_Y (4)) $
\
desse modo, já podemos aplicar as respectivas fórmulas para cada X e, logo após, fazer a tabela com os resultados:
\
\
Primeiramente começamos aplicando para Y = -2:
- $P_X (0|Y = -2) = 0 $

- $P_X (1|Y = -2) = 0 $
- $P_X (2|Y = -2) = 1$
- $P_X (3|Y = -2) = 0$
- $P_X (4|Y = -2) = 0 $
- $P_X (5|Y = -2) = 0 $
- $P_X (6|Y = -2) = 0 $,
\
Depois repetimos o mesmo procedimento para Y = 4:
- $P_X (0|Y = 4) = 0 $

- $P_X (1|Y = 4) = 0 $
- $P_X (2|Y = 4) = 0$
- $P_X (3|Y = 4) = 0$
- $P_X (4|Y = 4) = 1 $
- $P_X (5|Y = 4) = 0 $
- $P_X (6|Y = 4) = 0 $,

Por fim, após determinarmos os valores para cada X dado que Y ocorreu em -2 ou em 4, podemos partir para a tabela:

#table(
  inset: 7pt,
  align: center,
  columns: (auto,auto,auto,auto,auto,auto,auto,auto),
  table.header(
    [],[x = 0],[x = 1],[x = 2],[x = 3],[x = 4],[x = 5],[x = 6],
    
    table.hline(y:0),
    table.hline(y:1),
    table.hline(y: 3),

    table.vline(x: 0),
    table.vline(x: 1),
    table.vline(x: 8)
    
  ),
  stroke: none,
  [$P_X (X|Y = -2)$],[0],[0],[1],[0],[0],[0],[0],
  [$P_X (X|Y = 4)$],[0],[0],[0],[0],[1],[0],[0],
)

=== Esboçando $P_X (X|Y = y)$

#figure(
  image("figures/PMF_Condicional_de_X_dado_que_Y_2.png",width: 100%),
  caption: "PMF de Px(X|Y= - 2)",
  supplement: [Figura]
)

#figure(
  image("figures/PMF_Condicional_de_X_dado_que_Y_4.png",width: 100%),
  caption: "PMF de Px(X|Y= 4)",
  supplement: [Figura]
)