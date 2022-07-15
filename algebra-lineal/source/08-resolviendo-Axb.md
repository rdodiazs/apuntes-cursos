---
title: Clase 8. Resolviendo $Ax = b$.
subtitle: Curso 'Linear Algebra' del MIT.
fontsize: 12pt
geometry: [margin=1in]
header-includes:
  - \usepackage{setspace} \onehalfspacing
  - \usepackage{graphicx}
  - \usepackage{amsmath}
  - \usepackage{amssymb}
---


Ya que somos capaces de resolver el espacio nulo de una matriz $A$ de coeficientes, ahora lo haremos con $Ax = b$. Veremos la condición para poder resolver este sistema, cómo encontrar una solución particular a partir del vector $\vec{b}$ que elijamos y que al incluir el $N(A)$ podemos conocer la solución completa, en caso de que exista. También, que por medio del rango de $A$ podemos saber de antemano la existencia de soluciones y su cantidad.



## 8.1 Solución Completa de $Ax = b$.

Volvamos a trabajar con el mismo sistema de ecuaciones lineales de la clase anterior, pero ahora sin conocer los componentes de $\vec{b}$.
$$
\left\{
\begin{aligned}
x_{1} + 2x_{2} + 2x_{3} + 2x_{4} &= b_{1} \\
2x_{1} + 4x_{2} + 6x_{3} + 8x_{4} &= b_{2} \\
3x_{1} + 6x_{2} + 8x_{3} + 10x_{4} &= b_{3}
\end{aligned}
\right.
$$
Que es lo mismo a:
$$
\begin{aligned}
Ax &= b \\
\begin{bmatrix}
1 & 2 & 2 & 2 \\
2 & 4 & 6 & 8 \\
3 & 6 & 8 & 10
\end{bmatrix}
\begin{bmatrix}
x_{1} \\ x_{2} \\ x_{3} \\ x_{4}
\end{bmatrix}
&=
\begin{bmatrix}
b_{1} \\ b_{2} \\ b_{3}
\end{bmatrix}
\end{aligned}
$$
Veamos que la __tercera fila__ de $A$ es __la suma de la primera con la segunda__. Esto implica que __$b_{3}$ necesariamente debe ser $b_{3} = b_{1} + b_{2}$__, en caso contrario no podremos resolver el sistema de ecuaciones. En otras palabras, __para que el sistema sea soluble, $\vec{b}$ debe estar en el $C(A)$__.

Lo anterior también podemos descubrirlo a partir del método de eliminación gaussiano. Como necesitamos que $\vec{b}$ se mantenga inalterado, lo integramos en $A$ haciendo que sea una __Matriz Aumentada__^[Recordemos que es de la forma $A_{\text{aum}} = [A | b]$].
$$
A_{\text{aum}} =
\left[
\begin{array}{c c c c|c}
1 & 2 & 2 & 2 & b_{1} \\
2 & 4 & 6 & 8 & b_{2} \\
3 & 6 & 8 & 10 & b_{3}
\end{array}
\right]
$$
Para que $A_{\text{aum}} \to U_{\text{aum}}$, realizaremos los siguientes pasos:

1. Multiplicar por $2$ la primera fila y restar la segunda con la primera.
2. Multiplicar por $3$ la primera fila y restar la tercera con la primera.
3. Restar la tercera fila a la segunda.

$$
\begin{aligned}
A_{\text{aum}} =
\left[
\begin{array}{c c c c|c}
1 & 2 & 2 & 2 & b_{1} \\
2 & 4 & 6 & 8 & b_{2} \\
3 & 6 & 8 & 10 & b_{3}
\end{array}
\right]
&\Longrightarrow
\left[
\begin{array}{c c c c|c}
2 & 4 & 4 & 4 & 2b_{1} \\
2 & 4 & 6 & 8 & b_{2} \\
3 & 6 & 8 & 10 & b_{3}
\end{array}
\right]
\Longrightarrow
\left[
\begin{array}{c c c c|c}
1 & 2 & 2 & 2 & b_{1} \\
0 & 0 & 2 & 4 & b_{2} - 2b_{1} \\
3 & 6 & 8 & 10 & b_{3}
\end{array}
\right] \\
\left[
\begin{array}{c c c c|c}
1 & 2 & 2 & 2 & b_{1} \\
0 & 0 & 2 & 4 & b_{2} - 2b_{1} \\
3 & 6 & 8 & 10 & b_{3}
\end{array}
\right]
&\Longrightarrow
\left[
\begin{array}{c c c c|c}
3 & 6 & 6 & 6 & 3b_{1} \\
0 & 0 & 2 & 4 & b_{2} - 2b_{1} \\
3 & 6 & 8 & 10 & b_{3}
\end{array}
\right]
\Longrightarrow
\left[
\begin{array}{c c c c|c}
1 & 2 & 2 & 2 & b_{1} \\
0 & 0 & 2 & 4 & b_{2} - 2b_{1} \\
0 & 0 & 2 & 4 & b_{3} - 3b_{1}
\end{array}
\right] \\
\left[
\begin{array}{c c c c|c}
1 & 2 & 2 & 2 & b_{1} \\
0 & 0 & 2 & 4 & b_{2} - 2b_{1} \\
0 & 0 & 2 & 4 & b_{3} - 3b_{1}
\end{array}
\right]
&\Longrightarrow
U_{\text{aum}} =
\left[
\begin{array}{c c c c|c}
1 & 2 & 2 & 2 & b_{1} \\
0 & 0 & 2 & 4 & b_{2} - 2b_{1} \\
0 & 0 & 0 & 0 & b_{3} - b_{2} - b_{1}
\end{array}
\right]
\end{aligned}
$$

Primero, veamos que las primeras cuatro entradas de la tercera fila de $U_{\text{aum}}$ son ceros como producto de la dependencia lineal de dicha fila en $A$. Es la manera en que podemos confirmar aquello a partir del método de Gauss. Por otra parte, necesariamente $b_{3} - b_{2} - b_{1} = 0$ debido a que las anteriores entradas son ceros. Por lo tanto, si despejamos $b_{3}$ en esa ecuación, se confirma que $b_{3} = b_{1} + b_{2}$.

Si, por ejemplo, $\vec{b} = \begin{bmatrix} 1 \\ 5 \\ 6 \end{bmatrix}$, implica que:

$$
U_{\text{aum}} =
\left[
\begin{array}{c c c c|c}
1 & 2 & 2 & 2 & 1 \\
0 & 0 & 2 & 4 & 5 - 2(1) \\
0 & 0 & 0 & 0 & 6 - 5 - 1
\end{array}
\right]
=
\left[
\begin{array}{c c c c|c}
1 & 2 & 2 & 2 & 1 \\
0 & 0 & 2 & 4 & 3 \\
0 & 0 & 0 & 0 & 0
\end{array}
\right]
$$

\newpage

### 8.1.1 Condición para que el sistema lineal pueda ser resuelto.

Esto nos muestra que, efectivamente, el __vector $\vec{b}$ debe resultar de las combinaciones lineales de las columnas de $A$__ (i.e, es necesario que $\vec{b} \in C(A)$) para que el sistema de ecuaciones lineales pueda ser resuelto.

En ese sentido, si de una combinación (i.e, sumas y productos) de filas se obtiene un vector fila que corresponde a $\vec{0}$, entonces la misma combinación entre los componentes de $\vec{b}$ debe ser igual a cero para que podamos resolver $Ax = b$.

### 8.1.2 Buscando una Solución Particular para $Ax = b$.

Sigamos trabajando con $\vec{b} = \begin{bmatrix} 1 \\ 5 \\ 6 \end{bmatrix}$, ya que pertenece al $C(A)$. Para resolver $Ax = b$, lo primero que hacemos es buscar una solución para dicho $\vec{b}$, que podemos entender como una __solución particular__. Para ello:

\begin{enumerate}
\item Identificamos las columnas libres y pivotes de $A$.
\item Establecemos que los componentes libres de $\vec{x}$ sean iguales a cero.
\item Resolvemos $Ax = b$ para las componentes pivotes de $\vec{x}$.
\end{enumerate}

A partir de $U_{\text{aum}}$ podemos determinar que las columnas pivotes de $A$ son la primera y tercera, mientras que la segunda y cuarta son libres. Por lo tanto, usemos $U$ y el vector $\vec{b}$ de $U_{\text{aum}}$ para encontrar la solución particular de $Ax = b$.
$$
\begin{aligned}
Ux &= b \\
\begin{bmatrix}
1 & 2 & 2 & 2 \\
0 & 0 & 2 & 4 \\
0 & 0 & 0 & 0
\end{bmatrix}
\begin{bmatrix}
x_{1} \\ 0 \\ x_{3} \\ 0
\end{bmatrix}
&=
\begin{bmatrix}
1 \\ 3 \\ 0
\end{bmatrix}
\end{aligned}
$$
Lo anterior podemos escribirlo como:
$$
\left\{
\begin{aligned}
x_{1} + 2(0) + 2x_{3} + 2(0) &= 1 \\
2x_{3} + 4(0) &= 3
\end{aligned}
\right.
$$
Aplicando el __método de sustitución hacia atrás__, veremos que $x_{3} = 3/2$ (a partir de la segunda ecuación) y, por consiguiente, que $x_{1} = -2$ (por medio de la primera ecuación). Por lo tanto, la solución particular de $Ax = b$ ($\vec{x} _ {\text{part}}$) que obtenemos para el vector $\vec{b} = \begin{bmatrix} 1 \\ 5 \\ 6 \end{bmatrix}$ es:
$$
\vec{x} _ {\text{part}} =
\begin{bmatrix}
-2 \\ 0 \\ 3/2 \\ 0
\end{bmatrix}
$$

### 8.1.3 La suma entre la Solución Particular y las del $N(A)$.

Por ahora solo tenemos una parte de la solución de $Ax = b$ ($\vec{x} _ {\text{part}}$). Para encontrarla completa, debemos __sumar los $\vec{x}$ del $N(A)$__ ($\vec{x} _ {N(A)}$) __a la solución particular__.

Recordemos que estamos trabajando con la misma matriz $A$ de la clase anterior, cuyo espacio nulo corresponde a:
$$
N(A) =
c \cdot
\begin{bmatrix}
-2 \\ 1 \\ 0 \\ 0
\end{bmatrix}
+
d \cdot
\begin{bmatrix}
2 \\ 0 \\ -2 \\ 1
\end{bmatrix}
$$
En consecuencia, la __solución completa de $Ax = b$__ ($\vec{x} _ {\text{comp}}$) es:
$$
\begin{aligned}
\vec{x} _ {\text{comp}} &= \vec{x} _ {\text{part}} + \vec{x} _ {N(A)} \\
&= 
\begin{bmatrix}
-2 \\ 0 \\ 3/2 \\ 0
\end{bmatrix}
+
c \cdot
\begin{bmatrix}
-2 \\ 1 \\ 0 \\ 0
\end{bmatrix}
+
d \cdot
\begin{bmatrix}
2 \\ 0 \\ -2 \\ 1
\end{bmatrix}
\end{aligned}
$$
Lo anterior se demuestra de la siguiente manera:
$$
\left\{
\begin{aligned}
Ax_{\text{part}} &= b \\
Ax_{N(A)} &= 0
\end{aligned}
\right.
$$
Si sumamos ambas ecuaciones, entonces:
$$
\begin{aligned}
  Ax_{\text{part}} + Ax_{N(A)} &= b + 0 \\
  A(x_{\text{part}} + x_{N(A)}) &= b \\
  A\vec{x} _ {\text{comp}} &= b \quad \text{(Q. E. D)}
\end{aligned}
$$
Algo a tener encuenta es que $\vec{x} _ {\text{part}}$ __NO es un subespacio vectorial__. Uno de los principales motivos, es que no incluye al vector $\vec{0}$. Por otra parte, como vimos arriba solo permite realizar una combinación lineal. El resto las realizamos con $\vec{x} _ {N(A)}$, que __sí es un subespacio vectorial__ ($N(A)$).

Y en cuanto al vector $\vec{x} _ {\text{comp}}$ de este ejemplo, __TAMPOCO es un subespacio vectorial__, lo cual podemos explicarlo geométricamente, pero usando nuestra imaginación, porque estamos tratando con vectores en $\mathbb{R}^{4}$.

El vector $\vec{x} _ {N(A)}$ es un subespacio vectorial de $2$ dimensiones^[En la siguiente clase profundizaremos sobre la dimensión de un subespacio vectorial.], el cual podemos entenderlo como un plano, pero en $2$D. Por sí solo es un subespacio vectorial, pero el ser sumado por $\vec{x} _ {\text{part}}$ hace que pase por el punto terminal de este último vector y no por el punto $(0, \ 0, \ 0, \ 0)$. Por lo tanto, __el vector $\vec{x} _ {\text{comp}}$__ que es el resultante de la suma entre $\vec{x} _ {\text{part}}$ y $\vec{x} _ {N(A)}$, __nunca pasará por el origen, lo que lo imposibilita de ser un subespacio vectorial__.



## 8.2 Cantidad de Soluciones a partir del Rango de $A$.

Veamos ahora cómo, a partir del __rango de una matriz de coeficientes__, podemos tener conocimiento por adelantado de la cantidad de soluciones de un sistema $Ax = b$, en caso de que exista al menos una.

### 8.2.1 Rango Columna Completo de una Matriz.

Digamos que tenemos una matriz rectangular $A$ de $n \times m$. Ciertamente podemos suponer que su rango será $r \leq n$ o $r \leq m$, porque por definición^[La cantidad de entradas pivotes de $A$.] no puede ser mayor que la cantidad de filas y/o columnas de $A$.

Un caso que puede presentarse es que __el rango de la matriz sea igual a su cantidad de columnas__, es decir, que $r = m$. Cuando esto ocurre, decimos que $A$ es una matriz de __Rango Columna Completo__ (_Full Column Rank_).

Si $A$ es de rango columna completo, significa que $A$ __no tendrá columnas libres__, por tanto __su espacio nulo solo será el vector cero__ (i.e, $N(A) = \vec{0}$). En consecuencia, __la solución completa de $Ax = b$ será su solución particular__.
$$
  \vec{x} _ {\text{comp}} = \vec{x} _ {\text{part}} + \vec{x} _ {N(A)}
                          = \vec{x} _ {\text{part}} + \vec{0}
                          = \vec{x} _ {\text{part}}
$$

\newpage

Por lo tanto, cuando $r = m$, $Ax = b$ será de __solución única__: __Tendrá solo una solución__, en caso de que exista, donde $\vec{b}$ será solo la combinación lineal entre las columnas de $A$ y el vector $\vec{x} = \vec{1}$.

En cuanto a la matriz escalonada reducida de $A$, por lo general será de la forma $R = \begin{bmatrix} I \\ F \end{bmatrix}$, donde $I$ es la matriz identidad.

### 8.2.2 Rango Fila Completo de una Matriz.

También puede darse el caso en que la matriz $A$ de $n \times m$ tenga rango $r = n$. En este caso decimos que es de __Rango Fila Completo__ (_Full Row Rank_).

Si esta matriz $A$ es de $r = n$, significa que tiene $n$ columnas pivotes, $m - r = m - n$ columnas libres y __todas sus filas tienen una entrada pivote__, por tanto __no tendremos un vector fila que sea el $\vec{0}$__. Esto implica que __el $\vec{b}$ de $Ax = b$ siempre estará en el $C(A)$__, porque sus componentes no tendrán que cumplir algún requisito para que su suma sea igual a cero. Por lo tanto, __el sistema siempre tendrá al menos una solución__.

En otras palabras, podemos darle cualquier valor a los componentes de $\vec{b}$ y, aún así, encontrar una o infinitas soluciones para $Ax = b$.

En este caso, cuando pasamos $A \to R$, esta última matriz estará constituida (pero no siempre en el mismo orden) como $R = [I \ L]$, donde $L$ son las columnas libres de $A$.

### 8.2.3 Rango Completo de una Matriz.

Ahora digamos que el rango de una matriz de coeficientes $A$ es $r = n = m$. En otras palabras, $A$ es una matriz cuadrada y el rango es igual a su cantidad de filas y columnas. En este caso decimos que es de __Rango Completo__ (_Full Rank_).

Cuando una matriz $A$ es de rango completo, una de sus consecuencias es que __tiene una matriz inversa__ (i.e, __invertible__). Entonces, si el rango de $A$ es $r = n = m$:
$$
  AA^{-1} = A^{-1}A = I
$$
En ese sentido, la matriz escalonada reducida de $A$ siempre será $R = I$.

Otra consecuencia, es que $N(A) = \vec{0}$, porque $A$ también es de rango columna completo, lo que significa que $\vec{x} _ {\text{comp}} = \vec{x} _ {\text{part}}$.

Y una tercera consecuencia es que al ser $A$ de rango fila completo, entonces siempre tendrá al menos una solución.

Por lo tanto, si la matriz de coeficientes $A$ es de $r = n = m$, entonces:

- $A$ es invertible.
- $Ax = b$ siempre tendrá una única solución, la cual será $\vec{x} _ {\text{part}}$.

### 8.2.4 Síntesis de la relación entre el rango y la cantidad de soluciones de $Ax = b$.

Lo visto en las tres últimas subsecciones podemos resumirlo en la siguiente tabla, donde $A$ es una matriz de coeficientes de $Ax = b$.

\begin{table}[hbt!]
\centering

\begin{tabular}{c|c|c|c|c}
Rango de $A$ & $r = n = m$ & $r = m < n$ & $r = n < m$ & $r < n$ o $r < m$ \\
\hline
$\#$ Soluciones de $Ax = b$ & $1$ & $0$ o $1$ & $\infty$ & $0$ o $\infty$ \\
\hline
Forma $A \to R$ & $R = I$ & $R = \begin{bmatrix} I \\ 0 \end{bmatrix}$ & $R = [I \ L]$ & $R = \begin{bmatrix} I & L \\ 0 & 0 \end{bmatrix}$
\end{tabular}

\end{table}

Por lo tanto, con el rango podemos saber de antemano cuántas soluciones tendrá el sistema $Ax = b$. Si existe al menos una, para conocer sus valores (o los componentes de $\vec{x}$) solo tenemos que resolver el sistema como lo vimos en la sección 8.1.
