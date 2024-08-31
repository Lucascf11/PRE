#import "@preview/klaro-ifsc-sj:0.1.0": report

#set text(lang: "pt")

#show: doc => report(
  title: "Avaliação 5 de Processos Estocásticos",
  subtitle: "Vetores aleatórios gaussianos",
  // Se apenas um autor colocar , no final para indicar que é um array
  authors: ("Lucas Costa Fontes",),
  date: "28 de Julho de 2024",
  doc,
)

#set text(18pt)
= Enunciado

#set text(14pt)
#figure(
  image("images/Enunciado.png", width: 100%),
  caption: "Enunciado da Avaliação",
  supplement: [Figura],
)<Enunciado>
#pagebreak()

#set text(18pt)
= Resolução


#set text(14pt)

== Coletando informações do enunciado

No enunciado é dado que temos um vetor aleatório gaussiano, isso quer dizer que as variáveis aleatórias contidas nesse vetor são *conjuntamente gaussianas* e isso implica que *todas as variáveis aleatórias contidas nesse vetor são gaussianas*.
\
Outra informação dada pelo enunciado é que a média do vetor aleatório gaussiano é nula, isso nos concede o seguinte vetor média:

$ E[arrow(X)] = mu_arrow(X) =  vec(0,0,0) $

Podemos evocar a representação genérica da matriz covariância 3x3, que são as dimensões da matriz covariância concedida pelo enunciado:

$ mat("var"[X_1],"cov"[X_1,X_2],"cov"[X_1,X_3];"cov"[X_2,X_1],"var"[X_2],"cov"[X_2,X_3];"cov"[X_3,X_1],"cov"[X_3,X_2],"var"[X_3]) $

Analisando a matriz covariância dada pelo enunciado, também podemos encontrar a variância de $X_1$, $X_2$ e $X_3$:
$ "var"[X_1] = sigma^2_X_1 = 9 
\ "var"[X_2] = sigma^2_X_2 = 4 
\ "var"[X_3] = sigma^2_X_3 = 1 $

Tendo tudo isso de informação, e como base que uma variável aleatória gaussiana se distribui do seguinte modo: $X dash.wave N(mu,sigma^2)$, podemos analisar como as variáveis aleatórias $X_1$, $X_2$ e $X_3$ se distribuem de maneira gaussiana:

$ X_1 dash.wave N(0,9) 
\ X_2 dash.wave N(0,4) 
\ X_3 dash.wave N(0,1) $

Ainda analisando essa mesma matriz covariância, podemos obter o valor das covariâncias e analisar como esses valores irão impactar em termos de dependência e correlação entre as variáveis aleatórias do enunciado:

$ "cov"[X_1,X_2] = "cov"[X_2,X_1] = 2 
\ "cov"[X_1,X_3] = "cov"[X_3,X_1] = 0
\ "cov"[X_2,X_3] = "cov"[X_3,X_2] = 0 $

As covariâncias acima nos entregam algumas informações importantes sobre as variáveis aleatórias gaussianas do enunciado:

+ $X_1$ e $X_2$ possuem correlação entre si, portanto uma depende da outra
+ $X_1$ e $X_3$ são descorrelacionadas entre si
+ $X_2$ e $X_3$ são descorrelacionadas entre si

Tratando-se de variáveis aleatórias conjuntamente gaussianas, descorrelação implica independência, logo, chegamos à conclusão que $X_1$ e $X_2$ independem de $X_3$.
\
Tendo esses dados coletados agora de início, podemos recorrer a isso quando estivermos resolvendo os exercícios solicitados no enunciado dessa avaliação.

#pagebreak()

== Determinar $Pr[2 <= X_1 <= 3]$

Aqui, precisamos encontrar a probabilidade de $X_1$ assumir um valor entre 2 e 3. Já sabemos, através da coleta de informações do enunciado que, $X_1$ se distribui de maneira gaussiana. Dada essa constatação, para encontrarmos a probabilidade de uma variável aleatória gaussiana se situar em um intervalo qualquer, podemos utilizar uma subtração de função $Phi$, que é expressa por:

$ Pr[a <= X <= b] = Phi((b - mu_X)/sigma_X) - Phi((a - mu_X)/sigma_X) $<Funcao_Phi>

Utilizando os dados do enunciado e aplicando na @Funcao_Phi definimos que:

$ Pr[2 <= X <= 3] = Phi((3 - 0)/sqrt(9)) - Phi((2 - 0)/sqrt(9))
\ Pr[2 <= X <= 3] = Phi(3/3) - Phi(2/3) = Phi(1) - Phi(2/3)
\ Pr[2 <= X <= 3] = 0.093837 = 9,3837% $

Através dos cálculos, chegamos à conclusão que a probabilidade de $X_1$ estar no intervalo entre 2 e 3 é de 9,3837%. 
\
Para calcular o resultado, utilizamos o auxílio do software *Octave*.

#pagebreak();

== Determinar $Pr[2 <= X_1 <= 3 | X_2 = 2]$

Para determinarmos a probabilidade solicitada pelo enunciado, precisamos primeiramente fazer algumas análises. Já verificamos anteriormente que $X_1$ e $X_2$ são correlacionadas, haja visto que a covariância entre ambas é diferente de 0. Sendo assim, há uma dependência entre elas. Isso faz com que tenhamos que, primeiramente encontrar a PDF condicional de $X_1|X_2=3$, para somente depois, aplicarmos a @Funcao_Phi e encontrarmos a probabilidade em questão.
\
Para descobrirmos a PDF condicional mencionada anteriormente, teremos que realizar a seguinte operação:

$ f_(X_1)(x_1|X_2 = 2) = (f_(X_1,X_2)(x_1,2))/(f_(X_2)(2)) $<X1_dadoque_X2>

Para encontrarmos o numerador dessa fração, precisaremos aplicar a fórmula da gaussiana multidimensional:

$ f_(arrow(X))(arrow(x)) = (1)/sqrt((2pi)^n"det"C)exp(-1/2(arrow(x) - arrow(mu))^T C^(-1)(arrow(x) - arrow(mu))) $<gaussiana_multidimensional>

Para encontrarmos o denominador da fração descrita na @X1_dadoque_X2 utilizaremos a mesma fórmula. porém adaptada para n = 1:

$ F_X (x) = 1/sqrt(2pi sigma^2)exp(-(x - mu)^2/(2sigma^2)) $<variavel_aletoria_gaussiana>

Assim sendo, podemos começar o cálculo da probabilidade solicitada no enunciado. Iremos começar calculando o numerador da  @X1_dadoque_X2. Para isso, iremos primeiramente descobrir alguns dados importantes para aplicarmos na @gaussiana_multidimensional:

$ n = 2 " " " " " " C = mat(9,2;2,4) " " " " " "  arrow(x) = vec(X_1,X_2) " " " " " " X_2 = 2 " " " " " " arrow(mu) = vec(0,0)
\ "det"C = (9 times 4) - (2 times 2) = 36 - 4 = 32  
\ C^(-1) = 1/32 mat(4,-2;-2,9)  $

$ f_(X_1,X_2)(x,2) = 1/sqrt((2pi)^2 32)exp(-1/2mat(X_1,2) 1/32mat(4,-2;-2,9)mat(X_1;2)) 
\ f_(X_1,X_2)(x,2) = 1/sqrt((2pi)^2 32)exp(-1/2 times 1/32 mat([4X_1 - 4], [-2X_1 + 18])mat(X_1;2))
\ f_(X_1,X_2)(x,2) = 1/sqrt((2pi)^2 32)exp(-1/2 times 1/32 (4X_1^2 - 4X_1 - 4X_1 + 36 ))
\ f_(X_1,X_2)(x,2) = 1/sqrt((2pi)^2 32)exp(-1/2 times (4X_1^2 - 8X_1 + 36 )/32) $

Temos o numerador da @X1_dadoque_X2, agora calculamos o seu denominador utilizando a @variavel_aletoria_gaussiana:

$ X_2 dash.wave N(0,4)
\ f_(X_2)(2) = 1/sqrt(2pi (4))exp(-1/2 times (2-0)^2/4) 
\ f_(X_2)(2) = 1/sqrt(2pi (4))exp(-1/2 times 4/4) 
\ f_(X_2)(2) = 1/sqrt(2pi (4))exp(-1/2 times 1) 
 $

Temos toda a fração da @X1_dadoque_X2, finalmente podemos encontrar a probabilidade solicitada:

$ f_X_1(x_1|X_2 =2) = (1/sqrt((2pi)^cancel(2) 32)exp(-1/2 times (4X_1^2 - 8X_1 + 36 )/32)) / (1/sqrt(cancel(2pi) (4))exp(-1/2 times 1) ) 
\ f_X_1(x_1|X_2 =2) = 1/sqrt((2pi) 8)exp(-1/2 times (4X_1^2 - 8X_1 + 4)/32 ) 
\ f_X_1(x_1|X_2 =2) = 1/sqrt((2pi) 8)exp(-1/2 times (X_1^2 - 2X_1 + 1)/8 ) 
\ f_X_1(x_1|X_2 =2) = 1/sqrt((2pi) 8)exp(-1/2 times (X_1 - 1)^2/8 ) 
 $

 Com esse cálculo, nós descobrimos que: 

 $ X_1 | X_2 = 2 " " " " dash.wave " " " "N(1,8) $

 Desse modo, nós podemos finalmente calcular $Pr[2 <= X_1 <= 3 | X_2 = 2]$, pois sai pela @Funcao_Phi:

 $ Pr[2 <= X_1 <= 3 | X_2 = 2] = Phi((3 - 1)/sqrt(8)) - Phi((2 - 1)/sqrt(8)) 
\  Pr[2 <= X_1 <= 3 | X_2 = 2] = Phi((2sqrt(8))/8) - Phi((sqrt(8))/8)
\  Pr[2 <= X_1 <= 3 | X_2 = 2] = 0,1221
\  Pr[2 <= X_1 <= 3 | X_2 = 2] = 12,21%
  $

Com isso, chegamos na conclusão que, a probabilidade para que $X_1$ esteja no intervalo entre 2 e 3, dado que $X_2 = 2$, é de 12,21%.
\
Novamente, utilizamos o software *Octave* para auxiliar no cálculo da função $Phi$


#pagebreak();

== Determinar $Pr[2 <= X_1 <= 3 | X_2 = 2 and X_3 = 3]$

Novamente, assim como fizemos na questão anterior, antes de determinar a probabilidade solicitada, nós precisamos fazer algumas análises. Já se sabe que $X_1$ depende de $X_2$. Porém, quando analisamos a matriz covariância do enunciado, nós verificamos que $X_1$ e $X_3$ são descorrelacionadas entre si, pois a covariância entre essas variáveis vale 0. Como são variáveis aleatórias conjuntamente gaussianas, a descorrelação entre elas implica independência  entre ambas. Dada essa constatação, não importa o valor que $X_3$ assume, em nada irá interferir em $X_1$. 
\
Sendo assim então:

$ Pr[2 <= X_1 <= 3 | X_2 = 2 and X_3 = 3] = Pr[2 <= X_1 <= 3 | X_2 = 2]  
\ Pr[2 <= X_1 <= 3 | X_2 = 2] = 12,21% $

Como $X_3$ em nada altera $X_1$ independente do valor que ela assuma, nós chegamos na conclusão que a probabilidade de $X_1$ estar entre o intervalo de 2 e 3 dado que $X_2 = 2$ e $X_3 = 3$ é a mesma probabilidade já calculada no exercício anterior: 12,21%

#pagebreak()

== Determinar $Pr[X_1 - X_3 > 4]$

Para descobrirmos a probabilidade solicitada pelo enunciado, primeiramente vamos definir que $Y = X_1 - X_3$. Como $X_1$ e $X_3$ se distribuem de maneira gaussiana, $Y$ se distribui de maneira gaussiana também. Podemos assumir que $Y = arrow(Y)$. Nós vamos precisar descobrir como $Y$ se distribui realizando as operações abaixo:

$ mu_arrow(Y) = A arrow(mu)_(arrow(X)) + arrow(b) $<vetor_media_Y>
$ C_arrow(Y) = A C_arrow(X)A^T $<covariancia_de_Y>

Pelas equações, logo percebemos que teremos que realizar transformações lineares afins para descobrirmos a probabilidade solicitada pelo enunciado. A @vetor_media_Y nos concede o vetor média de $arrow(Y)$ e a @covariancia_de_Y nos permite encontrar a matriz covariância de $arrow(Y)$.
\
Após compreendermos isso, podemos extrair algumas informações para aplicarmos nas equações:

$ arrow(X) = vec(X_1,X_3) " " " " " " arrow(mu)_(arrow(X)) = vec(0,0) " " " " " " C_arrow(X) = mat(9,0;0,1) " " " " " " A = mat(1,-1)  " " " " " " arrow(b) = vec(0) $

Com isso, podemos partir para os cálculos, começando pelo vetor média de $arrow(Y)$:

$ mu_arrow(Y) = mat(1,-1)vec(0,0) + vec(0) = (0) $

Em seguida, calculamos a matriz covariância de $arrow(Y)$:

$ C_arrow(Y) = mat(1,-1)mat(9,0;0,1)mat(1;-1) 
\ C_arrow(Y) = (10)
 $

Para o cálculo da matriz covariância de $arrow(Y)$, utilizamos o software *Octave*.
\
Com os cálculos anteriores, temos que:

$ Y dash.wave N(0,10) $

Após isso, fica fácil encontrarmos a probabilidade solicitada. Assumimos que a probabilidade de $X_1 - X_3 > 4$ sai pela probabilidade máxima subtraída da função $Phi$ aplicada para o valor 4:

$ Pr[X_1 - X_3 > 4] = 1 - Phi((4 - 0)/sqrt(10) )
\ Pr[X_1 - X_3 > 4] = 1 - Phi((4sqrt(10))/10)
\ Pr[X_1 - X_3 > 4] = 1 - 0,8970 = 0,1030
\ Pr[X_1 - X_3 > 4] = 10,30%
 $

Logo, chegamos na conclusão que a probabilidade de $X_1 - X_3$ ser maior que 4 vale 10,30%
\
Novamente, utilizamos o *Octave* para calcular a função $Phi$









