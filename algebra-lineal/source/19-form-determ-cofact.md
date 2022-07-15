---
title: Clase 19. Fórmulas de los Determinantes y los Cofactores.
subtitle: Curso 'Linear Algebra' del MIT.
abstract:
  \noindent En esta ocasión estudiaremos dos fórmulas para calcular el determinante de una matriz de $2 \times 2$ y de $n \times n$, basándonos en las propiedades vistas en la clase anterior (principalmente, las tres primeras). La primera la nombraremos como la "Gran Fórmula" y la segunda se calcula usando Cofactores.
lang: es
fontsize: 12pt
geometry: margin=1in
header-includes:
  - \usepackage{setspace} \onehalfspacing
  - \usepackage{graphicx}
  - \usepackage{amsmath, amssymb}
---


# 1. Determinante de una matriz $2 \times 2$.

El determinante de una matriz $A$ de $2 \times 2$ como la que vemos a continuación es, junto con la de $1 \times 1$ ($\det([a]) = a$), muy fácil de recordar:
$$
\det(A) =
\begin{vmatrix}
a_{1,1} & a_{1,2} \\
a_{2,1} & a_{2,2}
\end{vmatrix} =
a_{1,1}a_{2,2} - a_{1,2}a_{2,1}
$$
El problema es que si la memorizamos, no nos será de mucha ayuda para conocer determinantes de mayor tamaño. Es por ello que, por medio de las **propiedades 1, 2 y 3** de éstos, buscaremos una manera de llegar a la fórmula del de $2 \times 2$ que será generalizable a los de $n \times n$.

Si el $\det(A)$ lo escribimos como:
$$
\det(A) =
\begin{vmatrix}
a_{1,1} + 0 & 0 + a_{1,2} \\
a_{2,1} & a_{2,2}
\end{vmatrix},
$$
por la propiedad 3.b) es posible expresarlo de la siguiente forma:

$$
\det(A) =
\begin{vmatrix}
a_{1,1} & 0 \\
a_{2,1} & a_{2,2}
\end{vmatrix} +
\begin{vmatrix}
0 & a_{1,2} \\
a_{2,1} & a_{2,2}
\end{vmatrix}
$$
De modo similar, si mantenemos constantes las segundas filas de ambos determinantes y las primeras las reescribimos como
$$
\det(A) =
\begin{vmatrix}
a_{1,1} & 0 \\
a_{2,1} + 0 & 0 + a_{2,2}
\end{vmatrix} +
\begin{vmatrix}
0 & a_{1,2} \\
0 + a_{2,1} & a_{2,2} + 0
\end{vmatrix}
$$
Entonces, por la propiedad 3.b):
$$
\det(A) =
\begin{vmatrix}
a_{1,1} & 0 \\
a_{2,1} & 0
\end{vmatrix} +
\begin{vmatrix}
a_{1,1} & 0 \\
0 & a_{2,2}
\end{vmatrix} +
\begin{vmatrix}
0 & a_{1,2} \\
0 & a_{2,2}
\end{vmatrix} +
\begin{vmatrix}
0 & a_{1,2} \\
a_{2,1} & 0
\end{vmatrix}
$$
Como vimos en la clase pasada, una consecuencia de la propiedad 10 es que los determinantes con al menos una columna completa de ceros, se igualan a cero. Por lo tanto:
$$
\det(A) =
\begin{vmatrix}
a_{1,1} & 0 \\
0 & a_{2,2}
\end{vmatrix} +
\begin{vmatrix}
0 & a_{1,2} \\
a_{2,1} & 0
\end{vmatrix}
$$
Usando la propiedad 3.a) en ambos determinantes de la derecha, podemos reescribir esta ecuación como
$$
\det(A) =
a_{1,1}a_{2,2} \cdot
\begin{vmatrix}
1 & 0 \\
0 & 1
\end{vmatrix} +
a_{1,2}a_{2,1} \cdot
\begin{vmatrix}
0 & 1 \\
1 & 0
\end{vmatrix}
$$
Por la propiedad 1 sabemos que el determinante de una matriz identidad es $1$ y, por medio de la propiedad 2, el determinante de una matriz permutación cambia de signo según si se hace un número par o impar de veces. En consecuencia:
$$
\begin{aligned}
  \det(A) &= a_{1,1}a_{2,2} \cdot (1) + a_{1,2}a_{2,1} \cdot (-1) \\
          &= a_{1,1}a_{2,2} - a_{1,2}a_{2,1}
\end{aligned}
$$


# 2. Determinante de una matriz de $n \times n$.

Existen varias maneras de encontrar el determinante de una matriz de $n \times n$. Acá veremos dos: la "Gran Fórmula" y el método del Cofactor.

## 2.1 La Gran Fórmula.

Anteriormente vimos que, al aplicar la propiedad 3.b) en una matriz $A$ de $2 \times 2$, terminamos con cuatro determinantes en el lado derecho de la ecuación:
$$
\det(A) =
\begin{vmatrix}
a_{1,1} & 0 \\
a_{2,1} & 0
\end{vmatrix} +
\begin{vmatrix}
a_{1,1} & 0 \\
0 & a_{2,2}
\end{vmatrix} +
\begin{vmatrix}
0 & a_{1,2} \\
0 & a_{2,2}
\end{vmatrix} +
\begin{vmatrix}
0 & a_{1,2} \\
a_{2,1} & 0
\end{vmatrix}
$$
En general, cuando se aplica esta lógica en cualquier matriz de $n \times n$, en esta etapa siempre quedan $n^{n}$ determinantes. No obstante, debido a que algunos de ellos terminan con una columna completa de ceros, solo permanecen $n!$. Por ejemplo, en la de $2 \times 2$ persisten $2! = 2$:
$$
\det(A) =
\begin{vmatrix}
a_{1,1} & 0 \\
0 & a_{2,2}
\end{vmatrix} +
\begin{vmatrix}
0 & a_{1,2} \\
a_{2,1} & 0
\end{vmatrix}
$$
Quedan $n!$ determinantes porque son solo aquellos que consisten de **una entrada en cada fila y columna**. Si hay más de una entrada en una de ellas, el determinante se cancela. Por lo tanto, estos últimos **representan una forma de ordenar sus entradas entre cada columna**.

Por ejemplo, en el determinante de una matriz de $3 \times 3$ permanecen $3! = 6$ en su suma, porque, en su forma más simple, es posible ordenar sus entradas entre sus columnas esa cantidad de veces.
$$
\begin{aligned}
\det(A) &=
\begin{vmatrix}
a_{1,1} & a_{1,2} & a_{1,3} \\
a_{2,1} & a_{2,2} & a_{2,3} \\
a_{3,1} & a_{3,2} & a_{3,3}
\end{vmatrix} \\ &=
\begin{vmatrix}
a_{1,1} & 0 & 0 \\
0 & a_{2,2} & 0 \\
0 & 0 & a_{3,3}
\end{vmatrix} +
\begin{vmatrix}
a_{1,1} & 0 & 0 \\
0 & 0 & a_{2,3} \\
0 & a_{3,2} & 0
\end{vmatrix} +
\begin{vmatrix}
0 & a_{1,2} & 0 \\
a_{2,1} & 0 & 0 \\
0 & 0 & a_{3,3}
\end{vmatrix} \\ &+
\begin{vmatrix}
0 & a_{1,2} & 0 \\
0 & 0 & a_{2,3} \\
a_{3,1} & 0 & 0
\end{vmatrix} +
\begin{vmatrix}
0 & 0 & a_{1,3} \\
a_{2,1} & 0 & 0 \\
0 & a_{3,2} & 0
\end{vmatrix} +
\begin{vmatrix}
0 & 0 & a_{1,3} \\
0 & a_{2,2} & 0 \\
a_{3,1} & 0 & 0
\end{vmatrix}
\end{aligned}
$$
Es decir, la secuencia de columnas $(1, \ 2, \ 3)$ de una matriz de $3 \times 3$ se **permuta** seis (o $3! = 6$) veces.

Recordemos que, en el paso siguiente, aplicamos la propiedad 3.a) en cada determinante de la suma que vimos arriba. Esto resulta en una **adición de los productos entre las entradas y matrices de permutación**, con una siendo una **matriz identidad**. Por la propiedad 2, $n! / 2$ pasan a ser menores a cero (i.e, negativos).

Por consiguiente, podemos resumir el cálculo de un determinante para una matriz $A$ de $n \times n$ y de entradas $a_{i,j}$ a partir de la siguiente **Gran Fórmula**:
$$
  \det(A) = \sum_{(j_{1}, \cdots, j_{n})} \pm a_{1, j_{1}} a_{2, j_{2}} \cdots a_{n, j_{n}}
$$
donde $(j_{1}, \ j_{2}, \ \cdots, \ j_{n})$ son todas las **permutaciones** de las columnas $(1, \ 2, \ \cdots, \ n)$ y el signo $\pm$ representa la **cantidad de intercambios de fila que realiza cada matriz permutación** en los sumandos.

Volvamos al caso de la matriz de $3 \times 3$. Efectivamente, es posible realizar $3!$ veces las columnas de su determinante y, por lo tanto, sumar esa cantidad de sumandos; y $3!/2 = 3$ de ellos son menores a cero.
$$
\begin{aligned}
\det(A) &=
\begin{vmatrix}
a_{1,1} & a_{1,2} & a_{1,3} \\
a_{2,1} & a_{2,2} & a_{2,3} \\
a_{3,1} & a_{3,2} & a_{3,3}
\end{vmatrix} \\ &=
a_{1,1}a_{2,2}a_{3,3} \cdot
\begin{vmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & 1
\end{vmatrix} +
a_{1,1}a_{2,3}a_{3,2} \cdot
\begin{vmatrix}
1 & 0 & 0 \\
0 & 0 & 1 \\
0 & 1 & 0
\end{vmatrix} +
a_{1,2}a_{2,1}a_{3,3} \cdot
\begin{vmatrix}
0 & 1 & 0 \\
1 & 0 & 0 \\
0 & 0 & 1
\end{vmatrix} \\
&+ a_{1,2}a_{2,3}a_{3,1} \cdot
\begin{vmatrix}
1 & 0 & 0 \\
0 & 0 & 1 \\
1 & 0 & 0
\end{vmatrix} +
a_{1,3}a_{2,1}a_{3,2} \cdot
\begin{vmatrix}
0 & 0 & 1 \\
1 & 0 & 0 \\
0 & 1 & 0
\end{vmatrix} +
a_{1,3}a_{2,2}a_{3,1} \cdot
\begin{vmatrix}
0 & 0 & 1 \\
0 & 1 & 0 \\
1 & 0 & 0
\end{vmatrix} \\
\det(A) &= a_{1,1}a_{2,2}a_{3,3} - a_{1,1}a_{2,3}a_{3,2} - a_{1,2}a_{2,1}a_{3,3}
           + a_{1,2}a_{2,3}a_{3,1} + a_{1,3}a_{2,1}a_{3,2} - a_{1,3}a_{2,2}a_{3,1}
\end{aligned}
$$
Como se puede apreciar, las permutaciones de las columnas $(1, \ 2, \ 3)$ son:
$$
  (1, \ 2, \ 3) = (1, \ 2, \ 3), \ (1, \ 3, \ 2), \ (2, \ 1, \ 3), \ (2, \ 3, \ 1), \ (3, \ 1, \ 2), \ (3, \ 2, \ 1)
$$
**Ejemplo 1.** Calcule el determinante de la siguiente matriz $A$ usando la Gran Fórmula.
$$
A =
\begin{bmatrix}
0 & 0 & 1 & 1 \\
0 & 1 & 1 & 0 \\
1 & 1 & 0 & 0 \\
1 & 0 & 0 & 1
\end{bmatrix}
$$
**Solución.** Al ser $A$ una matriz de $4 \times 4$, su determinante consistirá de $4! = 24$ términos. No obstante, en este caso podemos ahorrar tiempo y reducir esa cantidad, porque muchas de sus entradas son iguales a cero, por lo que no es necesario considerarlas. Por lo tanto, consideremos solo las columnas y filas donde éstas son iguales a $1$.
$$
\begin{aligned}
\det(A) &=
\begin{vmatrix}
0 & 0 & 1 & 1 \\
0 & 1 & 1 & 0 \\
1 & 1 & 0 & 0 \\
1 & 0 & 0 & 1
\end{vmatrix} \\ &=
\begin{vmatrix}
0 & 0 & 1 & 0 \\
0 & 1 & 0 & 0 \\
1 & 0 & 0 & 0 \\
0 & 0 & 0 & 1
\end{vmatrix} +
\begin{vmatrix}
0 & 0 & 0 & 1 \\
0 & 0 & 1 & 0 \\
0 & 1 & 0 & 0 \\
1 & 0 & 0 & 0
\end{vmatrix} \\ &=
1(-1) + 1(1) \\
\det(A) &= 0
\end{aligned}
$$
Como el $\det(A) = 0$, por la propiedad 8 podemos confirmar que $A$ es una matriz singular o no invertible.

## 2.2 Método de los Cofactores.

Regresemos a la fórmula del determinante de una matriz $A$ de $3 \times 3$.
$$
  \det(A) = a_{1,1}a_{2,2}a_{3,3} - a_{1,1}a_{2,3}a_{3,2} - a_{1,2}a_{2,1}a_{3,3}
            + a_{1,2}a_{2,3}a_{3,1} + a_{1,3}a_{2,1}a_{3,2} - a_{1,3}a_{2,2}a_{3,1}
$$
Si observamos bien, notaremos que **cada entrada se repite** dos veces en los sumandos. En realidad, lo hacen en $(n - 1)!$ ocasiones. Esto nos da la posibilidad de **factorizarlos con respecto a una de sus filas**.

Por ejemplo, factoricemos el lado derecho de la ecuación de arriba a partir de las entradas de la primera fila (o fila $1$) del $\det(A)$.
$$
  \det(A) = a_{1,1}(a_{2,2}a_{3,3} - a_{2,3}a_{3,2}) - a_{1,2}(a_{2,1}a_{3,3} - a_{2,3}a_{3,1}) + a_{1,3}(a_{2,1}a_{3,2} - a_{2,2}a_{3,1})
$$
Veamos que cada paréntesis sigue la forma de la fórmula de un determinante de $2 \times 2$.
$$
\det(A) =
a_{1,1} \cdot
\begin{vmatrix}
a_{2,2} & a_{2,3} \\
a_{3,2} & a_{3,3}
\end{vmatrix} -
a_{1,2} \cdot
\begin{vmatrix}
a_{2,1} & a_{2,3} \\
a_{3,1} & a_{3,3}
\end{vmatrix} +
a_{1,3} \cdot
\begin{vmatrix}
a_{2,1} & a_{2,2} \\
a_{3,1} & a_{3,2}
\end{vmatrix}
$$

Solo por conveniencia, reescribamos el lado derecho de la siguiente manera:
$$
\det(A) =
a_{1,1} \cdot
\left(1 \cdot
\begin{vmatrix}
a_{2,2} & a_{2,3} \\
a_{3,2} & a_{3,3}
\end{vmatrix}
\right) +
a_{1,2} \cdot
\left(-1 \cdot
\begin{vmatrix}
a_{2,1} & a_{2,3} \\
a_{3,1} & a_{3,3}
\end{vmatrix}
\right) +
a_{1,3} \cdot
\left(1 \cdot
\begin{vmatrix}
a_{2,1} & a_{2,2} \\
a_{3,1} & a_{3,2}
\end{vmatrix}
\right)
$$
Los determinantes que se pueden apreciar en los paréntesis, reciben el nombre de **Menores** (*Minors*) y se denotan como $M_{i,j}$; mientras que los números que resultan del producto entre éstos y los $\pm 1$ se conoce como **Cofactores** $C_{i,j}$.

Básicamente, los **menores** son **determinantes de submatrices de la matriz original** que se forman de las entradas que no se encuentran en la fila y columna de aquella que factorizamos según su fila. En consecuencia, son de $(n - 1) \times (n - 1)$ dimensiones.  A continuación ilustramos de mejor manera esta idea con la ecuación anterior.
$$
\det(A) =
\begin{vmatrix}
a_{1,1} & 0 & 0 \\
0 & a_{2,2} & a_{2,3} \\
0 & a_{3,2} & a_{3,3}
\end{vmatrix} -
\begin{vmatrix}
0 & a_{1,2} & 0 \\
a_{2,1} & 0 & a_{2,3} \\
a_{3,1} & 0 & a_{3,3}
\end{vmatrix} +
\begin{vmatrix}
0 & 0 & a_{1,3} \\
a_{2,1} & a_{2,2} & 0 \\
a_{3,1} & a_{3,2} & 0
\end{vmatrix}
$$
En cuanto a los **cofactores**, el signo de éstos sigue el siguiente patrón: Si la suma entre el número de fila y el número de columna de la entrada que hemos factorizado es un número par, entonces es de signo positivo; y si es impar, pasa a ser de signo negativo. De forma más resumida, se señala que:
$$
  C_{i,j} = (-1)^{i + j} \cdot M_{i,j}
$$
donde $i$ y $j$ representan el número de fila y columna de la entrada $a_{i,j}$ que decidimos factorizar inicialmente según su fila en la matriz $A$.

Por lo tanto, el determinante de la matriz $A$ de $3 \times 3$ podemos obtenerlo a partir de la siguiente fórmula:
$$
\det(A) = a_{1,1}C_{1,1} + a_{1,2}C_{1,2} + a_{1,3}C_{1,3}
$$
La factorización por la fila que hemos señalado, formalmente se conoce como **expansión**. Por ejemplo, en el caso del determinante que calculamos arriba lo indicamos como "el determinante de $A$ expandido por la primera fila".

Así, podemos resumir la fórmula del determinante de una matriz de $n \times n$ usando **cofactores** como:
$$
  \det(A) = \sum_{j = 1}^{n} a_{i,j} C_{i,j}
$$
donde $i$ se mantiene fijo según la fila por la cual queramos expandir este determinante.
