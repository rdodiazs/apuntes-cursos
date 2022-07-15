---
title: Clase 11. Espacio Matriz, Matrices de rango 1 y Gráfos de un Mundo Pequeño.
subtitle: Curso 'Linear Algebra' del MIT.
abstract: \noindent La clase pasada terminamos con un espacio vectorial que consiste de matrices, llamado __Espacio Matricial__. Vamos a profundizar en él y en otros que tampoco consisten de vectores. También estudiaremos sobre __matrices de rango 1__, su relevancia y cómo podemos obtenerlos. Finalmente, introduciremos brevemente la visualización de __Gráfos__.
lang: es
fontsize: 12pt
geometry: [margin=1in]
header-includes:
  - \usepackage{setspace} \onehalfspacing
  - \usepackage{graphicx}
  - \usepackage{amsmath}
  - \usepackage{amssymb}
---



# 11.1 Espacios vectoriales que no consisten de vectores. 

Los fundamentos de un espacio y subespacio vectorial se pueden extrapolar a objetos distintos de los vectores, como por ejemplo, las matrices.

## 11.1.1 Espacio Matriz.

Como lo vimos la clase pasada, si dejamos de lado la multiplicación entre matrices, es posible realizar __combinaciones lineales entre ellas__, pero resultan en otras matrices. El conjunto de ellas constituyen el __Espacio Matriz__ $M$.

Por ahora nos centraremos solo en matrices de $3 \times 3$ y nos referiremos a este espacio como $M_{3 \times 3}$, pero es aplicable a otras de distinta dimensión.

Una __base__ (_basis_)^[Es decir, generan (_span_) un espacio y son linealmente independientes.]  natural que tienen todas las matrices de $3 \times 3$, es la siguiente:
$$
\left(
\begin{bmatrix}
1 & 0 & 0 \\
0 & 0 & 0 \\
0 & 0 & 0
\end{bmatrix}
, \,
\begin{bmatrix}
0 & 1 & 0 \\
0 & 0 & 0 \\
0 & 0 & 0
\end{bmatrix}
, \,
\begin{bmatrix}
0 & 0 & 1 \\
0 & 0 & 0 \\
0 & 0 & 0
\end{bmatrix}
, \,
\cdots
, \,
\begin{bmatrix}
0 & 0 & 0 \\
0 & 0 & 0 \\
0 & 0 & 1
\end{bmatrix}
\right)
$$

No escribimos la secuencia completa de matrices, pero veamos que cada una consiste de ceros y un uno en cada entrada. Por lo tanto, la base está compuesta de $9$ de estas matrices, lo que significa que la __dimensión__^[La cardinalidad de una base o la cantidad de elementos de este conjunto.] de este espacio matriz es $\dim(M_{3 \times 3}) = 9$.

Un __subespacio__ de $M_{3 \times 3}$ son las __matrices simétricas__ $S_{3 \times 3}$. En general, a partir de las matrices de arriba podemos construir una __base__ por medio de $3$ matrices de cada elemento de la diagonal y $3$ de cada entrada ubicada en la parte superior derecha más una de la parte inferior izquierda. En otras palabras, su __dimensión__ es $\dim(S_{3 \times 3}) = 6$.
$$
\left(
\begin{bmatrix}
1 & 0 & 0 \\
0 & 0 & 0 \\
0 & 0 & 0
\end{bmatrix}
, \,
\begin{bmatrix}
0 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & 0
\end{bmatrix}
, \,
\begin{bmatrix}
0 & 0 & 0 \\
0 & 0 & 0 \\
0 & 0 & 1
\end{bmatrix}
, \,
\begin{bmatrix}
0 & 1 & 0 \\
1 & 0 & 0 \\
0 & 0 & 0
\end{bmatrix}
, \,
\begin{bmatrix}
0 & 0 & 1 \\
0 & 0 & 0 \\
1 & 0 & 0
\end{bmatrix}
, \,
\begin{bmatrix}
0 & 0 & 0 \\
0 & 0 & 1 \\
0 & 1 & 0
\end{bmatrix}
\right)
$$
Otro subespacio de $M_{3 \times 3}$ son las __matrices triangulares hacia arriba__ $U_{3 \times 3}$. Usando las $9$ matrices que son base del espacio vectorial señalado, la base de $U$ son todas aquellas donde los $1$ se ubican en y sobre su diagonal, lo que significa que $\dim(U_{3 \times 3}) = 6$.
$$
\left(
\begin{bmatrix}
1 & 0 & 0 \\
0 & 0 & 0 \\
0 & 0 & 0
\end{bmatrix}
, \,
\begin{bmatrix}
0 & 1 & 0 \\
0 & 0 & 0 \\
0 & 0 & 0
\end{bmatrix}
, \,
\begin{bmatrix}
0 & 0 & 1 \\
0 & 0 & 0 \\
0 & 0 & 0
\end{bmatrix}
, \,
\begin{bmatrix}
0 & 0 & 0 \\
0 & 0 & 1 \\
0 & 0 & 0
\end{bmatrix}
, \,
\begin{bmatrix}
0 & 0 & 0 \\
0 & 0 & 0 \\
0 & 0 & 1
\end{bmatrix}
, \,
\begin{bmatrix}
0 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & 0
\end{bmatrix}
\right)
$$
Algo interesante es que si intersectamos las bases de $S_{3 \times 3}$ y $U_{3 \times 3}$, obtenemos la base que genera el tercer subespacio de $M_{3 \times 3}$: las __matrices diagonales__ $D_{3 \times 3}$, cuya dimensión es $\dim(D_{3 \times 3}) = \dim(S_{3 \times 3} \cap U_{3 \times 3}) = 3$.
$$
\left(
\begin{bmatrix}
1 & 0 & 0 \\
0 & 0 & 0 \\
0 & 0 & 0
\end{bmatrix}
, \,
\begin{bmatrix}
0 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & 0
\end{bmatrix}
, \,
\begin{bmatrix}
0 & 0 & 0 \\
0 & 0 & 0 \\
0 & 0 & 1
\end{bmatrix}
\right)
$$
También podríamos pensar que la unión $S_{3 \times 3} \cup U_{3 \times 3}$ forma otro subespacio de $M_{3 \times 3}$, pero las matrices que componen esta base (pensándolas como vectores) no lo llenan totalmente. El que sí cumple con serlo, es la __suma__ $S_{3 \times 3} + U_{3 \times 3}$, el cual consiste de __todas las matrices de__ $3 \times 3$. Es decir:
$$
  S_{3 \times 3} + U_{3 \times 3} = M_{3 \times 3} \quad \text{es un subespacio}
$$
Lo que implica que su dimensión es $\dim(S_{3 \times 3} + U_{3 \times 3}) = \dim(M_{3 \times 3}) = 9$.

Además, si sumamos las dimensiones de los subespacios de $M_{3 \times 3}$ se cumple lo siguiente:
$$
  \dim(S_{3 \times 3}) + \dim(U_{3 \times 3}) = \dim(S_{3 \times 3} + U_{3 \times 3}) +
                                                \dim(S_{3 \times 3} \cap U_{3 \times 3})
$$

## 11.1.2 Espacio Función.

También podemos expandir las ideas de los espacios vectoriales a, por ejemplo, la solución de una __ecuación diferencial__ de segundo orden como la que sigue:
$$
  \frac{d^{2}y}{dx^{2}} + y = 0
$$
Las soluciones de $y$, desde el Álgebra Lineal, podemos entenderlas como los elementos de su __espacio nulo__, las que corresponden a $y = \cos(x)$ e $y = \sin(x)$. En ese sentido, bajo este enfoque corresponden a las soluciones especiales y, en consecuencia, la solución completa serán todas las combinaciones lineales entre ellas:
$$
  y = c_{1}\cos(x) + c_{2}\sin(x) \quad \forall c \in \mathbb{C}
$$
De este modo, una base de $y$ será el conjunto $(\cos(x), \ \sin(x))$ y siempre serán un par de soluciones, de manera que su dimensión es $\dim(y) = 2$.

Así, extrapolando las ideas del Álgebra Lineal, podemos entender que resolver ecuaciones diferenciales lineales corresponde a buscar una base para las soluciones del espacio "vectorial".


# 11.2 Matrices de Rango 1.

Una de las matrices que tomará relevancia en clases posteriores, son las de __Rango 1__. En general, éstas suelen construirse a partir de un vector columna $u$ y un vector fila $v^{T}$ que es la transpuesta del primero, donde
$$
  A = u \cdot v^{T}
$$
es una matriz de rango 1.

Por ejemplo, la siguiente matriz $A$ de rango $r = 1$
$$
A =
\begin{bmatrix}
1 & 4 & 5 \\
2 & 8 & 10
\end{bmatrix}
$$
podemos escribirla como:

$$
A =
\begin{bmatrix} 1 \\ 2 \end{bmatrix}
\cdot
\begin{bmatrix} 1 & 4 & 5 \end{bmatrix}
$$
donde el vector columna de $A$ es una base de su $C(A)$ y el vector fila una base de su $C(A^{T})$.

La relevancia de las matrices de rango 1, es que son los "yacimientos" de otras matrices. Por ejemplo, si tenemos una matriz $A$ de $5 \times 17$ y su rango es $r = 4$, con cada vector columna y vector fila siendo base de $C(A)$ y $C(A^{T})$, podemos crear $4$ matrices de rango $1$. Combinándolas linealmente, obtendremos matrices de rango $r = 4$. 

No obstante, si $M_{5 \times 17}$ es el espacio matriz de todas las matrices de $5 \times 17$, las de rango 4 antes señaladas __no generan un subespacio__ porque sólo la suma entre ellas resultarán en nuevas matrices^[Incluso estando la matriz $0$.], pero de rango^[En general, si tenemos dos matrices $A$ y $B$, se da que $\text{rango}(A + B) \leq \text{rango}(A) + \text{rango}(B)$.] $r \leq 5$ y no de $r = 4$. Dicho de otra manera, no estarán en el mismo subespacio. Y lo mismo ocurre si usamos las de $r = 1$.

Ahora tratemos de buscar la matriz de rango $1$ a partir de un vector columna. Sean el vector $\vec{v} = \begin{bmatrix}v_{1} \\ v_{2} \\ v_{3} \\ v_{4}\end{bmatrix}$ en $\mathbb{R}^{4}$ y el conjunto $S = \{\vec{v} \in \mathbb{R}^{4} \ | \ \sum_{i = 1}^{4} v_{i} = 0\}$ un subespacio de $\mathbb{R}^{4}$.

Si nos damos cuenta, el subespacio $S$ es similar a un espacio nulo, pero para que lo sea, necesitamos una matriz de coeficientes tal que $Av = 0$. Como necesitamos los cuatro componentes de $\vec{v}$, entonces se debe cumplir que $A = \begin{bmatrix}1 & 1 & 1 & 1\end{bmatrix}$, la cual es de rango $r = 1$.

La dimensión de $S$ (i.e, $N(A)$) es $\dim(S) = 4 - 1 = 3$. Es decir, hay $3$ vectores que generan a $S$ y son linealmente independientes, los que corresponden a sus soluciones especiales y que buscaremos ahora.

Hemos asumido que $S = N(A)$. Además, $A$ es de rango $r = 1$, su entrada pivote es $a_{1,1} = 1$ y, por consiguiente, las soluciones especiales se encuentran en las tres columnas restantes. En ese sentido, a partir de:
$$
\begin{aligned}
Av &= 0 \\
\begin{bmatrix}1 & 1 & 1 & 1\end{bmatrix}
\cdot
\begin{bmatrix}v_{1} \\ v_{2} \\ v_{3} \\ v_{4}\end{bmatrix}
&=
0
\end{aligned}
$$
podemos establecer que:
$$
\begin{aligned}
\begin{bmatrix}1 & 1 & 1 & 1\end{bmatrix}
\cdot
\begin{bmatrix}v_{1} \\ 1 \\ 0 \\ 0 \end{bmatrix}
= 0 \qquad \quad
\begin{bmatrix}1 & 1 & 1 & 1\end{bmatrix}
\cdot
\begin{bmatrix}v_{1} \\ 0 \\ 1 \\ 0 \end{bmatrix}
= 0 \qquad \quad
\begin{bmatrix}1 & 1 & 1 & 1\end{bmatrix}
\cdot
\begin{bmatrix}v_{1} \\ 0 \\ 0 \\ 1 \end{bmatrix}
= 0
\end{aligned}
$$
Si aplicamos el método de sustitución hacia atrás, en los tres casos $v_{1} = -1$. Por lo tanto, la base más natural (pero no la única) para $S$ es el conjunto:
$$
\left(
\begin{bmatrix}-1 \\ 1 \\ 0 \\ 0 \end{bmatrix}, \,
\begin{bmatrix}-1 \\ 0 \\ 1 \\ 0 \end{bmatrix}, \,
\begin{bmatrix}-1 \\ 0 \\ 0 \\ 1 \end{bmatrix}
\right)
$$
También podemos aprovechar de buscar las bases para $C(A)$ y $C(A^{T})$, las cuales serán vectores en $\mathbb{R}^{1}$ y $\mathbb{R}^{4}$, respectivamente y ambos subespacios son de dimensiones iguales a $1$.
$$
\text{base}(C(A)) =
\left(
[1]
\right)
\qquad
\text{base}(C(A^{T})) =
\left(
\begin{bmatrix}1 & 1 & 1 & 1\end{bmatrix}^{T}
\right)
$$
En cuanto al espacio nulo izquierdo, $N(A^{T})$, no lo podemos calcular porque el producto entre $A^{T}v$ o $Av^{T}$ no existe, debido a que la cantidad de columnas de uno no es igual a la cantidad de filas del otro, en ambos casos. En ese sentido, __no existe una base__ para $N(A^{T})$ y, en consecuencia, su __dimensión__ es $\dim(N(A^{T})) = 0$.

Así, se cumple que:
$$
\begin{aligned}
\dim(N(A)) + \dim(C(A^{T})) &= 3 + 1 = 4 \quad (\text{cant. de columnas de } A) \\
\dim(N(A^{T})) + \dim(C(A)) &= 0 + 1 = 1 \quad (\text{cant. de filas de } A) 
\end{aligned}
$$

# 11.3 Breve Introducción a los Grafos.

En la siguiente clase profundizaremos sobre los grafos, pero veamos una breve revisión de ellos.

Los __Grafos__ podemos entenderlos como un conjunto de __nodos__ (_nodes_) __y aristas__ (_edges_), conectados entre sí. Por ejemplo, a continuación tenemos un grafo de $5$ nodos y $6$ aristas.

\newpage

\begin{figure}[hbt!]
\centering
\includegraphics[scale=0.7]{img/class-11/a-graph.jpg}
\end{figure}

Un ejemplo práctico sería usar grafos para analizar que tan cercanos son las amistades de nuestros/as amigos/as o de gente cercana en general. Es como si materializáramos la frase: __"este mundo es tan grande, pero tan pequeño a la vez"__ (de ahí el título de esta clase) y, para demostrarlo, podríamos hacerlo por medio de grafos.

Otro ejemplo sería hacer un grafo para las páginas web que existen en el internet. De algún modo, ilustrar cómo se vinculan entre ellas a partir de ciertas características de nuestro interés.

Lo interesante es que __podemos describir los grafos a partir de matrices__, las que nos entregarán información sobre si existe o no una arista entre cada nodo (i.e, si se vinculan) y sus distancias.
