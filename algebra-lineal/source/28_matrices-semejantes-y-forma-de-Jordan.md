---
title: "Clase 28. Matrices Semejantes y la Forma de Jordan."
subtitle: "Curso 'Linear Algebra' del MIT."
abstract: \noindent A partir de la información sobre los eigenvalores de una matriz, podemos agruparlas según su similitud bajo dicho valor y otros elementos. Al conjunto de matrices que cumplen con aquellas características se las conoce como **Matrices Semejantes**. En esta clase estudiaremos estas cualidades, revisando un tipo de ellas llamadas **Forma Normal de Jordan**.
geometry: margin=1in
lang: es
fontsize: 12pt
header-includes:
  - \usepackage{setspace} \onehalfspacing
  - \usepackage{parskip}
  - \usepackage{amsmath}
---


# 1. Matrices Semejantes.

Cuando trabajamos con matrices cuadradas, podría ser de nuestro interés encontrar otras que sean **semejantes** a las primeras.

En general, dos matrices $A$ y $B$ de $n \times n$ dimesiones son semejantes, o $A \sim B$, si existe una tercera matriz $M$ **invertible** del mismo tamaño que las anteriores tal que:
$$
  B = M^{-1} A M
$$
La semejanza entre matrices es bidireccional, en el sentido de que si $A \sim B$, entonces $B \sim A$ para la misma matriz $M$. Para demostrarlo, multipliquemos por $M$ a la izquierda y por $M^{-1}$ a la derecha en la igualdad de arriba.
$$
\begin{aligned}
  M B M^{-1} &= M M^{-1} A M M^{-1} \\
  M B M^{-1} &= I A I \\
  M B M^{-1} &= A
\end{aligned}
$$
En cuanto a la matriz $M$, ésta puede ser cualquiera siempre que no sea singular. Por lo tanto, para una matriz $A$ de $n \times n$ podemos obtener un grupo de matrices semejantes, donde la principal característica que las une es que **sus eigenvalores son iguales**.

Para demostrar que los eigenvalores de dos o más matrices semejantes son iguales, podemos usar sus **polinomios característicos**. Digamos que $A$ y $B$ son dos matrices de $n \times n$ donde $A \sim B$ y viceversa. Entonces,
$$
\det(A - \lambda I) = \det(B - \lambda I)
$$
Como $A \sim B$, entonces $B = M^{-1} A M$.
$$
\begin{aligned}
\det(A - \lambda I) &= \det(M^{-1} A M - \lambda I) \\
                    &= \det(M^{-1} A M - \lambda (M^{-1}M)) \\
                    &= \det(M^{-1} \cdot [A - \lambda I] \cdot  M)
\end{aligned}
$$
Tanto $M^{-1}$ como $(A - \lambda I)$ y $M$ son matrices. En la Clase 18 vimos que el determinante de un producto matricial es igual al producto de los determinantes de las matrices (propiedad 9). Por lo tanto,
$$
\begin{aligned}
\det(A - \lambda I) &= \det(M^{-1}) \cdot \det(A - \lambda I) \cdot \det(M) \\
                    &= \det(M^{-1}) \cdot \det(M) \cdot \det(A - \lambda I) \\
                    &= \det(M^{-1} \cdot M) \cdot \det(A - \lambda I) \\
                    &= \det(I) \cdot \det(A - \lambda I) \\
                    &= 1 \cdot \det(A - \lambda I) \\
\det(A - \lambda I) &= \det(A - \lambda I) \qquad (\text{Q. E. D})
\end{aligned}
$$
Ahora bien, cuando dos o más matrices son semejeantes, solo sus eigenvalores son iguales y **no sus eigenvectores**. Si estos últimos también lo fuesen, las matrices serían iguales.

## 1.1 Eigenvalores distintos.

Al buscar las matrices semejantes de $A$ de $n \times n$, generalmente se aspira encontrar una diagonal. Como sabemos, si $A$ tiene $n$ eigenvalores distintos, podemos diagonalizarla como:
$$
A = S^{-1} \Lambda S
$$
donde $S$ es una matriz cuyas columnas son los eigenvectores de $A$ y $\Lambda$ es una matriz diagonal con los eigenvalores de $A$. A partir de lo que hemos estudiado sobre matrices similares, podemos observar que
$$
  \Lambda \sim A
$$
y viceversa, donde $M = S$.

La matriz $\Lambda$ siempre será la mejor opción de todas las semejantes de $A$, porque conocemos de inmediato sus eigenvalores (están en su diagonal principal) y podemos usar la definición $\Lambda \vec{x} _ {i} = \lambda _ {i} \vec{x} _ {i}$ ($i = 1, \ 2, \cdots, \ n$) para encontrar rápidamente sus eigenvectores los que, a su vez, son ortonormales estándar.

Por ejemplo, la matriz
$$
A =
\begin{bmatrix}
2 & 1 \\
1 & 2
\end{bmatrix}
$$
tiene su correspondiente matriz diagonal
$$
\Lambda =
\begin{bmatrix}
3 & 0 \\
0 & 1
\end{bmatrix}
$$
Como vemos, los eigenvalores de $A$ son los mismo de $\Lambda$, donde $\lambda_{i} = (3, \ 1)$. Los eigenvectores $\vec{x} _ {1}$ y $\vec{x} _ {2}$ de la última matriz podemos ver que son:
$$
\begin{aligned}
\Lambda \vec{x} _ {1} &= \lambda_{1} \vec{x} _ {1} & \qquad \qquad
\Lambda \vec{x} _ {2} &= \lambda_{2} \vec{x} _ {2} \\
\begin{bmatrix}
3 & 0 \\
0 & 1
\end{bmatrix} \cdot
\begin{bmatrix}
1 \\ 0
\end{bmatrix} &=
3 \cdot
\begin{bmatrix}
1 \\ 0
\end{bmatrix} & \qquad \qquad
\begin{bmatrix}
3 & 0 \\
0 & 1
\end{bmatrix} \cdot
\begin{bmatrix}
0 \\ 1
\end{bmatrix} &=
1 \cdot
\begin{bmatrix}
0 \\ 1
\end{bmatrix}
\end{aligned}
$$
Si calculamos los eigenvectores de $A$ veremos que son distintos a los de $\Lambda$.

## 1.2 Eigenvalores repetidos.

Así como una matriz cuadrada puede tener eigenvalores distintos, sabemos que éstos también pueden repetirse.

Como estudiamos en la Clase 21, cuando una matriz de $n \times n$ tiene **eigenvalores repetidos** es muy posible que, para dichos casos, sus correspondientes eigenvectores sean linealmente dependientes^[Una excepción es la matriz identidad $I$. Todos sus eigenvalores son iguales a $1$, pero de igual manera sus eigenvectores son linealmente independientes.]. Como consecuencia, **no se podrá diagonalizar** puesto que la dimensión de la matriz de los vectores característicos será menor a la original.

Es importante tener en consideración cuando una matriz cuadrada no es diagonalizable, porque podemos encontrarnos con matrices diagonales con los mismos eigenvalores repetidos de la primera, pero aún así no son semejantes.

Por ejemplo, las matrices
$$
A =
\begin{bmatrix}
4 & 1 \\
0 & 4
\end{bmatrix} \qquad \text{y} \qquad
B =
\begin{bmatrix}
4 & 0 \\
0 & 4
\end{bmatrix}
$$
tienen dos eigenvalores repetidos y, a la vez, son los mismos en ambas. Sin embargo, $B \nsim A$ y viceversa porque:
$$
B =
\begin{bmatrix}
4 & 0 \\
0 & 4
\end{bmatrix} =
4 \cdot
\begin{bmatrix}
1 & 0 \\
0 & 1
\end{bmatrix} =
4 I
$$
Por lo tanto, para cualquier matriz $M$ invertible:
$$
  B = M^{-1} (4I) M = 4 (M^{-1} I M) = 4 (M^{-1}M) = 4I = B
$$
En otras palabras, podemos decir que $B$ es "semejante consigo misma". La matriz $A$ tiene su propio grupo de matrices semejantes, pero no incluye a la diagonal $B$ y es razonable porque la diagonal $\Lambda$ no existe al tener eigenvalores repetidos.


# 2. Forma normal (canónica) de Jordan.

Acabamos de estudiar que si una matriz $A$ de $n \times n$ tiene eigenvalores repetidos, entonces es posible que no sea semejante a una matriz diagonal con los mismos valores propios. No obstante, podemos obtener una matriz cercana a $\Lambda$ y se conoce como **Forma Normal de Jordan** de $A$. En ocasiones es posible encontrarla como forma **canónica** de Jordan.

Para toda matriz $A$ de $n \times n$ es posible encontrar su forma normal de Jordan, denotada como $J$, donde $J \sim A$. Es decir,
$$
  J = M^{-1} A M
$$
Cuando todos los eigenvalores de $A$ son distintos, se cumple que $J = \Lambda$. En cambio, cuando algunos o todos ellos se repiten, es posible formar bloques de matrices en su diagonal, denotados como $J_{i}$, llamados **Bloques de Jordan**.

Cada bloque de Jordan se caracteriza, primero, por tener los eigenvalores repetidos en su diagonal principal (los que, a su vez, también lo están en $J$), arriba de ésta se ubican $1$ y el resto son $0$s. Y en segundo lugar, por poseer solo un eigenvector en cada matriz $J_{i}$.

En este curso no veremos cómo calcular una forma normal de Jordan, puesto que si bien sabemos encontrar los eigenvalores de la matriz original^[Por medio de la ecuación característica.], necesitamos conocer otras operaciones que están fuera del alcance de éste. No obstante, veamos el siguiente ejemplo^[Lo tomé de la siguiente página de Wikipedia: [https://en.wikipedia.org/wiki/Jordan_normal_form](https://en.wikipedia.org/wiki/Jordan_normal_form)].
$$
A =
\begin{bmatrix}
5 & 4 & 2 & 1 \\
0 & 1 & -1 & -1 \\
-1 & -1 & 3 & 0 \\
1 & 1 & -1 & 2
\end{bmatrix}
$$
Los eigenvalores de $A$ son $\lambda_{i} = (1, \ 2, \ 4, \ 4)$. Como vemos, dos de los $\lambda$'s se repiten y como no es la matriz identidad, podemos asegurar que solo tendremos tres de cuatro eigenvectores. No obstante, es posible encontrar su forma normal de Jordan, la cual es la siguiente:
$$
J =
\begin{bmatrix}
1 & 0 & 0 & 0 \\
0 & 2 & 0 & 0 \\
0 & 0 & 4 & 1 \\
0 & 0 & 0 & 4
\end{bmatrix}
$$
En la esquina inferior derecha de la matriz $J$ se puede observar un bloque de Jordan.
$$
J =
\left[
\begin{array}{c c|c c}
1 & 0 & 0 & 0 \\
0 & 2 & 0 & 0 \\
\hline
0 & 0 & 4 & 1 \\
0 & 0 & 0 & 4
\end{array}
\right]
$$
el cual denotaremos como $J_{1}$.
$$
J_{1} =
\begin{bmatrix}
4 & 1 \\
0 & 4
\end{bmatrix}
$$
Si buscamos matrices semejantes a $A$, la matriz $J$ es la mejor opción para trabajar si consideramos que no existe $\Lambda$, ya que contiene sus eigenvalores y podemos obtener sus eigenvectores fácilmente al ser casi diagonal.





