#import "@preview/klaro-ifsc-sj:0.1.0": report

#show: doc => report(
  title: "Avaliação 3 de Processos Estocásticos",
  subtitle: "Caso contínuo: Variáveis aleatórias conjuntamente distrbuídas, 
  distribuição condicional e covariância",
  // Se apenas um autor colocar , no final para indicar que é um array
  authors: ("Lucas Costa Fontes",),
  date: "05 de maio de 2024",
  doc,
)

#set text(lang: "pt")
#set text(18pt)

= Enunciado
#set text(16pt)

#figure(
  image("images/Enunciado3.png"),
  caption: "Enunciado da Avaliação",
  supplement: [Figura],
)<Enunciado>


#pagebreak();

#set text(18pt)
= Resolução

#set text(16pt)

== Determinando o valor da constante k

Quando observamos a @Enunciado, verificamos que a área sombreada proposta pelo enunciado possui 6 quadrados de dimensões 10x10. Essa observação pode ser útil para realizarmos o cálculo da constante k, haja visto que para encontrarmos ela, precisamos da área total da figura.
\
Temos que toda a PDF conjunta deve possuir valor total igual a 1, portanto, a seguinte igualdade deve ser satisfeita neste caso: $A_(6square) times k eq 1$.
\
Se invertermos a igualdade acima podemos encontrar o valor de k, de modo que teremos: $k = 1/(A_(6square))$, onde $A_(6square)$ representa a área dos 6 quadrados, ou seja, a área total da figura.
\
Resolvemos então a equação e descobrimos logo o valor da constante k:
\
$ k = 1/((10²)times 6)   = 1/(100 times 6) = 1/600 $<Equacao1>

#pagebreak()

== Determinando Pr[X $>= Y$]
Para que possamos descobrir o valor da probabilidade de X ser maior que Y, nós realizaremos a seguinte sequência de passos:
\
- Traçaremos uma reta x = y no gráfico

- Iremos somar o valor das áreas das figuras que ficaram abaixo dessa reta no gráfico, afinal representam valores onde $X >= Y$

- Calcularemos a área total que ficou abaixo da reta x = y;

- Por fim, será feita a razão entre a área encontrada abaixo da reta x = y e a área total da figura. O resultado desta razão, será o valor de Pr[$X>=Y$].

Começamos então traçando uma reta x = y no gráfico e pegando a área que ficou abaixo dessa reta, como observado na figura abaixo:

#figure(
  image("images/Hashurada_media.png"),
  caption: "Gráfico de Pr[X >= Y]",
)<Figura2>

Ao avaliaiarmos a imagem acima, verificamos que temos 3 quadrados de dimensões 10x10 e um triângulo de altura e base com valores iguais a 10 abaixo da reta que delimita x = y. A soma da área de todas essas figuras representa a área de $X >= Y$ e, a Pr[$X>=Y$], será encontrada se obtivermos a razão: $ A_(X>=Y)/A_(6square) $.
\
A parte do denominador já foi obtida no cálculo da @Equacao1 que foi utilizada para encontrar a constante k, portanto, já é sabido que $A_(6square) = 600$, agora falta apenas encontrar o numerador e obter a probabilidade solicitada no enunciado.
\
Para encontrarmos o numerador da fração, vamos somar as áreas que estão abaixo da reta x = y, de modo que teremos: $A_(X>=Y) = A_(3square) plus A_(Delta)$. Com isso em mente, resolvemos o numero da fração de Pr[$X>=Y$]:
$ A_(X>=Y) = [(10^2) times 3] plus (10 times 10)/2 = 300 + 50 = 350u.A $.
E, agora temos condições de determinar Pr[$X>=Y$]:
$ Pr[X>=Y] = 350/600 = 7/12 $

#pagebreak()

== Determinando e esboçando PDF marginal de Y

=== Determinando PDF marginal de Y
Para determinarmos a PDF marginal de Y, precisamos analisar a área hashurada e verificar que há muitos casos para serem calculados. Como é a PDF marginal de Y, nós precisamos integrar caminhando pelo eixo X, utilizando a constante k como integrando, já que trata-se da PDF conjunta da questão. Analisando a geometria do problema, nós iremos dividir o cálculo da PDF em 5 casos:

- Se $y < minus 10$;

- Se $-10 <= y < 0$;

- Se $0 <= y < 20$;

- Se $20 <= y < 30$;

- Se $y > 30$.

Após deixarmos enunciado em como separaremos as etapas, nós iremos executar as integrais caminhando no eixo X para cada caso listado acima.
\
\
*Caso $y < minus 10$:*

$ f_(Y) (y) = integral^(x = infinity)_(x = -infinity) 0 d x = 0 $ 

Como podemos observar, não há integrando quando Y é menor que -10, portanto o resultado da integral é zero.
\
\
*Caso $-10 <= y <0$:*

$ f_(Y) (y) = integral_(x = 0)^(x = 20) 1/600 d x = [x/600]_(0)^(20) = 20/600 - 0/600 = 20/600 = 1/30 $
\
*Caso $0 <= y < 20$:*

$ f_(Y) (y) = integral_(x = 10)^(x = 20) 1/600 d x = [x/600]_(10)^(20) = 20/600 - 10/600 = 10/600 = 1/60 $
 
Se pararmos para analisar o resultado dessa última integral, faz sentido, pois é o mesmo integrando com um intervalo que é a metade do intervalo anterior
\
\
*Caso $20 <= y < 30$:*

$ f_(Y) (y) =integral_(x = 0)^(x = 20) 1/600 d x = 1/30 $

*Caso $y > 30$:*

$ f_(Y) (y) = integral_(x = -infinity)^(x = infinity) 0 d x = 0 $

Fazendo um sumário do que obtivemos nos cálculos anteriores, temos que:

$ f_Y(y) := cases(
   0", se " y <= -10,
   1/30", se " -10 <= y < 0,
   1/60", se " 0 <= y < 20,
   1/30", se " 20 <= y < 30,
   0", se " y > 30
) $

#pagebreak()

=== Esboçando PDF marginal de Y
Com o que obtivemos pelos cálculos anteriores, podemos finalmente esboçar a PDF marginal de Y:

#figure(
  image("images/PDF_Marginal_de_Y.png"),
  caption: "Gráfico da PDF marginal de Y",
  supplement: [Figura]
)<Figura3>

#pagebreak()

== Determinando e esboçando CDF marginal de Y

=== Determinando CDF marginal de Y
Aqui, para que possamos resolver a CDF marginal de Y, também vamos precisar perceber que os cálculos se dividem em casos. A CDF marginal de Y irá depender de onde nós posicionamos o Y no gráfico na PDF presente na @Figura3. Como a CDF se trata de uma cumulativa, temos que fazer o cálculo do seguinte modo para cada um dos casos:

- Caso y < -10:

$ F_(Y)(y) = integral_(-infinity)^(y) 0d u = 0 $

- Caso $-10 <= y < 0$:

$ F_(Y)(y) = 0 plus integral_(-10)^(y) 1/30 d u = [u/30]_(-10)^(y) = y/30 +10/30 = (y+10)/30 $

- Caso $0 <= y < 20$:

$ F_(Y)(y) = (0+10)/30 plus integral_(0)^(y) 1/60d u = 10/30 + [u/60]_ (0)^(y) = (y+20)/60 $

- Caso $20 <= y < 30$:

$ F_(Y)(y) =  (20+20)/60 plus integral_(20)^(y) 1/30d u = (40)/60 plus [u/30]_(20)^(y) = (2y)/60 $

- Caso $y >= 30$:
$ F_(Y)(y) = (2 times 30)/60 plus integral_(30)^(infinity) 0d u= 60/60 plus 0 = 1 $

Portanto, fazendo os cálculos cumulativos acima, temos a CDF da marginal de Y: 

$ F_Y(y) := cases(
   0", se " y <= -10,
   (y+10)/30", se " -10 < y < 0,
   1/3", se " y = 0,
   (y+20)/60", se " 0 <= y < 20,
   2/3", se " y = 20,
   (2y)/60", se " 20 <= y < 30,
   1", se " y >= 30
) $

=== Esboçando CDF marginal de Y
#figure(
  image("images/CDF_Marginal_Y.png"),
  caption: "Gráfico da CDF Marginal de Y",
  supplement: [Figura]
)

#pagebreak()

== Determinando e esboçando a PDF condicional de [$Y|X=5$]

=== Determinando a PDF condicional de [$Y|X=5$]
Para que possamos determinar aqui PDF [$Y|X = 5$], vamos precisar definir o valor da equação $ (f_(X,Y)(5,y))/f_X(5) $<Equacao17>.
\
Para que seja menos custoso realizar todos os cálculos aqui necessários, vamos começar fazendo o denominador da fração.
\
Podemos descobrir a PDF marginal de X para o seguinte caso $0<=X<=10$, afinal, X = 5 está nesse intervalo. Realizamos isso com a integral abaixo caminhando no eixo y no x = 5:

$ f_X(5) = integral_(y = -10)^(y = 0) 1/600 d y plus integral_(y = 20)^(y = 30) 1/600 d y = 10/600 plus 10/600 = 1/30 $

Com isso realizado, agora basta encontrarmos o numerador da @Equacao17 para podermos finalmente encontrar a resposta do enunciado.
\
Sabemos que quando temos $f_(X,Y)(5,y)$, estamos na região do gráfico em que se traça uma reta x = 5. Nessa região do gráfico nós temos que a PDF conjunta é a constante k, a qual sabemos que já é $1/600$, se estivermos no intervalo $-10<=y<=0$ ou no intervalo $20 <= y <= 30$.
\
Podemos representar isso com a seguinte notação:

$ f_(X,Y)(5,y) := cases(
   1/600", se " (-10<=y<=0) or (20 <= y <= 30),
   0", c.c"
) $

Isso nos permite usar a notação do colchete de Iverson para $f_(X,Y)(x,y)$:
$ f_(X,Y)(5,y) = (1/600)[(-10 <= y <= 0) or (-20 <= y <= 30) ] $
Quando aplicamos $f_X(5)$ e $f_(X,Y)(5,y)$, na @Equacao17 e consideramos que estamos nos intervalos de X que faz com que o colchete de Iverson seja verdadeiro (ou seja, 1), nós tempos que:

$ (f_(X,Y)(5,y))/(f_X(5)) = (1/600)/(1/30) = 30/600 = 1/20 $.
\
Podemos denotar o que obtivemos acima com a notação de colchetes de Iverson, uma vez que o resultado da fração só será $1/20$ se nos intervalos $-10<=y<=0$ e $20<=y<=30$:

$ f_(Y)(Y|X=5) := cases(
   1/20", se " (-10<=y<0) or (20 <= y < 30),
   0", c.c"
) $



=== Esboçando a PDF condicional [Y|X=5]
Após equacionarmos essa PDF condicional, nós podemos finalmente esboçar o seu gráfico:
#figure(
  image("images/PDF_Marginal_Y_DadoX_5.png"),
  caption: "Gráfico da PDF condicional de Y dado que X = 5",
  supplement: [Figura]
)

#pagebreak()

== Determinando a covariância entre X e Y
Para determinar a covariância de X e Y precisamos de E[X], E[Y] e E[XY], afinal, cov[X,Y] = E[XY] - E[X] x E[Y].
\
Partindo desse princípio, temos o desenvolvimento a seguir:
\
Como temos liberdade de escolha, caminharemos pelo eixo x para deterimnar os valores esperados.
\
Começamos calculando E[X]:

$ E[X] = integral_(x = -infinity)^(x = infinity)integral_(y = - infinity)^(y = infinity) x f_(X,Y)(x,y)d y d x $

$ E[X] = integral_(x=0)^(x=10)[integral_(y=-10)^(y=0) x/600 d y plus integral_(y=20)^(y=30) x/600d y]d x \
plus  integral_(x=10)^(x=20) integral_(y=-10)^(y=30) x/600d y d x \
E[X] = integral_(x=0)^(x=10)[(x/600)[y]_(-10)^(0) plus (x/600)[y]_(20)^(30)]d x plus integral_(x=10)^(x=20) (x/600)[y]_(-10)^(30)d x \ 
E[X] = integral_(x=0)^(x=10) [x/600 (10) plus x/600 (10)]d x plus integral_(x=10)^(x=20) x/600 (40)\
E[X] = integral_(x=0)^(x=10) (20x)/600 d x plus integral_(x=10)^(x=20) (40x)/600\
E[X] = 1/60 [x²]_(0)^(10) plus 2/60 [x²]_(10)^(20) = 1/60 (10²) plus 2/60 (20² - 10²) = 100/60 plus 600/60 \
E[X] = 700/60 = 35/3  $
\

#pagebreak()
Em seguida calculamos E[Y]:

$ E[Y] = integral_(x = -infinity)^(x = infinity)integral_(y = - infinity)^(y = infinity) y f_(X,Y)(x,y)d y d x $

$ E[Y] = integral_(x=0)^(x=10)[integral_(y=-10)^(y=0) y/600 d y plus integral_(y=20)^(y=30) y/600d y]d x \
plus integral_(x=10)^(x=20) integral_(y=-10)^(y=30) y/600 d y d x \
E[Y] = integral_(x=0)^(x=10) [1/1200 [y²]_(-10)^(0) plus 1/1200 [y²]_(20)^(30)]d x \ 
plus integral_(x=10)^(x=20) 1/1200 [y²]_(-10)^(30)d x\
E[Y] = integral_(x=0)^(x=10) {1/1200 [0² - (-10²)] plus 1/1200 (30^2 - 20²)}d x \ 
plus integral_(x=10)^(x=20) {1/1200 [30² - (-10²)] }d x \
E[Y] = integral_(x=0)^(x=10)[ -100/1200 plus 500/1200]d x plus integral_(x=10)^(x=20) [900/1200 - 100/1200]d x\
E[Y] = integral_(x=0)^(x=10) 400/1200 d x plus integral_(x=10)^(x=20)  
800/1200 d x \
E[Y] = 1/3 [x]_(0)^(10) plus 2/3 [x]_(10)^(20) = 10/3 plus 20/3 = 30/3 = 10 $
#pagebreak()

Por fim, calculamos E[XY]

$ E[X Y] = integral_(x = -infinity)^(x = infinity)integral_(y = - infinity)^(y = infinity) x y f_(X,Y)(x,y)d y d x $

$ E[X Y] = integral_(x=0)^(x=10)[integral_(y=-10)^(y=0) (x y)/600 d y plus integral_(y=20)^(y=30) (x y)/600d y]d x \
plus integral_(x=10)^(x=20) integral_(y=-10)^(y=30) (x y)/600 d y d x\ 
E[X Y] = integral_(x=0)^(x=10) {x/1200 [y²]_(-10)^(0) plus x/1200 [y²]_(20)^(30) } plus integral_(x=10)^(x=20) {x/1200 [y²]_(-10)^(30)}\
E[X Y] = integral_(x=0)^(x=10) (400x)/1200 d x plus integral_(x=10)^(x=20) (800x)/1200 d x\
E[X Y] = 400/2400 [x²]_(0)^(10) plus 800/2400 [x²]_(10)^(20) = 1/6 (100) plus 1/3 (300)\
E[X Y] = 100/6 plus 300/3 = 350/3 $
\
Após tudo isso, finalmente chegamos na covariância entre X e Y:
\
$ "cov"[X,Y] = 350/3 minus 35/3 times 10 = 350/3 minus 350/3 = 0 $.
\
Chegamos no resultado que a covariância entre as variáveis aleatórias X e Y é igual a zero, isso significa dizer que ambas não possuem dependência linear entre si.


