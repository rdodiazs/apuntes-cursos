---
title: Clase 20. Fórmula Matriz Inversa, Regla de Cramer y Volumen de una Caja.
subtitle: Curso 'Linear Algebra' del MIT.
abstract: \noindent Por medio de lo que hemos aprendido sobre los determinantes, en particular de sus propiedades y su fórmula de cofactores, veremos una generalización algebraica para encontrar una matriz inversa, estudiaremos la regla de Cramer como un medio para conocer la solución de un sistema $A \vec{x} = \vec{b}$ y revisaremos la interpretación geométrica de este escalar, como el valor absoluto del volumen de una caja.
lang: es
fontsize: 12pt
geometry: margin=1in
header-includes:
  - \usepackage{setspace} \onehalfspacing
  - \usepackage{parskip}
  - \usepackage{amsmath, amssymb}
  - \usepackage{tikz}
---


# 1. Fórmula de la Matriz Inversa.

La clase pasada estudiamos la siguiente fórmula para calcular el determinante de una matriz cuadrada $A$:
$$
  \det(A) = \sum_{j = 1}^{n} a_{i, j} \cdot C_{i, j},
$$
donde $C_{i, j}$ es el **cofactor** de $A$ expandido por la fila $i$ de esta matriz y que se calcula como $C_{i, j} = (-1)^{i + j} \cdot M_{i, j}$.

A partir de cada cofactor $C_{i, j}$ de $A$ de $n \times n$  podemos formar una **matriz de cofactores** $C$. Si calculamos la multiplicación escalar entre el recíproco del determinante y la transpuesta de la matriz $C$, siempre que el primero sea distinto de cero, obtenemos la **matriz inversa** de $A$.
$$
  A^{-1} = \frac{1}{\det(A)} \cdot C^{T} \iff \det(A) \neq 0
$$
Hasta ahora solo sabíamos obtener de forma numérica a la matriz $A^{-1}$ por medio del método de Gauss-Jordan. Si bien sigue siendo la forma más eficiente de obtenerla, la **fórmula** que acabamos de ver usando el $\det(A)$ y la matriz $C^{T}$ (también conocida como **matriz adjunta** de $A$ o Adj$(A)$) nos da la facilidad de interactuar **algebraicamente** con ella.

## 1.1 Aplicación: Fórmula matriz inversa de $2 \times 2$.

Usemos la fórmula de la matriz inversa para conocerla en
$$
A =
\begin{bmatrix}
a & b \\
c & d
\end{bmatrix},
$$
la cual es no singular, con $\det(A) \neq 0$.

Comencemos calculando los cofactores de $A$ expandiendo por su primera fila:
$$
\begin{aligned}
  C_{1, 1} &= (-1)^{1 + 1} \cdot d \qquad & C_{1, 2} &= (-1)^{1 + 2} \cdot c \\
           &= d                           &          &= -c
\end{aligned}
$$
y luego por su segunda fila.
$$
\begin{aligned}
  C_{2, 1} &= (-1)^{2 + 1} \cdot b \qquad & C_{2, 2} &= (-1)^{2 + 2} \cdot a \\
           &= -b                          &          &= a
\end{aligned}
$$
Esto implica que la matriz de cofactores $C$ es:
$$
C =
\begin{bmatrix}
d & -c \\
-b & a
\end{bmatrix}
$$
y su transpuesta:
$$
C^{T} =
\begin{bmatrix}
d & -b \\
-c & a
\end{bmatrix}
$$
Sabemos que el determinante de $A$ se calcula como:
$$
  \det(A) = ad - bc
$$
Por lo tanto, la fórmula de la matriz de $A$ de $2 \times 2$ es la siguiente:
$$
A^{-1} =
\frac{1}{ad - bc} \cdot
\begin{bmatrix}
d & -b \\
-c & a
\end{bmatrix}
$$

## 1.2 Demostración Fórmula de Matriz Inversa.

Sea $A$ una matriz no singular de $n \times n$, cuya inversa es $A^{-1}$. Esto implica que:
$$
  A A^{-1} = I
$$
Como podemos asegurar que $\det(A) \neq 0$, es posible reescribir la igualdad de arriba de la siguiente manera:
$$
  A \cdot \left(\frac{1}{\det(A)} \cdot C^{T}\right) = I
$$
Luego, multipliquemos esta ecuación por el $\det(A)$.
$$
  A \cdot C^{T} = I \cdot \det(A)
$$
Cuando calculamos $A \cdot C^{T}$, en ocasiones ocurrirá que las entradas de cada fila de $A$ coincidirán con estar en la misma posición de las de ciertas columnas de $C^{T}$, ya que cada columna de esta última corresponde a cada fila de $C$. En ese sentido, algunos productos punto resultarán en $\sum_{j = 1}^{n} a_{i, j} \cdot C_{i, j}$, con $i$ siendo constante. Es decir, serán iguales al $\det(A)$.

Debido a que algunos productos punto en $A \cdot C^{T}$ serán equivalente al $\det(A)$, la diagonal principal de la matriz resultante estará compuesta de dicho valor, mientras que las entradas por sobre y debajo de ella serán ceros. En consecuencia:
$$
\begin{aligned}
A \cdot C^{T} &= I \cdot \det(A) \\
\begin{bmatrix}
\det(A) & 0 & \cdots & 0 \\
0 & \det(A) & \cdots & 0 \\
\vdots & \vdots & \ddots & \vdots \\
0 & 0 & \cdots & \det(A)
\end{bmatrix} &=
I \cdot \det(A) \\
\begin{bmatrix}
1 & 0 & \cdots & 0 \\
0 & 1 & \cdots & 0 \\
\vdots & \vdots & \ddots & \vdots \\
0 & 0 & \cdots & 1
\end{bmatrix} \cdot
\det(A) &= I \cdot \det(A) \\
I \cdot \det(A) &= I \cdot \det(A) \qquad (\text{Q.E.D})
\end{aligned}
$$

La explicación de que hayan ceros sobre y debajo de la diagonal de $A \cdot C^{T}$ se da por el hecho de que aquellos productos punto que resultan en aquel valor, también podemos interpretarlos como los **determinantes de matrices singulares**. Veámoslo con la matriz de $2 \times 2$ de la subsección anterior, donde:
$$
\begin{aligned}
A &=
\begin{bmatrix}
a & b \\
c & d
\end{bmatrix}, &
C &=
\begin{bmatrix}
d & -c \\
-b & a
\end{bmatrix}, &
C^{T} &=
\begin{bmatrix}
d & -b \\
-c & a
\end{bmatrix}
\end{aligned}
$$
Cuando calculamos el producto $A \cdot C^{T}$, obtenemos lo siguiente:
$$
A \cdot C^{T} =
\begin{bmatrix}
a & b \\
c & d
\end{bmatrix} \cdot
\begin{bmatrix}
d & -b \\
-c & a
\end{bmatrix} =
\begin{bmatrix}
ad + b(-c) & a(-b) + ba \\
cd + d(-c) & c(-b) + da
\end{bmatrix} =
\begin{bmatrix}
ad - bc & ba - ab \\
cd - dc & da - cb
\end{bmatrix}
$$
Como vemos, cada entrada de la matriz $A \cdot C^{T}$ sigue la estructura de la fórmula del determinante de una matriz de $2 \times 2$:
$$
A \cdot C^{T} =
\begin{bmatrix}
\begin{vmatrix} a & b \\ c & d \end{vmatrix} & \begin{vmatrix} b & a \\ b & a \end{vmatrix} \\ \\
\begin{vmatrix} c & d \\ c & d \end{vmatrix} & \begin{vmatrix} d & c \\ b & a \end{vmatrix}
\end{bmatrix}
$$
Aquí podemos observar con mayor claridad que las entradas de la diagonal principal de $A \cdot C^{T}$ son equivalentes al $\det(A)$, mientras que las dos restantes serán **iguales a cero** lo cual está dado por la Propiedad 4 de los determinantes que estudiamos en la Clase 18. Además, esto último también implica que **dichas matrices son singulares**.


# 2. Regla de Cramer.

El determinante de una matriz también puede ser usado para resolver un sistema cuadrado de ecuaciones lineales. Este método recibe el nombre de la **Regla de Cramer**, ya que fue desarrollada por el matemático suizo Gabriel Cramer en el siglo 18.

La regla de Cramer podemos explicarla de la siguiente manera: Si tenemos un sistema $A\vec{x} = \vec{b}$, con $A$ de $n \times n$, y posee **una única solución**, es posible obtener cada coordenada de esta última (i.e, cada componente de $\vec{x}$) por medio de las fórmulas que vemos a continuación.
$$
  x_{1} = \frac{\det(B_{1})}{\det(A)}, \qquad
  x_{2} = \frac{\det(B_{2})}{\det(A)}, \qquad
  \cdots, \qquad
  x_{n} = \frac{\det(B_{n})}{\det(A)}
$$
donde $B_{j}$, para $j = 1, \ 2, \ \cdots, \ n$, son la **matriz $A$ con su $j$-ésimo vector columna siendo reemplazado por $\vec{b}$**.

$$
\begin{aligned}
B_{1} &=
\begin{bmatrix}
b_{1} & a_{1, 2} & \cdots & a_{1, n} \\
b_{2} & a_{2, 2} & \cdots & a_{2, n} \\
\vdots & \vdots & \ddots & \vdots \\
b_{n} & a_{n, 2} & \cdots & a_{n, n}
\end{bmatrix}, &
B_{2} &=
\begin{bmatrix}
a_{1, 1} & b_{1} & \cdots & a_{1, n} \\
a_{2, 1} & b_{2} & \cdots & a_{2, n} \\
\vdots & \vdots & \ddots & \vdots \\
a_{n, 1} & b_{n} & \cdots & a_{n, n}
\end{bmatrix}, &
\cdots, & \\
B_{n} &=
\begin{bmatrix}
a_{1, 1} & a_{1, 2} & \cdots & b_{1} \\
a_{2, 1} & a_{2, 2} & \cdots & b_{2} \\
\vdots & \vdots & \ddots & \vdots \\
a_{n, 1} & a_{n, 2} & \cdots & b_{n}
\end{bmatrix}
\end{aligned}
$$
La explicación de este método podemos encontrarla usando la fórmula de la matriz inversa obtenida con el $\det(A)$.

Recordemos que si existe $A^{-1}$, podemos garantizar que el sistema $A\vec{x} = \vec{b}$ tiene una única solución, la cual es dada por:
$$
  \vec{x} = A^{-1} \cdot \vec{b}
$$
Debido a que $A^{-1} = (1/\det(A)) \cdot C^{T}$, podemos reescribir la ecuación de arriba como:
$$
  \vec{x} = \frac{1}{\det(A)} \cdot C^{T} \cdot \vec{b}
$$
donde los componentes del vector $C^{T} \cdot \vec{b}$ van a ser equivalentes a los $\det(B_{j})$.

Para ilustrar lo anterior, trabajemos con el siguiente sistema de ecuaciones lineales:
$$
  A \vec{x} = \vec{b}
$$
donde:
$$
A =
\begin{bmatrix}
a & b \\
c & d
\end{bmatrix}, \quad
\vec{x} = \begin{bmatrix} x_{1} \\ x_{2} \end{bmatrix}, \quad
\vec{b} = \begin{bmatrix} b_{1} \\ b_{2} \end{bmatrix}
$$
y asumamos que $\det(A) \neq 0$.

Nos interesa conocer los componentes del vector:
$$
  \vec{x} = \frac{1}{\det(A)} \cdot C^{T} \cdot \vec{b}
$$
Al calcular las entradas de la matriz $C^{T}$ (que obtuvimos en la sección anterior), la ecuación de arriba es equivalente a:

$$
\vec{x} =
\frac{1}{\det(A)} \cdot
\left(
\begin{bmatrix}
d & -b \\
-c & a
\end{bmatrix} \cdot
\begin{bmatrix} b_{1} \\ b_{2} \end{bmatrix}
\right)
$$
Resolvamos el paréntesis de la derecha.
$$
\begin{aligned}
\vec{x} =
\frac{1}{\det(A)} \cdot
\left(
b_{1} \cdot \begin{bmatrix} d \\ -c \end{bmatrix} +
b_{2} \cdot \begin{bmatrix} -b \\ a \end{bmatrix}
\right)
=
\frac{1}{\det(A)} \cdot
\begin{bmatrix} b_{1}d - b_{2}b \\ b_{2}a - b_{1}c \end{bmatrix}
=
\frac{1}{\det(A)} \cdot
\begin{bmatrix}
\begin{vmatrix}
b_{1} & b_{2} \\
b & d
\end{vmatrix} \\ \\
\begin{vmatrix}
b_{2} & b_{1} \\
c & a
\end{vmatrix}
\end{bmatrix}
\end{aligned}
$$
Por lo tanto, las soluciones del sistema (o los componentes de $\vec{x}$) son:
$$
\begin{aligned}
  x_{1} = \frac{
                  \begin{vmatrix} b_{1} & b_{2} \\ b & d \end{vmatrix}
                }{
                  \begin{vmatrix} a & b \\ c & d \end{vmatrix}
                }
         = \frac{b_{1}d - b_{2}b}{ad - bc} \qquad \text{y} \qquad
  x_{2} = \frac{
                  \begin{vmatrix} b_{2} & b_{1} \\ c & a \end{vmatrix}
                }{
                  \begin{vmatrix} a & b \\ c & d \end{vmatrix}
                }
         = \frac{b_{2}a - b_{1}c}{ad - bc}
\end{aligned}
$$
Ahora usemos la **regla de Cramer** para ver si obtenemos lo mismo. Comencemos buscando las matrices $B_{j}$.
$$
B_{1} =
\begin{bmatrix}
b_{1} & b \\
b_{2} & d
\end{bmatrix}
\qquad \text{y} \qquad
B_{2} =
\begin{bmatrix}
a & b_{1} \\
c & b_{2}
\end{bmatrix}
$$
Luego, calculemos el cuociente entre los $\det(B_{j})$ y el $\det(A)$ para conocer los valores $x_{1}$ y $x_{2}$ de la solución de $A\vec{x} = \vec{b}$.
$$
\begin{aligned}
  x_{1} = \frac{\det(B_{1})}{\det(A)}
         = \frac{
              \begin{vmatrix}
              b_{1} & b \\
              b_{2} & d
              \end{vmatrix}
            }{
              \begin{vmatrix}
              a & b \\
              c & d
              \end{vmatrix}
            }
          = \frac{b_{1}d - bb_{2}}{ad - bc} \qquad \text{y} \qquad
  x_{2} = \frac{\det(B_{2})}{\det(A)}
         = \frac{
              \begin{vmatrix}
              a & b_{1} \\
              c & b_{2}
              \end{vmatrix}
            }{
              \begin{vmatrix}
              a & b \\
              c & d
              \end{vmatrix}
            }
          = \frac{ab_{2} - b_{1}c}{ad - bc}
\end{aligned}
$$
Como podemos observar, las soluciones son idénticas y la regla de Cramer se puede explicar al usar la fórmula de la matriz inversa.

No obstante, el gran problema de la regla de Cramer es que se vuelve ineficiente cuando trabajamos con matrices cuadradas de gran tamaño, debido a la cantidad de determinantes que debemos calcular. Es por ello que **no es recomendado usarla** para resolver sistemas cuadrados de ecuaciones lineales. Aún así, su valor está en que nos da una expresión algebraica sobre cómo conocer su única solución cuando existe, por medio de matrices.


# 3. El volumen de una caja.

A nivel geométrico, el **valor absoluto del determinante** de una matriz corresponde al **volumen de un paralelepipedo** (que, de ahora en adelante, llamaremos como "caja").

En particular, se parte del supuesto de que si tenemos una matriz $A$ de $3 \times 3$ y graficamos sus **vectores fila** en el espacio, podemos construir una caja como la que vemos a continuación.

\begin{figure}[hbt!]
\centering

\begin{tikzpicture}

% Celdas de ayuda.
%\draw [help lines] (-7, -3.3) grid (7, 3.3);

% Ejes de coordenadas.
\draw [->] (0, 0, 0) -- (3, 0, 0) node [below] {$x_{2}$};
\draw [->] (0, 0, 0) -- (0, 3, 0) node [left] {$x_{3}$};
\draw [->] (0, 0, 0) -- (0, 0, 3) node [left] {$x_{1}$};

% --- Caja.--- %
%% Vectores fila de matriz A.
\draw [->, line width=0.5mm] (0, 0) -- (2, 0.2) node [right] {$\vec{a}_{1}$};
\draw [->, line width=0.5mm] (0, 0) -- (1, 1) node [below] {$\vec{a}_{2}$};
\draw [->, line width=0.5mm] (0, 0) -- (0.5, 2) node [above] {$\vec{a}_{3}$};

%% Aristas restantes.
\draw (2, 0.2) -- (2.9, 1.1) -- (1, 1);
\draw (1, 1) -- (1.3, 2.5) -- (3.2, 2.6) -- (2.9, 1.1);
\draw (2, 0.2) -- (2.5, 2.15);
\draw (3.2, 2.6) -- (2.5, 2.15) -- (0.5, 2) -- (1.3, 2.5);

\end{tikzpicture}

\end{figure}

donde los vectores fila de $A$ son $\vec{a}_{1} = [a_{1, 1} \ a_{1, 2} \ a_{1, 3}]$, $\vec{a}_{2} = [a_{2, 1} \ a_{2, 2} \ a_{2, 3}]$ y $\vec{a}_{3} = [a_{3, 1} \ a_{3, 2} \ a_{3, 3}]$.
$$
A =
\begin{bmatrix}
\vec{a}_{1} \\
\vec{a}_{2} \\
\vec{a}_{3}
\end{bmatrix} =
\begin{bmatrix}
a_{1, 1} & a_{1, 2} & a_{1, 3} \\
a_{2, 1} & a_{2, 2} & a_{2, 3} \\
a_{2, 1} & a_{2, 2} & a_{3, 3}
\end{bmatrix}
$$
Una forma de mostrar que el valor absoluto de un determinante es equivalente al volumen de una caja, es viendo cómo se cumplen las tres propiedades del primero en este caso.

La primera propiedad del determinante señala que el $\det(I) = 1$. Si la matriz $I$ es de $3 \times 3$, al graficarlo como lo hicimos anteriormente obtendremos un **cubo unitario**. Es decir, de lado y área igual a $1$.

Tomándonos de la propiedad $1$ también es posible demostrar que el $\det(Q) = 1$, donde $Q$ es una **matriz ortogonal**. En la Clase 17 vimos que sus vectores columna son una base (*basis*) ortonormal y que
$$
  Q^{T}Q = I
$$
Al calcular el determinante en ambos lados de la ecuación, podemos demostrar que el $\det(Q) = 1$ por las propiedades $1$, $9$ y $10$.

$$
\begin{aligned}
  \det(Q^{T}Q) &= \det(I) \\
  \det(Q^{T}) \cdot \det(Q) &= 1 \\
  (\det(Q))^{2} &= 1 \\
  \det(Q) &= 1 \quad (\text{Q.E.D})
\end{aligned}
$$
Entonces, el **valor absoluto de un determinante de una matriz ortogonal** $Q$ corresponde al **área de un cubo unitario, pero rotado** si lo comparamos al de una matriz identidad $I$.

La **propiedad 2** de los determinante indica que el $\det(P) = \pm 1$, con $P$ siendo una matriz de permutación y el $\det(P) < 0$ si el número de intercambios de fila es impar. Este caso no es muy relevante, porque el área lo calculamos como el valor absoluto de este valor.

También podemos aplicar la **propiedad 3.a** de los determinantes en el cálculo del área de una caja, ya que si "estiramos" uno de los vectores fila de la matriz cuadrada $A$ por un factor $t \in \mathbb{R}$ y mantenemos los otros constantes, el **área de la caja** que podemos formar con éstos también **aumentará en $t$ veces**. Es decir, lo que estamos haciendo es:

Por ejemplo, supongamos que escalamos por un factor $t$ la primera fila de la matriz $A$ que vimos al inicio de esta sección.
$$
A =
\begin{bmatrix}
ta_{1, 1} & ta_{1, 2} & ta_{1, 3} \\
a_{2, 1} & a_{2, 2} & a_{2, 3} \\
a_{3, 1} & a_{3, 2} & a_{3, 3}
\end{bmatrix}
$$
Al calcular el determinante, obtenemos que:
$$
\det(A) =
\begin{vmatrix}
ta_{1, 1} & ta_{1, 2} & ta_{1, 3} \\
a_{2, 1} & a_{2, 2} & a_{2, 3} \\
a_{3, 1} & a_{3, 2} & a_{3, 3}
\end{vmatrix}
=
t \cdot
\begin{vmatrix}
a_{1, 1} & a_{1, 2} & a_{1, 3} \\
a_{2, 1} & a_{2, 2} & a_{2, 3} \\
a_{3, 1} & a_{3, 2} & a_{3, 3}
\end{vmatrix}
=
t \cdot \det(A)
$$
Como vemos, si consideramos el $|\det(A)|$ como el volumen de una caja, al expandir uno de sus lados que corresponde a un vector fila de $A$ por un factor $t$, este valor aumenta en la misma cantidad.

Por otra parte, si **sumamos una fila** a uno de los vectores fila de la caja, veremos que su área será equivalente a la **suma de éste con el de otra caja**, lo cual podemos explicarlo por la **propiedad 3.b** de los determinantes.

Supongamos que a la matriz $A$ del inicio de esta sección le sumamos un vector fila $\langle c_{1}, \ c_{2}, \ c_{3} \rangle$ y las otras las mantenemos igual.
$$
A =
\begin{bmatrix}
a_{1, 1} & a_{1, 2} & a_{1, 3} \\
a_{2, 1} + c_{1} & a_{2, 2} + c_{2} & a_{2, 3} + c_{3} \\
a_{3, 1} & a_{3, 2} & a_{3, 3}
\end{bmatrix}
$$
Al calcular el $\det(A)$, por la propiedad 3.b resultará en lo siguiente:
$$
\begin{aligned}
\det(A) &=
\begin{vmatrix}
a_{1, 1} & a_{1, 2} & a_{1, 3} \\
a_{2, 1} + c_{1} & a_{2, 2} + c_{2} & a_{2, 3} + c_{3} \\
a_{3, 1} & a_{3, 2} & a_{3, 3}
\end{vmatrix} \\
&=
\begin{vmatrix}
a_{1, 1} & a_{1, 2} & a_{1, 3} \\
a_{2, 1} & a_{2, 2} & a_{2, 3} \\
a_{3, 1} & a_{3, 2} & a_{3, 3}
\end{vmatrix} +
\begin{vmatrix}
a_{1, 1} & a_{1, 2} & a_{1, 3} \\
c_{1} & c_{2} & c_{3} \\
a_{3, 1} & a_{3, 2} & a_{3, 3}
\end{vmatrix} \\
\det(A) &=
\det(A) + \det(W)
\end{aligned}
$$
donde $W$ es la siguiente matriz:
$$
W =
\begin{bmatrix}
a_{1, 1} & a_{1, 2} & a_{1, 3} \\
c_{1} & c_{2} & c_{3} \\
a_{3, 1} & a_{3, 2} & a_{3, 3}
\end{bmatrix}
$$
Por lo tanto, al aplicarse las tres primeras propiedades de los **determinantes** (que son las fundamentales para conocer el resto de ellas) podemos dar por demostrado que **su valor absoluto** coincide con ser equivalente al **área de una caja**.

## 3.1 Área de un paralelógramo.

Consideremos la siguiente matriz $A$:
$$
A =
\begin{bmatrix}
a_{1, 1} & a_{1, 2} \\
a_{2, 1} & a_{2, 2}
\end{bmatrix}
$$
De igual modo a lo visto en la subsección anterior, el **valor absoluto del determintante** de esta **matriz de $2 \times 2$**, es equivalente al **área de un paralelógramo** el cual podemos formar con los vectores fila de $A$.

\newpage

\begin{figure}[hbt!]
\centering

\begin{tikzpicture}
% Celdas de ayuda.
% \draw [help lines] (-7, -4) grid (7, 4);

% Ejes de coordenadas.
\draw [->] (0, 0) -- (3, 0) node[below] {$x_{1}$};
\draw [->] (0, 0) -- (0, 3) node[left] {$x_{2}$};

% Suma de los dos vectores fila.
% \draw [->, blue, line width=0.5mm] (0, 0) -- (3.5, 1.7);
\node [right] at (3.52, 1.7) {$(a_{1, 1} + a_{2, 1}, \ a_{1, 2} + a_{2, 2})$};

% Vectores fila.
\draw [->, line width=0.5mm] (0, 0) -- (2.2, 0.3) node[right] {$(a_{1, 1}, \ a_{1, 2})$};
\draw [->, line width=0.5mm] (0, 0) -- (1.7, 1.7) node[above] {$(a_{2, 1}, \ a_{2, 2})$};

% Aristas restantes.
\draw (2.2, 0.3) -- (3.5, 1.7) -- (1.7, 1.7);

% Origen.
\node [left] at (0, 0) {$(0, \ 0)$};

\end{tikzpicture}
\end{figure}

donde:
$$
  |\det(A)| = \text{Área del paralelógramo}
$$
Entonces, al tener las coordenadas de cada esquina de un paralelógramo, podemos conocer su área calculando el determinante de la matriz que podemos formar con ellos.

Ahora bien, el paralelógramo que formamos lo obtuvimos a partir de la matriz $A$ de $2 \times 2$. Si no conocemos a esta última, pero sí las coordenadas de esta figura y que uno de sus puntos se encuentra en $(0, \ 0)$, podemos continuar sin problemas, pero si no ocurre aquello, tenemos que hacer un pequeño trabajo adicional.

Supongamos que tenemos la siguiente figura:

\begin{figure}[hbt!]
\centering

\begin{tikzpicture}
% Celdas de ayuda.
%\draw [help lines] (-7, -4) grid (7, 4);

% Origen.
\node [left] at (0, 0) {$(0, \ 0)$};

% Ejes de coordenadas.
\draw [->] (0, 0) -- (5, 0) node[below] {$x$};
\draw [->] (0, 0) -- (0, 3) node[left] {$y$};

% Paralelógramo.
\draw (1, 1) node [below] {$(x_{1}, y_{1})$} --
      (3.2, 1.3) node [below] {$(x_{2}, y_{2})$} --
      (4.5, 2.7) node [right] {$(x_{3}, y_{3})$} --
      (2.7, 2.7) node [above] {$(x_{4}, y_{4})$} --
      cycle;
\end{tikzpicture}
\end{figure}

Como vemos, ningún punto se encuentra en el origen. Si llevamos las coordenadas a una matriz, para que sea cuadrada la mejor opción es **añadir una columna extra de solo unos**. Denotemos a esta matriz como $V$.
$$
V =
\begin{bmatrix}
x_{1} & y_{1} & 1 \\
x_{2} & y_{2} & 1 \\
x_{3} & y_{3} & 1
\end{bmatrix}
$$
Luego, el área del paralelógramo que vimos será el valor absoluto del $\det(V)$, que podemos conocer por medio del método de cofactores:

$$
\det(V) =
\begin{vmatrix}
x_{1} & y_{1} & 1 \\
x_{2} & y_{2} & 1 \\
x_{3} & y_{3} & 1
\end{vmatrix} =
(x_{1}y_{2} - x_{1}y_{3}) - (x_{2}y_{1} - x_{3}y_{1}) + (x_{2}y_{3} - y_{2}x_{3})
$$

## 3.2 Área de un triángulo.

Una de las particularidades de conocer el área de un paralelógramo a partir como el valor absoluto del determinante de una matriz de $2 \times 2$, es que también podemos conocer el área de un triángulo a partir de ella.

En particular, si trazamos la diagonal opuesta (color azul) al paralelógramo que vimos al inicio de la anterior subsección, obtenemos dos triángulos.

\begin{figure}[hbt!]
\centering

\begin{tikzpicture}
% Celdas de ayuda.
% \draw [help lines] (-7, -4) grid (7, 4);

% Ejes de coordenadas.
\draw [->] (0, 0) -- (3, 0) node[below] {$x_{1}$};
\draw [->] (0, 0) -- (0, 3) node[left] {$x_{2}$};

% Suma de los dos vectores fila.
% \draw [->, blue, line width=0.5mm] (0, 0) -- (3.5, 1.7);
\node [right] at (3.52, 1.7) {$(a_{1, 1} + a_{2, 1}, \ a_{1, 2} + a_{2, 2})$};

% Vectores fila.
\draw [->, line width=0.5mm] (0, 0) -- (2.2, 0.3) node[right] {$(a_{1, 1}, \ a_{1, 2})$};
\draw [->, line width=0.5mm] (0, 0) -- (1.7, 1.7) node[above] {$(a_{2, 1}, \ a_{2, 2})$};

% Aristas restantes.
\draw (2.2, 0.3) -- (3.5, 1.7) -- (1.7, 1.7);

% Diagonal opuesta.
\draw [blue, line width = 0.3mm] (2.2, 0.3) -- (1.7, 1.7);

% Origen.
\node [left] at (0, 0) {$(0, \ 0)$};

\end{tikzpicture}
\end{figure}

En ese sentido, el **área de uno de los triángulos** que se forman a partir de la diagonal del paralelógramo simplemente será **la mitad del área de esta última figura**. Es decir:
$$
\frac{1}{2} |\det(A)| = \text{Área del triángulo}
$$
Lo mismo se aplica si el triángulo no tiene un punto que comience en el origen. Es la mitad del área del paralelógramo, a cuya matriz agregamos una columna de unos.


