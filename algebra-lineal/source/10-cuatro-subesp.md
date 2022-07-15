---
title: Clase 10. Los Cuatro Principales Subespacios Vectoriales.
subtitle: Curso 'Linear Algebra' del MIT.
fontsize: 12pt
geometry: [margin=1in]
header-includes:
  - \usepackage{setspace} \onehalfspacing
  - \usepackage{graphicx}
  - \usepackage{amsmath}
  - \usepackage{amssymb}
---



Además del __espacio columna__ y el __espacio nulo__, existen otros dos subespacios vectoriales igual de relevantes: el __espacio fila__ y el __espacio nulo izquierdo__. Estos son los cuatro subespacios principales del Álgebra Lineal, por lo tanto en esta clase profundizaremos en ellos y, preliminarmente, en el __espacio matriz__, otro subespacio "vectorial".



## 10.1 Espacio Fila.

Cada fila de una matriz $A$ es, a su vez, un vector fila y todas sus combinaciones lineales conforman el subespacio vectorial conocido como __Espacio Fila__.

El espacio fila de $A$ es equivalente al __espacio columna de $A^{T}$__, por ese motivo se lo denota como $C(A^{T})$.

Si la matriz $A$ es de $n \times m$, los vectores que forman el $C(A^{T})$ están en $\mathbb{R}^{m}$ dimensiones (i.e, $m$ componentes).

### 10.1.1 Base y Dimensión de un Espacio Fila.

Para que los vectores que __generan__ el $C(A^{T})$ sean una __base__, necesitan ser linealmente independientes, lo cual evaluamos identificando sus entradas pivotes por medio de operaciones de reducción de filas en $A$ (i.e, eliminación de Gauss).

Las filas de $A$ que contienen una entrada pivote, las denominamos como __filas pivote__.

Por lo tanto y al igual que en el $C(A)$, la __dimensión__ del $C(A^{T})$ corresponde al __rango__ $r$ de $A$.
$$
  \dim(C(A^{T})) = r = \dim(C(A))
$$
Cuando pasamos $A \to R$ por medio del método de Gauss, se cumple que $A$ y $R$ tienen el mismo espacio fila ($C(A^{T}) = C(R^{T})$), pero distinto espacio columna ($C(A) \neq C(R)$). Esto se debe a que las operaciones de simplificación se aplican a las filas de $A$ y no a sus columnas, por tanto las primeras no se alterarán en $R$, mientras que las segundas sí.

Una ventaja que los vectores fila de $A$ generen tanto el $C(A^{T})$ como el $C(R^{T})$^[Y viceversa con los mismos vectores de $R$], es que a partir de aquello podemos identificar los que serán __una base de $C(A^{T})$__, los cuales corresponderán a __las primeras $r$__ (rango de $A$) __filas de $R$__.

Recordemos que $R$ es de forma triangular hacia arriba (_upper triangular_) puesto que su antecesora es $U$. Por tanto, sus entradas pivotes siempre estarán en sus primeras filas. Esto significa que aquellos vectores fila son linealmente independientes y, a su vez, generan el $C(R^{T}) = C(A^{T})$. Por consiguiente, son una base de $C(A^{T})$.

Veamos lo anterior a partir del siguiente ejemplo:
$$
A =
\begin{bmatrix}
1 & 2 & 3 & 1 \\
1 & 1 & 2 & 1 \\
1 & 2 & 3 & 1
\end{bmatrix}
\Longrightarrow
U =
\begin{bmatrix}
1 & 2 & 3 & 1 \\
0 & -1 & 1 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix}
\Longrightarrow
R =
\begin{bmatrix}
1 & 0 & 1 & 1 \\
0 & 1 & 1 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix}
$$
Tanto a partir de $A$ como de $R$, podemos ver que el rango de $A$ es $r = 2$. Por lo tanto, de antemano podemos constatar que la $\dim(C(A^{T})) = 2$. Sabemos que $C(A^{T}) = C(R^{T})$, pero de los vectores fila que generan ambos subespacios, los que constituyen una base son los dos primeros de $R$, tal como lo estudiamos anteriormente.

En ese sentido, dos filas cualesquiera de $A$ pueden constituir una base salvo la primera con la tercera, pero la "mejor" son las dos primeras de $R$, las cuales son las mismas de $A$ y, por consiguiente, están tanto en el $C(A^{T})$ como en el $C(R^{T})$.


## 10.2 Espacio Nulo Izquierdo.

También es posible calcular un espacio nulo con las filas de $A$, el cual es conocido como el __Espacio Nulo Izquierdo__ y se denota como $N(A^{T})$.

El $N(A^{T})$ corresponde a las soluciones agrupados en un vector $\vec{y}$ de la ecuación:
$$
  A^{T}y = 0
$$

\newpage

Se agrega la palabra "izquierdo" a este espacio nulo, porque si queremos trabajar con $A$, calculamos la transpuesta en toda la ecuación, conllevando a que el vector de soluciones $\vec{y}$ (en este caso, transpuesta) queda en aquella posición:
$$
  y^{T}A = 0^{T}
$$
Asumiendo aún que $A$ es de $n \times m$, los vectores que conforman el $N(A^{T})$ son de $\mathbb{R}^{n}$ dimensiones (i.e, $n$ componentes).

### 10.2.1 Una Forma Alternativa de Calcular el $N(A^{T})$.

Como señalamos, la forma común de encontrar los vectores que generan el $N(A^{T})$ es resolviendo la ecuación $A^{T}y = 0$. Pero otra manera, es trabajando con $A$ como una matriz aumentada (la que denotamos como $A_{Au}$), donde el lado derecho es una matriz identidad. Es decir, de la forma $[A|I]$.

Esta técnica la usamos en la [Clase 3](../output/3-multipl-invers-matrices.pdf) para evaluar si una matriz cuadrada era invertible o no. En particular, vimos que existe $A^{-1}$ en $A$ si, cuando pasamos de $A_{Au} \to R_{Au}$, se cumple que:
$$
  E[A | I] = [I | A^{-1}]
$$
donde $E$ es la matriz elemental de todas las operaciones de reducción de filas.

El punto es que cuando usamos este método en una matriz $A$ rectangular, no solo ocurre que:
$$
  E[A | I] = [R | E]
$$
sino que, además, es posible __identificar las soluciones especiales que generan el $N(A^{T})$ en las filas de $E$__. En otras palabras, va a corresponder a la solución de $y^{T}A = 0^{T}$.

Veámoslo en el siguiente ejemplo. Sean $A$ y, por tanto, $A^{T}$:
$$
A =
\begin{bmatrix}
1 & 2 & 3 & 1 \\
1 & 1 & 2 & 1 \\
1 & 2 & 3 & 1
\end{bmatrix}
\qquad
A^{T} =
\begin{bmatrix}
1 & 1 & 1 \\
2 & 1 & 2 \\
3 & 2 & 3 \\
1 & 1 & 1
\end{bmatrix}
$$
Comencemos con $A^{T}y = 0$, pasando en primera instancia de $A^{T} \to R$.
$$
A^{T} =
\begin{bmatrix}
1 & 1 & 1 \\
2 & 1 & 2 \\
3 & 2 & 3 \\
1 & 1 & 1
\end{bmatrix}
\Longrightarrow
R =
\begin{bmatrix}
1 & 0 & 1 \\
0 & 1 & 0 \\
0 & 0 & 0 \\
0 & 0 & 0
\end{bmatrix}
$$
Como vemos, $A^{T}$ es de rango $r = 2$, lo que significa que tiene una columna libre y, en este caso, es la tercera. Por consiguiente, establezcamos que $y_{3} = 1$ del vector $\vec{y}$.

Al pasar la ecuación:
$$
\begin{aligned}
Ry = 0 \\
\begin{bmatrix}
1 & 0 & 1 \\
0 & 1 & 0 \\
0 & 0 & 0 \\
0 & 0 & 0
\end{bmatrix}
\begin{bmatrix}
y_{1} \\ y_{2} \\ 1
\end{bmatrix}
=
\begin{bmatrix}
0 \\ 0 \\ 0 \\ 0
\end{bmatrix}
\end{aligned}
$$
a sistema de ecuaciones lineales:
$$
\left\{
\begin{aligned}
y_{1} + 0 + 1 &= 0 \\
0 + y_{2} + 0 &= 0
\end{aligned}
\right.
$$
podemos verificar que $y_{1} = -1$ e $y_{2} = 0$. Por lo tanto, el espacio fila izquierdo de $A$ es:
$$
N(A^{T}) =
c \cdot
\begin{bmatrix}
-1 \\ 0 \\ 1
\end{bmatrix}
$$
Ahora veámoslo con el método alternativo. A continuación, pasamos $A_{Au} \to R_{Au}$:
$$
A_{Au} = 
\left[
\begin{array}{c c c c|c c c}
1 & 2 & 3 & 1 & 1 & 0 & 0 \\
1 & 1 & 2 & 1 & 0 & 1 & 0 \\
1 & 2 & 3 & 1 & 0 & 0 & 1
\end{array}
\right]
\Longrightarrow
R_{Au} = 
\left[
\begin{array}{c c c c|c c c}
1 & 0 & 1 & 1 & -1 & 2 & 0 \\
1 & 1 & 2 & 1 & 1 & -1 & 0 \\
0 & 0 & 0 & 0 & -1 & 0 & 1
\end{array}
\right]
$$
Sabemos que la mitad derecha de $R_{Au}$ es $E$ y la tercera fila de esta última matriz corresponde a $\vec{y}^{\, T}$. Si la multiplicamos a $A$, entonces:
$$
\begin{bmatrix}
-1 & 0 & 1
\end{bmatrix}
\cdot
\begin{bmatrix}
1 & 2 & 3 & 1 \\
1 & 1 & 2 & 1 \\
1 & 2 & 3 & 1
\end{bmatrix}
=
\begin{bmatrix}
0 & 0 & 0 & 0
\end{bmatrix}
$$
Lo cual es equivalente a $y^{T}A = 0^{T}$.

Entonces, si usamos este método para encontrar los vectores que generan el $N(A^{T})$, solo tenemos que evaluar con cuál de los vectores filas de $E$ se cumple que $y^{T}A = 0^{T}$.

### 10.2.2 Base y Dimensión de un $N(A^{T})$.

Hemos visto que la forma para buscar el $N(A^{T})$ es igual al del $N(A)$: Por medio del método de eliminación de Gauss identificamos las columnas pivotes y las libres de $A^{T}$ y, luego, encontramos las soluciones especiales.

Por otra parte, sabemos que la cantidad de soluciones especiales de un espacio nulo está determinado por la cantidad de columnas libres de $A$. Por consiguiente, si $A^{T}$ es de $m \times n$ (asumiendo que $A$ es de $n \times m$) y su rango es $r$, la cantidad de soluciones de $N(A^{T})$ serán:
$$
  \# \text{ sol. especiales} = n - r
$$
Los vectores que son soluciones especiales no solo generan el $N(A^{T})$, sino que también son linealmente independientes. Por lo tanto, constituyen su __base__, implicando que su __dimensión__ siempre será:
$$
  \dim(N(A^{T})) = n - r
$$


## 10.3 Resumen de los Cuatro Principales Subespacios Vectoriales.

En la siguiente tabla se resumen las principales características de los cuatro subespacios vectoriales fundamentales del álgebra lineal, donde $A$ es una matriz de $n \times m$ dimensiones, $r$ es su rango y $A^{T}$ es de $m \times n$.

  Subespacio  | Notación | Esp. Vectorial |        Vectores Base          | Dimensión
:------------:|:--------:|:--------------:|:-----------------------------:|:----------:
Esp. Columna  |$C(A)$    |$\mathbb{R}^{n}$|Columnas Pivotes               |$r$
Esp. Fila     |$C(A^{T})$|$\mathbb{R}^{m}$|Filas Pivotes de $A$           |$r$
Esp. Nulo     |$N(A)$    |$\mathbb{R}^{m}$|Sol. Especiales de $Ax = 0$    |$m - r$
Esp. Nulo Izq.|$N(A^{T})$|$\mathbb{R}^{n}$|Sol. Especiales de $A^{T}y = 0$|$n - r$



## 10.4 Espacio Matriz (Preliminar).

Si tenemos una matriz cuadrada de $3 \times 3$, podemos multiplicarla por valores escalares y sumarlas a otras escaladas de igual dimensión. En otras palabras, podemos realizar __combinaciones lineales__ entre ellas al igual que con vectores, pero resultando en otras matrices. El conjunto de todas aquellas combinaciones, se conoce como el __Espacio Matriz__ el cual se denota como $M$.

Si ignoramos el que podemos multiplicarlas entre ellas, las matrices se comportan como vectores, es por ello que al $M$ se lo considera como un espacio "vectorial".

Del espacio matriz se obtienen los siguientes __subespacios "vectoriales"__:

- Todas las Matrices Triangulares Superiores (i.e, $U$).
- Todas las Matrices Simétricas (i.e, las matrices $A$ tal que $A = A^{T}$).
- Todas las Matrices Diagonales, que se denotan como $D$.

El subespacio de las matrices $D$ es la intersección de los dos anteriores y es de $3$ dimensiones. Por ejemplo, a continuación tenemos una __base__ (_basis_) de ella:
$$
\begin{bmatrix}
1 & 0 & 0 \\
0 & 0 & 0 \\
0 & 0 & 0
\end{bmatrix}
\,
,
\begin{bmatrix}
1 & 0 & 0 \\
0 & 3 & 0 \\
0 & 0 & 0
\end{bmatrix}
\,
,
\begin{bmatrix}
0 & 0 & 0 \\
0 & 0 & 0 \\
0 & 0 & 7
\end{bmatrix}
$$


