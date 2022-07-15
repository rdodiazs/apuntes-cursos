---
title: Clase 4. Factorización $LU$ de una Matriz $A$.
subtitle: Curso 'Linear Algebra' del MIT.
fontsize: 12pt
geometry: [margin=1in]
header-includes:
  - \usepackage{setspace} \onehalfspacing
  - \usepackage{graphicx}
  - \usepackage{amsmath}
  - \usepackage{amssymb}
---

En la clase anterior quedó pendiente la búsqueda de la inversa de una matriz que corresponde al producto de otras dos. Ahora lo revisaremos brevemente.

Sin embargo, estudiaremos más en extenso lo que se conoce como la __factorización de una matriz__. En general, una matriz es el resultado del producto entre dos o más matrices. En esta clase veremos cómo podemos conocerlas al factorizar una matriz que es resultante del método de eliminación de Gauss. Este proceso se denomina __factorización $LU$ de una matriz $A$__.



## 4.1 Continuación: Inversa de Matrices.

### 4.1.1 Inversa del Producto entre dos Matrices.

Hasta ahora sabemos que si una matriz cuadrada $A$ no es singular, entonces:
$$
  AA^{1} = I = A^{1}A
$$
La pregunta que surge es cuál es la inversa del producto de dos matrices cuadradas $AB$. Si $A$ y $B$ no son matrices singulares, entonces podemos señalar que:
$$
  (AB) \cdot (B^{-1}A^{-1}) = I
$$
En otras palabras, si una matriz $AB$ tiene una matriz inversa, ésta corresponde al producto en orden contrario de las inversas de $A$ y de $B$, $B^{-1}A^{-1}$, puesto que al multiplicar ambos productos, obtenemos $I$. Esto podemos demostrarlo moviendo los paréntesis de la siguiente manera:
$$
  A(BB^{-1})A^{-1} = I
$$
Debido a que $B$ tiene su inversa, entonces $BB^{1} = I$.
$$
  AIA^{-1} = I
$$
Terminemos de calcular el lado izquierdo de la ecuación.
$$
\begin{aligned}
  AA^{-1} &= I \\
  I &= I
\end{aligned}
$$
Por lo tanto, también podemos señalar que:
$$
  AB \cdot B^{-1}A^{-1} = B^{-1}A^{-1} \cdot AB = I
$$

### 4.1.2 Inversa de una Matriz Transpuesta.

También es posible encontrar la inversa de una matriz transpuesta. En la siguiente clase estudiaremos en mayor detalle sobre la transposición de una matriz, pero corresponde al proceso de pasar sus columnas a que sean sus filas y viceversa también. En otras palabras, podemos entenderlo como reflejar sus elementos a lo largo de su principal diagonal.

Por ejemplo:
$$
\text{Si } A =
\begin{bmatrix}
1 & 2 \\
3 & 4 \\
5 & 6
\end{bmatrix}
\Longrightarrow
A^{T} =
\begin{bmatrix}
1 & 3 & 5 \\
2 & 4 & 6
\end{bmatrix}
$$
Donde $A^{T}$ es la transpuesta de $A$.

Digamos que $A$ tiene una matriz inversa. Es decir:
$$
  AA^{-1} = I
$$
Si transponemos ambos lados de la ecuación, entonces:
$$
  (AA^{-1})^{T} = I^{T}
$$
La transpuesta de una matriz identidad siempre será igual a ella misma: $I^{T} = I$, mientras que la transposición de un producto entre matrices, es la multiplicación en sentido contrario de la transpuestas de ambas. Es decir, $(AA^{-1})^{T} = (A^{-1})^{T} A^{T}$. Por lo tanto:
$$
  (A^{-1})^{T} A^{T} = I
$$
Y una de las reglas de una matriz transpuesta, es que __su inversa es la transpuesta de la inversa de la matriz original__. Es decir:
$$
(A^{T})^{-1} = (A^{-1})^{T}
$$
Y, debido a esa igualdad, entonces:
$$
  (A^{-1})^{T} A^{T} = I
$$
Por lo tanto, si queremos conocer la inversa de una matriz transpuesta y sabemos que la matriz original no es singular, entonces solo tenemos que transponer la inversa de esta última.



## 4.2 Factorización $LU$ de una Matriz.

Digamos que $A$ es una "buena" matriz para aplicar el método de eliminación de Gauss, puesto que todas sus entradas pivotes son distintas de cero y no necesitamos hacer intercambios de filas, implicando que podemos ir desde $A \to U$. Lo que nos gustaría conocer ahora, es una matriz $L$ que conecte a $A$ y a $U$, tal que:
$$
  A = LU
$$
Consideremos la siguiente matriz:
$$
A =
\begin{bmatrix}
2 & 1 \\
8 & 7
\end{bmatrix}
$$
Apliquemos el método de Gauss para dejar a la entrada $a_{1, 1}$ como pivote. Para ello, multipliquemos la primera fila por 4 y luego restemos la segunda con la primera.
$$
A =
\begin{bmatrix}
2 & 1 \\
8 & 7
\end{bmatrix}
\rightarrow
\begin{bmatrix}
8 & 4 \\
8 & 7
\end{bmatrix}
\rightarrow
U =
\begin{bmatrix}
2 & 1 \\
0 & 3
\end{bmatrix}
$$
El método de eliminación también podemos denotarlo como una matriz elemental, a la cual llamaremos $E_{2,1}$ (porque eliminamos el elemento $a_{2,1}$). Al buscarla, obtendremos que:
$$
\begin{aligned}
E_{2, 1} A &= U \\
\begin{bmatrix}
1 & 0 \\
-4 & 1
\end{bmatrix}
\begin{bmatrix}
2 & 1 \\
8 & 7
\end{bmatrix}
&=
\begin{bmatrix}
2 & 1 \\
0 & 3
\end{bmatrix}
\end{aligned}
$$
Ahora bien, $E_{2,1}$ y $L$ están vinculados, puesto que esta última es la matriz inversa de la primera. Es decir:
$$
E_{2,1}L = I
$$
En ese sentido:
$$
L =
\begin{bmatrix}
1 & 0 \\
4 & 1
\end{bmatrix}
$$
Puesto que:
$$
\begin{bmatrix}
1 & 0 \\
-4 & 1
\end{bmatrix}
\begin{bmatrix}
1 & 0 \\
4 & 1
\end{bmatrix}
=
\begin{bmatrix}
1 & 0 \\
0 & 1
\end{bmatrix}
$$
En consecuencia:
$$
\begin{aligned}
A &= LU \\
\begin{bmatrix}
2 & 1 \\
8 & 7
\end{bmatrix}
&=
\begin{bmatrix}
1 & 0 \\
4 & 1
\end{bmatrix}
\begin{bmatrix}
2 & 1 \\
0 & 3
\end{bmatrix}
\end{aligned}
$$
Esto nos muestra que una matriz también podemos comprenderla como el producto entre dos o más matrices. El proceso que realizamos arriba se conoce como __Factorización o Descomposición $LU$ de una Matriz__ que consiste en descomponer a una matriz que resulta del método de eliminación de Gauss^[Existen más métodos de factorización: [https://en.wikipedia.org/wiki/Matrix_decomposition](https://en.wikipedia.org/wiki/Matrix_decomposition).] como el producto entre dos matrices: $L$ y $U$, donde la primera hace referencia a una __matriz triangular inferior__ (_Lower triangular matrix_) y la segunda a una __matriz triangular superior__ (_Upper triangular matrix_).

\begin{figure}[hbt!]
\centering
\includegraphics[scale=0.7]{img/class-4/LU-factor.jpg}
\end{figure}

También puede darse el caso en que queramos separar la diagonal principal de las entradas pivotes de una de las matrices. Por ejemplo, digamos que queremos tener los pivotes de la matriz $U$, $u_{1,1} = 2$ y $u_{2,2} = 3$, en otra matriz $D$ (de diagonal). Podemos partir estableciendo que:
$$
D =
\begin{bmatrix}
2 & 0 \\
0 & 3
\end{bmatrix}
$$
En ese sentido, necesitamos modificar la matriz $U$ para que, al multiplicarla por $D$, nos de la original $U$.
$$
\begin{bmatrix}
2 & 0 \\
0 & 3
\end{bmatrix}
\begin{bmatrix}
- & - \\
- & -
\end{bmatrix}
=
\begin{bmatrix}
2 & 1 \\
0 & 3
\end{bmatrix}
$$

\newpage

Para ello, necesitamos que la nueva $U$ sea:
$$
U =
\begin{bmatrix}
1 & 1/2 \\
0 & 1
\end{bmatrix}
$$
Tal que:
$$
\begin{bmatrix}
2 & 0 \\
0 & 3
\end{bmatrix}
\begin{bmatrix}
1 & 1/2 \\
0 & 1
\end{bmatrix}
=
\begin{bmatrix}
2 & 1 \\
0 & 3
\end{bmatrix}
$$
Esto implica que la matriz $A$ también podemos factorizarla como $A = LDU$:
$$
\begin{aligned}
A &= LDU \\
\begin{bmatrix}
2 & 1 \\
8 & 7
\end{bmatrix}
&=
\begin{bmatrix}
1 & 0 \\
4 & 1
\end{bmatrix}
\begin{bmatrix}
2 & 0 \\
0 & 3
\end{bmatrix}
\begin{bmatrix}
1 & 1/2 \\
0 & 1
\end{bmatrix}
\end{aligned}
$$
Este formato hace la descomposición de $A$ mucho más balanceada, porque ahora las diagonales principales de $L$ y $U$ consisten de solo $1$s y la diagonal original de esta última la dejamos en la matriz $D$.

Ahora, supongamos que $A$ es una matriz cuadrada de $3 \times 3$, la cual no necesita intercambio de filas, y buscamos descomponerla como $A = LU$. Sin conocer sus entradas, podemos asumir que para obtener $U$ (la matriz triangular superior), tendrá que ser multiplicada por las matrices elementales $E_{2,1}$, $E_{3, 1}$ y $E_{3, 2}$.
$$
  (E_{3, 2} E_{3, 1} E_{2,1}) A = U
$$
Recordemos que la matriz $L$ es la inversa de las matrices elementales de $A$. Por lo tanto, esta matriz triangular inferior será el producto en reversa de las inversas de las $E$s.
$$
\begin{aligned}
  A &= (E_{2,1}^{-1} E_{3, 1}^{-1} E_{3, 2}^{-1}) U \\
  A &= LU
\end{aligned}
$$
<!--Veamos ahora por qué es mejor trabajar con el producto de las inversas de las matrices elementales (i.e, con $L$) que con la multiplicación de las $E$s originales.-->

Una de las ventajas de trabajar con las inversas de las matrices elementales (i.e, con $E$), es que no nos da información de más para entender cómo se logró ir desde $A \to U$. La matriz $L$ nos muestra qué operaciones se realizaron y dónde en la eliminación de Gauss. Veámoslo en el siguiente ejemplo.

Digamos que $E_{3, 1}$ es una matriz identidad, mientras que $E_{3,2}$ y $E_{2,1}$, son las siguientes:
$$
\begin{aligned}
E_{3, 2} &=
\begin{bmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & -5 & 1
\end{bmatrix}
&
E_{2, 1} &=
\begin{bmatrix}
1 & 0 & 0 \\
-2 & 1 & 0 \\
0 & 0 & 1
\end{bmatrix}
\end{aligned}
$$
Al multiplicar $E_{3,2}$ y $E_{2,1}$, obtenemos^[Cuando obtenemos solo $1$s en la diagonal principal y, sobre ella, solo cero, lo que nos está diciendo es que estamos restando filas a partir de las de abajo.]:
$$
\begin{aligned}
E_{3,2} E_{2,1} &= E \\
\begin{bmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & -5 & 1
\end{bmatrix}
\begin{bmatrix}
1 & 0 & 0 \\
-2 & 1 & 0 \\
0 & 0 & 1
\end{bmatrix}
&=
\begin{bmatrix}
1 & 0 & 0 \\
-2 & 1 & 0 \\
10 & -5 & 1
\end{bmatrix}
\end{aligned}
$$
Donde $E$ es la matriz de eliminación de $A$, tal que $EA = U$.

Ahora calculemos $(E_{3,2}E_{2,1})^{-1} = L$, donde el lado izquierdo es el producto al revés de las inversas de ambas matrices elementales.

Sean:
$$
\begin{aligned}
E_{2,1}^{-1} &=
\begin{bmatrix}
1 & 0 & 0 \\
2 & 1 & 0 \\
0 & 0 & 1
\end{bmatrix}
&
E_{3,2}^{-1} &=
\begin{bmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & 5 & 1
\end{bmatrix}
\end{aligned}
$$
Entonces:
$$
\begin{aligned}
(E_{3,2}E_{2,1})^{-1} &= L \\
E_{2,1}^{-1} E_{3,2}^{-1} &= L \\
\begin{bmatrix}
1 & 0 & 0 \\
2 & 1 & 0 \\
0 & 0 & 1
\end{bmatrix}
\begin{bmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & 5 & 1
\end{bmatrix}
&=
\begin{bmatrix}
1 & 0 & 0 \\
2 & 1 & 0 \\
0 & 5 & 1
\end{bmatrix}
\end{aligned}
$$
Aunque las matrices $E_{3,2}$ y $E_{2,1}$ nos muestran por separado qué pasos se realizaron en el método de eliminación, esa información se hace menos evidente cuando las multiplicamos.

Si solo conociéramos la matriz $E$, sería más difícil saber por qué $e_{3, 1} = 10$. Esta entrada es producto de haber multiplicado la primera fila de $A$ por $2$ y restar la segunda fila para que $a_{2, 1} = 0$; y de haber multiplicado por $5$ esta nueva segunda fila y restar la tercera con ella para que $a_{3,2} = 0$ (en ese orden). En cambio, la matriz $L$ nos muestra de inmediato que dichas operaciones y en qué ubicación se realizaron en $A$ para obtener $U$, donde $l_{2, 1} = 2$ y $l_{3, 2} = 5$, pero para ir desde $A \to U$ debemos calcular la matriz inversa de $L$.

Entonces, si $A$ es una matriz que no requiere intercambio de filas, la __matriz $L$__ de $A = LU$ es aquella que __contiene los multiplicadores (o factores) que son aplicados a $A$ para obtener $U$__. Esto explica que sea triangular hacia abajo, porque su inversa es la que multiplica a $A$ para que los pivotes de $U$ estén en la diagonal principal (de ahí, también, a que esta última sea triangular hacia arriba).


## 4.3 El Costo o la Cantidad de Pasos del Método de Eliminación.

Algo práctico que podemos saber sobre el método de eliminación de Gauss, es la cantidad de operaciones que podemos realizar en una matriz $n \times n$.

Si $n$ es grande y pocas de sus entradas son iguales a cero, nos tomará más pasos (y tiempo) lograr una matriz triangular superior. No obstante, también siempre vamos a preferir tener más información porque esta será más precisa^[Pensémoslo como a mayor cantidad de datos, mayor precisión de información.]. Es posible generalizar cuánto nos toma resolver una matriz.

Por ejemplo, digamos que $A$ es una matriz de $100 \times 100$ (i.e, $n = 100$) y sin ceros.
$$
A =
\begin{bmatrix}
a_{1,1} & a_{1,2} & a_{1,3} & \ldots & a_{1,100} \\
a_{2,1} & a_{2,2} & a_{2,3} & \ldots & a_{2,100} \\
a_{3,1} & a_{3,2} & a_{3,3} & \ldots & a_{3,100} \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
a_{100,1} & a_{100,2} & a_{100,3} & \ldots & a_{100,100} \\
\end{bmatrix}
$$
El primer paso será hacer que $a_{1, 1}$ sea el primer pivote.
$$
A =
\begin{bmatrix}
a_{1,1} & a_{1,2} & a_{1,3} & \ldots & a_{1,100} \\
0 & a_{2,2} & a_{2,3} & \ldots & a_{2,100} \\
0 & a_{3,2} & a_{3,3} & \ldots & a_{3,100} \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
0 & a_{100,2} & a_{100,3} & \ldots & a_{100,100} \\
\end{bmatrix}
$$
Como no hay ceros en $A$, esto implica que tuvimos que realizar $100^{2}$ operaciones. En otras palabras, para todas las entradas de esta matriz.

El siguiente paso es hacer que $a_{2, 2}$ sea la siguiente entrada pivote.
$$
A =
\begin{bmatrix}
a_{1,1} & a_{1,2} & a_{1,3} & \ldots & a_{1,100} \\
0 & a_{2,2} & a_{2,3} & \ldots & a_{2,100} \\
0 & 0 & a_{3,3} & \ldots & a_{3,100} \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
0 & 0 & a_{100,3} & \ldots & a_{100,100} \\
\end{bmatrix}
$$
En este caso, no tuvimos que preocuparnos de la primera fila y columna, por lo tanto, para lograr que $a_{2,2}$ fuese el segundo pivote, tuvimos que realizar alrededor de $99^{2}$ operaciones. Y si seguimos con los otros pivotes, tendremos que realizar $98^{2}$ operaciones y así. Es decir, el patrón de la cantidad de operaciones podemos denotarlo como:
$$
  n^{2} + (n - 1)^{2} + \cdots + 2^{2} + 1^{2}
$$
Esta suma de cuadrados puede ser resumida por la siguiente fórmula^[Al resolverla, obtenemos que es igual a $(1/3)n^{3} + (1/2)n^{2} + 1/6$.]:
$$
\frac{1}{3}n \left(n + \frac{1}{2}\right)(n + 1)
$$
Y, a medida que $n \to \infty$, el término más relevante^[O también podemos decir que la cantidad de pasos del método de Gauss es alrededor de $O(n^{3})$.] es $(1/3) n^{3}$. Es decir:
$$
  n^{2} + (n - 1)^{2} + \cdots + 2^{2} + 1^{2} \approx \frac{1}{3} n^{3} \qquad \text{mientras } n \to \infty
$$
El $(1/3)$ de la fórmula nos dice que, a medida que $n \to \infty$, la cantidad de pasos se va achicando.

Ahora bien, el $(1/3) n^{3}$ se refiere a la cantidad de pasos aplicados a $A$, que corresponde al lado izquierdo de la ecuación $Ax = b$. Veamos cuánto nos toma aplicar el método de Gauss al vector $b$.

Debido a que $b$ podemos entenderlo también como una matriz de $n \times 1$, la cantidad de pasos que tendremos que aplicar durante el método de eliminación para ir de $b \to c$, es de $n^{2}$:
$$
  [(n - 1) + (n - 2) + \cdots + 1] + [1 + 2 + \cdots + (n - 1) + n] = n^{2}
$$
Lo que podemos sacar como conclusión, es que si $b$ tiene muchas entradas, el mayor costo del método de eliminación de Gauss lo obtenemos de $A$ del lado izquierdo del sistema de ecuaciones. No obstante, después de aplicarlo en dicho lado, podemos procesar a un menor costo el lado derecho.


## 4.4 Revisión Breve de Matriz de Permutación.

Ahora es momento de considerar las matrices que sí necesitan un intercambio de filas. Recordemos que, por ejemplo, lo hacemos cuando estamos realizando una eliminación de Gauss y la matriz tiene un cero en una entrada pivote. Este método se denomina __Permutación__ y podemos representarlo en forma matricial, las cuales denotamos como $P$.

Digamos que queremos permutar una matriz $A$ de $3 \times 3$. La combinación de intercambio de filas que podemos hacer, son las siguientes:

- $A$ se mantiene igual (i.e, no hay intercambios).
- Intercambiar la primera por la segunda fila.
- Intercambiar la primera por la tercera fila.
- Intercambiar la segunda por la tercera fila.
- Intercambiar la primera por la segunda fila, la segunda por la tercera y la tercera por la primera.
- Intercambiar la tercera por la primera fila, la primera por la segunda y la segunda por la tercera.

Como el propósito es solo cambiar filas, las entradas de las matrices de permutación solo deben contener unos y ceros. Por lo tanto, siguiendo el mismo orden de arriba, las matrices para intercambiar aquellas filas, son las siguientes:
$$
\begin{aligned}
P_{I} &=
\begin{bmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & 1
\end{bmatrix}
&
P_{1, 2} &=
\begin{bmatrix}
0 & 1 & 0 \\
1 & 0 & 0 \\
0 & 0 & 1
\end{bmatrix}
&
P_{1, 3} &=
\begin{bmatrix}
0 & 0 & 1 \\
0 & 1 & 0 \\
1 & 0 & 0
\end{bmatrix}
\\
P_{2, 3} &=
\begin{bmatrix}
1 & 0 & 0 \\
0 & 0 & 1 \\
0 & 1 & 0
\end{bmatrix}
&
P_{1-2, 2-3, 3-1} &=
\begin{bmatrix}
0 & 1 & 0 \\
0 & 0 & 1 \\
1 & 0 & 0
\end{bmatrix}
&
P_{3-1, 1-2, 2-3} &=
\begin{bmatrix}
0 & 0 & 1 \\
1 & 0 & 0 \\
0 & 1 & 0
\end{bmatrix}
\end{aligned}
$$
Si nos damos cuenta, las dos últimas matrices son multiplicaciones entre dos $P$. En otras palabras, si multiplicamos dos matrices de permutación, la resultante hará la tarea de las dos al mismo tiempo.

También es posible calcular la inversa de las matrices de permutación. Lo interesante es que ellas están en ese grupo de matrices. Por ejemplo, $P_{1,2}^{-1} = P_{1, 2}$; o $P_{1-2, 2-3, 3-1}^{-1} = P_{3-1, 1-2, 2-3}$; y así. Es decir, podemos tener una familia de matrices de permutación para una matriz $A$ y todo esto se generaliza en la siguiente igualdad:
$$
  P^{-1} = P^{T}
$$
La inversa de una matriz de permutación es la transpuesta de ella.

Finalmente, en cuanto a la cantidad de combinaciones que podemos realizar, está dado por $n!$. En el caso de $A$, que es de $3 \times 3$, podemos realizarle $3! = 6$ permutaciones. Si fuese de $4 \times 4$, entonces serían $4! = 24$ intercambios de filas.

