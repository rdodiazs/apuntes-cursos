---
title: Clase 18. Propiedades de las Determinantes.
subtitle: Curso 'Linear Algebra' del MIT.
abstract: \noindent Desde esta clase hasta las próximas dos, nos centraremos en estudiar a un número asociado solo a matrices cuadradas que recibe el nombre de determinante. En esta ocasión, revisaremos diez propiedades que es posible obtener de ellos con las cuales podremos comprender mejor a este escalar.
lang: es
fontsize: 12pt
geometry: [margin=1in]
header-includes:
  - \usepackage{setspace} \onehalfspacing
  - \usepackage{graphicx}
  - \usepackage{amsmath}
  - \usepackage{amssymb}
---



# 1. Determinantes.

Cuando tenemos una __matriz cuadrada__, es posible encontrar un __valor escalar__ asociado a ella conocido como __Determinante__. En particular, es un número que está __en función de las entradas de aquella matriz__.

Si $A$ es una matriz de $n \times n$, su determinante se denota como $\det(A)$ o $|A|$. Cuando consiste de las siguiente entradas:
$$
A =
\begin{bmatrix}
a_{1,1} & a_{1,2} & \cdots & a_{1, n} \\
a_{2,1} & a_{2,2} & \cdots & a_{2, n} \\
\vdots & \vdots & \ddots & \vdots \\
a_{n,1} & a_{n,2} & \cdots & a_{n, n}
\end{bmatrix}
$$
la determinante de esta matriz se denota como:
$$
\det(A) =
\begin{vmatrix}
a_{1,1} & a_{1,2} & \cdots & a_{1, n} \\
a_{2,1} & a_{2,2} & \cdots & a_{2, n} \\
\vdots & \vdots & \ddots & \vdots \\
a_{n,1} & a_{n,2} & \cdots & a_{n, n}
\end{vmatrix}
$$
La importancia de los determinantes, es que su valor y signo nos entrega información relevante de la matriz cuadrada de la que proviene. No toda sobre ella, pero si bastante. Para entenderlos mejor, revisemos sus propiedades.


# 2. Propiedades de los Determinantes.

Estudiaremos 10 propiedades de los determinantes. Para comenzar, definiremos tres y las siete restantes las obtendremos a partir de las primeras señaladas.

__Propiedad 1__: __El determinante de una matriz identidad__ $I$ es igual a $1$.
$$
  \det(I) = 1
$$
Al conocer la fórmula de un determinante, podemos ver que esta igualdad se cumple, así que la daremos por sentada.

__Propiedad 2__: El __intercambio de filas__ de una matriz cuadrada $A$, __revierte el signo__ de su determinante inicial, donde:

- Cantidad de intercambios es __par__ $\rightarrow$ $+\det(A)$.

- Cantidad de intercambios es __impar__ $\rightarrow$ $-\det(A)$.

Es posible interpretar a las __matrices cuadradas de permutación__ $P$ como matrices identidad en las que se realizaron intercambios de filas. En ese sentido, el determinante de ellas será:
$$
  \det(P) = \pm 1
$$
cuyo signo dependerá de la cantidad de intercambio que se le hayan realizado a $I$.

__Propiedad 3__: El determinante de una matriz cuadrada $A$ __se comporta como una función lineal de una de sus filas mientras las otras se mantienen constantes__.
$$
\begin{aligned}
&3.a)
\begin{vmatrix}
ta & tb \\
c & d
\end{vmatrix} =
t \cdot
\begin{vmatrix}
a & b \\
c & d
\end{vmatrix} \\
&3.b)
\begin{vmatrix}
a + a' & b + b' \\
c & d
\end{vmatrix} =
\begin{vmatrix}
a & b \\
c & d
\end{vmatrix} +
\begin{vmatrix}
a' & b' \\
c & d
\end{vmatrix}
\end{aligned}
$$
El concepto de __función lineal__ la profundizaremos cuando estudiemos transformaciones lineales, pero se refiere a que si tenemos dos espacios vectoriales $W$ y $V$ $\in K$ (un campo vectorial), la función $f: V \to W$ es una función lineal si, para dos vectores $\vec{a}$, $\vec{b}$ $\in V$ y un escalar $c \in K$ se cumplen las siguientes condiciones:

- $f(\vec{a} + \vec{b}) = f(\vec{a}) + f(\vec{b})$

- $f(c\vec{a}) = cf(\vec{a})$

Ahora bien, vimos que un determinante __se comporta__ como una función lineal para una fila de la matriz cuadrada $A$ sin alterar las demás. Por lo tanto, __ES INCORRECTO__ señalar que $\det(A + B) = \det(A) + \det(B)$, porque significa que estamos sumando todas las filas de $\det(A)$ con todas las de $\det(B)$ y no es a lo que se refiere la propiedad 3.B.

Por otra parte, a partir de la Propiedad 3.A podemos corroborar que:
$$
  \det(2A) = 2^{n} \cdot \det(A)
$$
puesto que en $2A$ cada fila de $A$ está siendo multiplicada por $2$, por lo tanto, al factorizar cada una de ellas conlleva a $2^{n}$, donde $n$ es la cantidad de filas de $A$.

En las siguientes siete propiedades las conoceremos a partir de las tres primeras que acabamos de aprender.

__Propiedad 4__: Si una matriz cuadrada $A$ tiene __dos filas iguales__, su determinante será __igual a cero__.

La explicación de esta propiedad podemos tomarla desde la propiedad 2.

Suponga que $A$ de $n \times n$ tiene dos filas iguales y su determinante es $\det(A)$. Si intercambiamos este par de filas, ocurre que:
$$
  \det(A) = -\det(A)
$$
porque si bien hicimos este cambio y, por consiguiente, se revierte el signo del determinante, las entradas de ambas filas de $A$ siguen siendo las mismas. En consecuencia, la única posibilidad de que se cumpla dicha igualdad es que
$$
  \det(A) = 0
$$
Cuando dos filas de una matriz son iguales, significa que son __linealmente dependientes__. Para el caso de una matriz cuadrada, lo anterior implica que __no tiene una inversa__.

Por lo tanto, podemos extrapolar la __propiedad 4__ para señalar que __si__ $\det(A) = 0$, entonces $A$ es __singular__.

En general, uno de los principales usos del determinante de una matriz cuadrada, es para evaluar si es invertible o no según si es igual a cero o a cualquier otro valor.

__Propiedad 5__: Al aplicar operaciones de __reducción de filas__ a una matriz $A$ de $n \times n$, __su determinante se mantiene igual__.

Por ejemplo, digamos que $A$ es la siguiente matriz:
$$
A =
\begin{bmatrix}
a & b \\
c & d
\end{bmatrix}
$$
con determinante:
$$
\det(A) =
\begin{vmatrix}
a & b \\
c & d
\end{vmatrix}
$$
Supongamos que queremos reducir la segunda fila de $A$. Para aquello, multiplicamos a la primera por un escalar $-l$ y sumamos la segunda con esta última, obteniendo la siguiente matriz:
$$
B =
\begin{bmatrix}
a & b \\
c - la & d - lb
\end{bmatrix}
$$
y cuyo determinante es:
$$
\det(B) =
\begin{vmatrix}
a & b \\
c - la & d - lb
\end{vmatrix}
$$
Si aplicamos la propiedad 3.B a $\det(B)$, entonces:
$$
\det(B) =
\begin{vmatrix}
a & b \\
c - la & d - lb
\end{vmatrix} =
\begin{vmatrix}
a & b \\
c & d
\end{vmatrix} +
\begin{vmatrix}
a & b \\
-la & -lb
\end{vmatrix}
$$
Luego, por medio de la propiedad 3.A:
$$
\det(B) =
\begin{vmatrix}
a & b \\
c & d
\end{vmatrix}
-l \cdot
\begin{vmatrix}
a & b \\
a & b
\end{vmatrix}
$$
Finalmente, por la propiedad 4:
$$
\det(B) =
\begin{vmatrix}
a & b \\
c & d
\end{vmatrix}
-l \cdot 0 =
\begin{vmatrix}
a & b \\
c & d
\end{vmatrix} =
\det(A)
$$

__Propiedad 6__: Si una matriz $A$ de $n \times n$ tiene al menos __una fila completa de ceros__, entonces __su determinante será igual a cero__.

Una manera de explicar esta propiedad, es la siguiente: Sea la matriz $A$
$$
A =
\begin{bmatrix}
a & b \\
0 & 0
\end{bmatrix}
$$
Sumemos la primera fila a la segunda de $A$, obteniendo una matriz $B$:
$$
B =
\begin{bmatrix}
a & b \\
0 + a & 0 + b
\end{bmatrix} =
\begin{bmatrix}
a & b \\
a & b
\end{bmatrix}
$$
Esto implica que el $\det(B)$ es:
$$
\det(B) =
\begin{vmatrix}
a & b \\
a & b
\end{vmatrix}
$$
Debido a que la matriz $B$ es solo la matriz $A$ en la cual realizamos operaciones en sus filas, por la Propiedad 5 significa que sus determinantes son iguales.
$$
\begin{aligned}
\det(A) &= \det(B) \\
\det(A) &=
\begin{vmatrix}
a & b \\
a & b
\end{vmatrix}
\end{aligned}
$$
Sin embargo, por la Propiedad 4, la igualdad de arriba conlleva a lo siguiente:
$$
  \det(A) = 0
$$

__Propiedad 7__: El determinante de una __matriz triangular__ (superior o inferior) es igual al __producto de su diagonal principal__.

Suponga que $U$ es una matriz triangular superior y $d_{i, j} \neq 0$ las entradas de su diagonal principal, para $i = 1, \ 2, \cdots, \ n$ y $j = 1, \ 2, \ \cdots, \ n$.
$$
U =
\begin{bmatrix}
d_{1, 1} & u_{1, 2} & u_{1, 3} & \cdots & u_{1, n} \\
0 & d_{2, 2} & u_{2, 3} & \cdots & u_{2, n} \\
0 & 0 & d_{3, 3} & \cdots & u_{3, n} \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
0 & 0 & 0 & \cdots & d_{n, n}
\end{bmatrix}
$$
Ahora, digamos que realizamos operaciones de filas en $U$ para eliminar todas las entradas que están arriba de su diagonal principal, obteniendo a una matriz $V$.
$$
V =
\begin{bmatrix}
d_{1, 1} & 0 & 0 & \cdots & 0 \\
0 & d_{2, 2} & 0 & \cdots & 0 \\
0 & 0 & d_{3, 3} & \cdots & 0 \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
0 & 0 & 0 & \cdots & d_{n, n}
\end{bmatrix}
$$
Lo que significa que el determinante de $V$ es:
$$
\det(V) =
\begin{vmatrix}
d_{1, 1} & 0 & 0 & \cdots & 0 \\
0 & d_{2, 2} & 0 & \cdots & 0 \\
0 & 0 & d_{3, 3} & \cdots & 0 \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
0 & 0 & 0 & \cdots & d_{n, n}
\end{vmatrix}
$$
Por la Propiedad 5, el determinante de $V$ es igual al de la matriz $U$:
$$
\begin{aligned}
\det(U) &= \det(V) \\
\det(U) &=
\begin{vmatrix}
d_{1, 1} & 0 & 0 & \cdots & 0 \\
0 & d_{2, 2} & 0 & \cdots & 0 \\
0 & 0 & d_{3, 3} & \cdots & 0 \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
0 & 0 & 0 & \cdots & d_{n, n}
\end{vmatrix}
\end{aligned}
$$
Es válido asumir que cada fila del $\det(U)$ es un múltiplo de $d_{i, j}$, por lo tanto podemos factorizarlas a partir de la Propiedad 3.A.
$$
\begin{aligned}
\det(U) &=
(d_{n, n} \cdot \ldots \cdot d_{3, 3} \cdot d_{2, 2} \cdot d_{1, 1}) \cdot
\begin{vmatrix}
1 & 0 & 0 & \cdots & 0 \\
0 & 1 & 0 & \cdots & 0 \\
0 & 0 & 1 & \cdots & 0 \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
0 & 0 & 0 & \cdots & 1
\end{vmatrix} \\
\det(U) &= (d_{n, n} \cdot \ldots \cdot d_{3, 3} \cdot d_{2, 2} \cdot d_{1, 1}) \cdot \det(I)
\end{aligned}
$$
Por la Propiedad 1 sabemos que $\det(I) = 1$, implicando que
$$
  \det(U) = (d_{n, n} \cdot \ldots \cdot d_{3, 3} \cdot d_{2, 2} \cdot d_{1, 1})
$$
La Propiedad 7 nos lleva a otra interpretación del determinante. Si aplicamos el método de eliminación de Gauss a una matriz $A$ de $n \times n$, llevando a $A \to U$, entonces el $\det(U)$ corresponde al $\pm$ __producto de las entradas pivotes de $A$__, cuyo signo depende de si hicimos intercambio de filas en aquel proceso.

Esta propiedad también nos ayuda a verificar que cuando $\det(A) = 0$, entonces $A$ no es invertible. Si la matriz $A$ tiene un par de filas linealmente dependientes, entonces en la eliminación de Gauss una de sus filas será el $\vec{0}$. En consecuencia, una de las diagonales de $U$ será igual a cero y, por consiguiente, el $\det(U) = \det(A) = 0$.

A partir de la Propiedad 7 podemos conocer la __Fórmula para el determinante de una matriz de $2 \times 2$__. Sea $A$:
$$
A =
\begin{bmatrix}
a & b \\
c & d
\end{bmatrix}
$$
Pasemos de $A \to U$ multiplicando la primera fila por $-(c/a)$ y, luego, sumemos la segunda a ésta.
$$
U =
\begin{bmatrix}
a & b \\
0 & d - (bc/a)
\end{bmatrix}
$$
Por la Propiedad 5, $\det(U) = \det(A)$. Por lo tanto:
$$
\det(A) =
\begin{vmatrix}
a & b \\
0 & d - (bc/a)
\end{vmatrix}
$$
Finalmente, aplicando la Propiedad 7, obtenemos que:
$$
\det(A) = a \cdot \left(d - \frac{bc}{a}\right) = ad - a\frac{bc}{a} = ad - bc
$$
Por lo tanto, la __fórmula del determinante de una matriz $A$ de $2 \times 2$__ se calcula como:
$$
\det(A) =
\begin{vmatrix}
a & b \\
c & d
\end{vmatrix} =
ad - bc
$$

__Propiedad 8__: El determinante de una __matriz singular__ $A$ de $n \times n$ es __igual a cero__.

Por medio de las propiedades 4, 6 y 8 de los determinantes, hemos podido verificar que el $\det(A) = 0$ cuando $A$ no es invertible. Por lo tanto, si resulta en dicho valor, quiere decir que algunas de sus filas son linealmente dependientes o, simplemente, está compuesta de ceros.

__Propiedad 9__: El determinante de una matriz resultante del producto matricial entre dos matrices $A$ y $B$ corresponde a la multiplicación de los determinantes individuales de ambas.
$$
  \det(AB) = \det(A) \cdot \det(B)
$$
A partir de esta propiedad podemos conocer el __determinante de la inversa de una matriz__.

Suponga que $A$ es de $n \times n$ y que existe $A^{-1}$. Esto significa que podemos asegurar que:
$$
A^{-1}A = I
$$
Calculemos el determinante de las matrices de ambos lados de la ecuación.
$$
det(A^{-1}A) = \det(I)
$$
Aplicando la Propiedad 9 en el lado izquierdo y la Propiedad 1 en el derecho, obtenemos que:
$$
  \det(A^{-1}) \cdot \det(A) = 1
$$
Recordemos que los determinantes son valores escalares. Por lo tanto, podemos multiplicar por $1/\det(A)$ para conocer al $\det(A^{-1})$.
$$
  \det(A^{-1}) = \frac{1}{\det(A)}
$$
Acá tenemos una tercera prueba de que una matriz $A$ no es invertible cuando $\det(A) = 0$, puesto que el $\det(A^{-1})$ no existe en ese caso al estar dividido por cero.

Otra consecuencia de la Propiedad 9, es que si elevamos al cuadrado a una matriz $A$ de $n \times n$ o, en otras palabras, si la multiplicamos por si misma, su determinante también se elevará a dicho valor:
$$
  \det(A^{2}) = \det(A) \cdot \det(A) = (\det(A))^{2}
$$

__Propiedad 10__: El determinante de la __transpuesta de una matriz $A$__ de $n \times n$ es igual al determinante de $A$.
$$
  \det(A^{T}) = \det(A)
$$
Para comprobarla, establezcamos que $A = LU$, que es la descomposición de $A$ al aplicar el método de eliminación de Gauss. Reemplacemos la igualdad de arriba con dichas matrices.
$$
\begin{aligned}
\det([LU]^{T}) &= \det(LU) \\
\det(U^{T}L^{T}) &= \det(LU)
\end{aligned}
$$
Por medio de la Propiedad 9, podemos establecer que:
$$
  \det(U^{T}) \cdot \det(L^{T}) = \det(L) \cdot \det(U)
$$
Recordemos que la matriz $L$ es triangular inferior, consiste de los factores aplicados a la matriz $A$ al ir reduciendo sus filas y su diagonal principal siempre consiste de unos (1s). Por lo tanto, a partir de la Propiedad 7, $\det(L^{T}) = 1$ y $\det(L) = 1$.
$$
\det(U^{T}) = \det(U)
$$
En cuanto a $U$, recordemos que es la matriz triangular resultante de haber aplicado el reducido sus filas por medio del método de Gauss, por lo que podemos aplicar la Propiedad 5 para señalar que:
$$
  \det(A^{T}) = \det(A)
$$
Una consecuencia relevante de la Propiedad 10, es que podemos confirmar que __el determinante de una matriz con al menos una columna igual al $\vec{0}$, es igual a cero__. Por ejemplo, sea:
$$
A =
\begin{bmatrix}
a & 0 \\
c & 0
\end{bmatrix}
$$
Si la transponemos, entonces:
$$
A^{T} =
\begin{bmatrix}
a & c \\
0 & 0
\end{bmatrix}
$$
Por la Propiedad 6, el determinante de $A^{T}$ será igual a cero:
$$
\det(A^{T}) =
\begin{vmatrix}
a & c \\
0 & 0
\end{vmatrix} = 0
$$
En consecuencia, a partir de la Propiedad 10 podemos concluir que:
$$
\begin{aligned}
\det(A) &= \det(A^{T}) \\
\det(A) &= 0
\end{aligned}
$$
