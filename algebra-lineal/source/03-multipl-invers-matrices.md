---
title: Clase 3. Multiplicación Matricial y la Inversa de una Matriz.
subtitle: Curso 'Linear Algebra' del MIT.
fontsize: 12pt
geometry: [margin=1in]
header-includes:
  - \usepackage{setspace} \onehalfspacing
  - \usepackage{graphicx}
  - \usepackage{amsmath}
  - \usepackage{amssymb}
---

Si bien ya hemos calculado multiplicaciones entre matrices, en esta ocasión estudiaremos el requisito para realizar esta operación y revisaremos cuatro formas para resolverla.

También, en esta clase profundizaremos sobre la inversa de una matriz (ya la vimos de forma preliminar en la clase anterior) y veremos cuándo existe. Para ello, usaremos el método de eliminación de Gauss-Jordan como una forma (de varias) de encontrar la matriz inversa cuando ésta existe.



## 3.1 Multiplicación entre Matrices.

### 3.1.1 Condición para multiplicar dos matrices.

Es verdad que ya hemos calculado el producto entre dos matrices, pero éstas siempre han sido matrices cuadradas de igual dimensión. En este caso podemos hacerlo, pero no siempre en otros. En particular, __es posible multiplicar matrices sí y solo sí, la cantidad de columnas de la ubicada en la izquierda es igual a la cantidad de filas de aquella en la derecha__.

Lógicamente, si dos matrices cuadradas tienen la misma dimensión, entonces es posible que podamos multiplicarlas, pero no todas las veces nos toparemos con aquel caso.

Entonces, digamos que tenemos dos matrices: $A$ de $m \times n$ y $B$ de $n \times k$. Como la cantidad $n$ de columnas de $A$ es igual a la cantidad $n$ de filas de $B$, entonces decimos que existe $AB$, la cual será de $m \times k$ dimensiones.

Esto nos muestra, otra vez, que la propiedad conmutativa no siempre se aplica entre dos matrices. En este caso, $AB \neq BA$, debido a que en el lado derecho no se cumple la condición para que exista el producto entre $B$ y $A$.


### 3.1.2 Formas de Multiplicar dos Matrices.

Ahora, digamos que tenemos una matriz $A = [a_{i, j}]$ de $3 \times 4$ y otra $B = [b_{i, j}]$ de $4 \times 2$. Debido a las características de ambas matrices, podemos decir que existe una matriz $AB = C = [c_{i, j}]$ de $3 \times 2$.

La __forma más común__ de calcular el producto entre dos matrices, es realizando una __combinación entre las filas de la matriz de la izquierda y las columnas de la ubicada a la derecha__. El resultado es __una entrada de cada fila de la matriz resultante__, que corresponde a la suma del producto entre las entradas de dicha combinación.

Por ejemplo, calculemos la entrada $c_{2, 2}$. Como esta entrada resulta de la combinación entre los elementos de su fila y columna, pero de los de la matriz $A$ para el primer caso y de aquellos de la matriz $B$ para el segundo. Es decir:
$$
\begin{aligned}
AB &= C \\
\begin{bmatrix}
- & - & - & - \\
a_{2, 1} & a_{2, 2} & a_{2, 3} & a_{2, 4} \\
- & - & - & - 
\end{bmatrix}
\begin{bmatrix}
- & b_{1, 2} \\
- & b_{2, 2} \\
- & b_{3, 2} \\
- & b_{4, 2} 
\end{bmatrix}
   &=
\begin{bmatrix}
- & - \\
- & c_{2, 2} \\
- & - 
\end{bmatrix}
\end{aligned}
$$
Por lo tanto, $c_{2, 2}$ podemos calcularlo como:
$$
  c_{2, 2} = a_{2, 1} b_{1, 2} + a_{2, 2} b_{2, 2} + a_{2, 3} b_{3, 2} + a_{2, 4} b_{4, 2}
$$
Esta operación también podemos escribirla como:
$$
  c_{2, 2} = \sum_{p = 1}^{4} a_{2, p} b_{p, 2}
$$
__Otra forma__ de calcular el producto entre dos matrices, es por medio de una __combinación entre todas las columnas de la matriz de la izquierda con cada columna de la matriz de la derecha__. Con esto, obtenemos __cada columna de la matriz resultante__.

Volvamos al producto $AB = C$. A partir de la segunda forma de realizar esta operación, para obtener la primera columna de $C$ debemos multiplicar todas las columnas de $A$ a la primera columna de $B$, como lo vemos en la siguiente imagen.

\newpage

\begin{figure}[hbt!]
\centering
\includegraphics[scale=0.5]{img/class-3/mult-matrix-by-cols.jpg}
\end{figure}

En otras palabras, decimos que __las columnas de $C$ son combinaciones de las columnas de $A$__.

Una __tercera forma__ de calcular o entender el producto entre dos matrices $AB$, es a partir de una __combinación entre todas las filas de la matriz de la derecha con cada fila de la matriz de la izquierda__. Al realizar esta operación, obtenemos __cada fila de la matriz resultante__.

Por ejemplo, si queremos conocer la primera fila de $C$, bajo esta forma debemos multiplicar todas las filas de $B$ a la primera fila de $A$.

\begin{figure}[hbt!]
\centering
\includegraphics[scale=0.5]{img/class-3/mult-matrix-by-rows.jpg}
\end{figure}

Este caso significa que __las filas de $C$ son combinaciones de las filas de $B$__.

Finalmente, una __cuarta manera__ de multiplicar dos matrices es el siguiente:

- Calcular el producto entre cada columna de la matriz de la izquierda y su correspondiente fila en la matriz de la derecha.

- Sumar los productos obtenidos.

Tiene un parecido a la primera forma que vimos de multiplicar dos matrices, donde era la suma de "entradas filas" $\times$ "entradas columnas". En ese caso, obteníamos cada entrada de la matriz resultante. Mientras que en esta cuarta forma, __cada producto "entradas columnas" $\times$ "entradas filas" corresponde a una matriz__ y, para obtener la matriz resultante, __sumamos dichas matrices__.

Veamos el siguiente ejemplo.
$$
\begin{bmatrix}
2 & 7 \\
3 & 8 \\
4 & 9
\end{bmatrix}
\cdot
\begin{bmatrix}
1 & 6 \\
0 & 0
\end{bmatrix}
$$
Calculemos este producto de matrices a partir de la cuarta forma. Como señalamos, la idea es multiplicar cada columna de la matriz de la izquierda con cada fila de la matriz de la derecha. Por lo tanto:
$$
\begin{aligned}
\begin{bmatrix}
2 & 7 \\
3 & 8 \\
4 & 9
\end{bmatrix}
\cdot
\begin{bmatrix}
1 & 6 \\
0 & 0
\end{bmatrix}
&=
\begin{bmatrix} 2 \\ 3 \\ 4 \end{bmatrix} \cdot \begin{bmatrix} 1 & 6 \end{bmatrix} +
\begin{bmatrix} 7 \\ 8 \\ 9 \end{bmatrix} \cdot \begin{bmatrix} 0 & 0 \end{bmatrix} \\
&=
1 \cdot \begin{bmatrix} 2 \\ 3 \\ 4 \end{bmatrix} + 6 \cdot \begin{bmatrix} 2 \\ 3 \\ 4 \end{bmatrix} \\
&=
\begin{bmatrix} 2 \\ 3 \\ 4 \end{bmatrix} + \begin{bmatrix} 12 \\ 18 \\ 24 \end{bmatrix} \\
&=
\begin{bmatrix}
2 & 12 \\
3 & 18 \\
4 & 24
\end{bmatrix}
\end{aligned}
$$
Si nos damos cuenta, la matriz resultante del producto de matrices anterior también corresponde a la siguiente operación:
$$
\begin{bmatrix} 2 \\ 3 \\ 4 \end{bmatrix} \cdot \begin{bmatrix} 1 & 6 \end{bmatrix} 
=
\begin{bmatrix}
2 & 12 \\
3 & 18 \\
4 & 24
\end{bmatrix}
$$
Podemos decir, por ejemplo, que cada fila de esta matriz resultante es un producto del vector fila del lado derecho. También, que si graficamos las filas de esta matriz por separado (i.e, como vectores de fila), seguirán la misma dirección del vector señalado. Del mismo modo, si graficamos cada columna de la matriz resultante como vectores de columna, sus direcciones serán la misma del vector columna del lado izquierdo de la ecuación.

Lo anterior también es posible interpretarlo a partir de los conceptos de __espacio columna__ (_column space_) y __espacio fila__ (_row space_). Más adelante profundizaremos sobre ellos, pero podemos señalar que todas las combinaciones lineales^[No olvidemos que las combinaciones lineales resultan en un vector.] de las columnas de la matriz resultante (i.e, su espacio columna) subyacen en la línea del vector columna del lado izquierdo de la ecuación. O, también, que todas las combinaciones lineales de las filas de la misma matriz (i.e, su espacio fila), subyacen en la línea del vector fila del lado izquierdo.

Una __quinta manera__ de multiplicar matrices, es a partir de __bloques__.

Supongamos que tenemos dos matrices cuadradas $A$ y $B$ de $4 \times 4$.
$$
\begin{aligned}
A &=
\begin{bmatrix}
a_{1, 1} & a_{1, 2} & a_{1, 3} & a_{1, 4} \\
a_{2, 1} & a_{2, 2} & a_{2, 3} & a_{2, 4} \\
a_{3, 1} & a_{3, 2} & a_{3, 3} & a_{3, 4} \\
a_{4, 1} & a_{4, 2} & a_{4, 3} & a_{4, 4}
\end{bmatrix}
&
B &=
\begin{bmatrix}
b_{1, 1} & b_{1, 2} & b_{1, 3} & b_{1, 4} \\
b_{2, 1} & b_{2, 2} & b_{2, 3} & b_{2, 4} \\
b_{3, 1} & b_{3, 2} & b_{3, 3} & b_{3, 4} \\
b_{4, 1} & b_{4, 2} & b_{4, 3} & b_{4, 4}
\end{bmatrix}
\end{aligned}
$$
Las entradas de estas matrices las podemos dividir (o agrupar) en bloques, donde cada uno podemos interpretarlo como una matriz.
$$
\begin{aligned}
A &=
\left[
\begin{array}{c c | c c}
a_{1, 1} & a_{1, 2} & a_{1, 3} & a_{1, 4} \\
a_{2, 1} & a_{2, 2} & a_{2, 3} & a_{2, 4} \\
\hline
a_{3, 1} & a_{3, 2} & a_{3, 3} & a_{3, 4} \\
a_{4, 1} & a_{4, 2} & a_{4, 3} & a_{4, 4}
\end{array}
\right]
&
B &=
\left[
\begin{array}{c c | c c}
b_{1, 1} & b_{1, 2} & b_{1, 3} & b_{1, 4} \\
b_{2, 1} & b_{2, 2} & b_{2, 3} & b_{2, 4} \\
\hline
b_{3, 1} & b_{3, 2} & b_{3, 3} & b_{3, 4} \\
b_{4, 1} & b_{4, 2} & b_{4, 3} & b_{4, 4}
\end{array}
\right]
\end{aligned}
$$
La idea es multiplicar cada bloque siguiendo la lógica de la primera forma que vimos del producto entre matrices.

Para explicarlo de mejor forma, reescribamos cada bloque de las matrices de la siguiente manera:
$$
\begin{aligned}
A &=
\left[
\begin{array}{c | c}
A_{1} & A_{2} \\
\hline
A_{3} & A_{4}
\end{array}
\right]
&
B &=
\left[
\begin{array}{c | c}
B_{1} & B_{2} \\
\hline
B_{3} & B_{4}
\end{array}
\right]
\end{aligned}
$$
Si una matriz $C = AB$, entonces su bloque $C_{1}$ será:
$$
  C_{1} = A_{1}B_{1} + A_{2}B_{3}
$$
Como cada bloque es una matriz, entonces $A_{1}B_{1} + A_{2}B_{3}$ es una suma de dos multiplicaciones entre dos matrices.

Lo que tienen en común todas estas formas de multiplicar dos matrices, es que en realidad estamos realizando el mismo primer método, pero de otras 4 formas distintas. Por lo tanto, en todos los casos debe cumplirse que la cantidad de columnas de la matriz de la izquierda debe ser igual a la cantidad de filas de la matriz de la derecha. Y si son matrices cuadradas, por consiguiente, deben ser de las mismas dimensiones.



## 3.2 Inversa de una Matriz.

Existen distintas maneras de evaluar si una matriz es o no invertible. Cuando lo es, quiere decir que existe otra matriz que, al multiplicarla con la primera, se obtiene una __matriz identidad__.

Por ejemplo, si una matriz $A$ es invertible (i.e, demostramos que lo es), esto implica que existe una matriz $B$ tal que:
$$
  B \cdot A = I
$$
Donde la matriz $B$ corresponde a la inversa de $A$, la cual se denota como $A^{-1}$. También se dice que $A$ es __no singular__.

Por lo tanto, el producto de matrices de arriba también podemos denotarlo como:
$$
  A^{-1} \cdot A = I
$$
Cuando una __matriz cuadrada__ es __invertible__, ocurre una igualdad particular. Digamos ahora que $A$ es una matriz cuadrada y tiene su inversa $A^{-1}$. En este caso se cumple que:
$$
  A^{-1}A = AA^{-1} = I
$$


### 3.2.1 Matriz Singular (No invertible).

Veamos ahora __por qué la siguiente matriz es singular__ o, en otras palabras, __no es invertible__.
$$
A =
\begin{bmatrix}
1 & 3 \\
2 & 6
\end{bmatrix}
$$
Una forma de saberlo es que, al calcular su determinante, éste será igual a cero (más adelante estudiaremos cómo calcular determinantes).

Otra manera, es pensar qué ocurre si multiplicamos $A$ a otra matriz.

Si nos damos cuenta, la segunda columna de $A$ es un múltiplo de 3 de la primera. Por lo tanto, si multiplicamos esta matriz por cualquier otra, las columnas de las matriz resultante también serán factores del mismo número^[Esto también quiere decir que todas las combinaciones lineales de las columnas de la otra matriz con las de $A$, resultarán en columnas que serán múltiplos de 3.] (o escalar). En otras palabras, nunca obtendremos una matriz identidad, lo que significa que $A$ no es invertible.

Un tercer motivo sobre por qué $A$ es singular (en particular al ser una matriz cuadrada), es que es posible multiplicarla por un vector $x$ y que el resultado sea igual a cero. Es decir, existe un vector $x$ tal que:
$$
  Ax = 0
$$
Cuando es posible que ocurra esa igualdad, sobretodo con un vector distinto de cero, entonces lo más probable es que $A$ no sea invertible.

Por ejemplo, si $x = \langle 3, \ -1 \rangle$, entonces:
$$
\begin{bmatrix}
1 & 3 \\
2 & 6
\end{bmatrix}
\begin{bmatrix}
3 \\
-1
\end{bmatrix}
=
\begin{bmatrix}
0 \\
0
\end{bmatrix}
$$
Esto se puede explicar por lo siguiente: Digamos que, en realidad, existe $A^{-1}$. Esto implica que:
$$
A^{-1} \cdot A \cdot x = 0
$$
Como (supuestamente) existe la inversa (lo cual es falso), entonces $A^{-1}A = I$. Por lo tanto:
$$
\begin{aligned}
Ix &= 0 \\
x &= 0
\end{aligned}
$$
Y esta igualdad es falsa, porque sabemos que $x = \langle 3, \ -1 \rangle$. Por este motivo^[Que, obviamente, no es el único.] es que $A$ no es invertible.


### 3.2.2 Matriz No Singular (Invertible).

La siguiente matriz es invertible.
$$
A =
\begin{bmatrix}
1 & 3 \\
2 & 7
\end{bmatrix}
$$
Si $A$ no es singular, esto debe implicar que $A^{-1}A = AA^{-1} = I$. Lo que intentaremos hacer es buscar la matriz $A^{-1}$ que, al multiplicarla con $A$, nos de la matriz identidad $I$. Si la obtenemos, entonces podemos afirmar que, efectivamente, $A$ es invertible.

\newpage

Para partir, digamos que $A^{-1}$ está compuesto por los siguientes números que aún no conocemos:
$$
A^{-1} =
\begin{bmatrix}
a & b \\
c & d
\end{bmatrix}
$$
Entonces la ecuación $AA^{-1} = I$ podemos escribirla como:
$$
\begin{bmatrix}
1 & 3 \\
2 & 7
\end{bmatrix}
\begin{bmatrix}
a & c \\
b & d
\end{bmatrix}
=
\begin{bmatrix}
1 & 0 \\
0 & 1
\end{bmatrix}
$$
Una forma de resolver la multiplicación entre las dos matrices cuadradas de la izquierda de la ecuación, es calculando el producto entre la matriz $A$ con cada columna de $A^{-1}$. Esta operación nos dará cada columna de $I$ y podemos denotarla como dos ecuaciones.
<!--Una forma de ver que se cumpla esta igualdad, es que el producto entre $A$ y la primera columna de $A^{-1}$ debe ser igual a la primera columna de $I$. Y, del mismo modo, la segunda columna de $I$ debe ser igual al producto entre $A$ y la segunda columna de $A^{-1}$. En otras palabras, se deben cumplir dos ecuaciones (o igualdades):-->
$$
\begin{aligned}
\begin{bmatrix}
1 & 3 \\
2 & 7
\end{bmatrix}
\begin{bmatrix}
a \\
b
\end{bmatrix}
&=
\begin{bmatrix}
1 \\
0
\end{bmatrix} \\
\begin{bmatrix}
1 & 3 \\
2 & 7
\end{bmatrix}
\begin{bmatrix}
c \\
d
\end{bmatrix}
&=
\begin{bmatrix}
0 \\
1
\end{bmatrix}
\end{aligned}
$$
Si nos percatamos bien, es como si estuviéramos calculando dos sistemas de ecuaciones $Ax = b$, pero con la diferencia que ahora en el lado derecho tenemos dos vectores columna $b$, que corresponden a las columnas de $I$.

Para resolver este "sistema" de ecuaciones, podemos aplicar el __método de eliminación de Gauss-Jordan__.

Recordemos que en la clase 2 vimos que un sistema de ecuaciones también podemos escribirlo como una __matriz aumentada__, que es la matriz de coeficientes con una columna adicional a la derecha, que corresponde al vector $b$. En ese sentido, ambos sistemas de ecuaciones de arriba podríamos escribirlos como:
$$
\left[
\begin{array}{c c | c}
1 & 3 & 1 \\
2 & 7 & 0 
\end{array}
\right]
\qquad
\left[
\begin{array}{c c | c}
1 & 3 & 0 \\
2 & 7 & 1
\end{array}
\right]
$$
El inicio del método de Gauss-Jordan es similar, pero la idea es __resolver las dos ecuaciones al mismo tiempo__, es por ello que en vez de crear dos matrices aumentadas para las ambas ecuaciones, las escribimos en una. Es decir, a la matriz $A$ le agregamos las dos columnas de $I$.
$$
\left[
\begin{array}{c c | c c}
1 & 3 & 1 & 0 \\
2 & 7 & 0 & 1
\end{array}
\right]
$$
__El principal objetivo del método de Gauss-Jordan es el siguiente__: Aplicamos algunos pasos del método de eliminación a la mitad izquierda de la matriz aumentada, con el fin de que se convierta en una matriz identidad. Cuando terminamos esta tarea, la matriz resultante de la mitad derecha va a corresponder a la matriz inversa de $A$.

Para que la mitad izquierda de la matriz aumentada sea equivalente a una matriz identidad, primero necesitamos que la primera entrada de la segunda fila, sea igual a cero. Para ello, multipliquemos la primera fila por 2 y, luego, la segunda la restamos a la primera.
$$
\left[
\begin{array}{c c | c c}
1 & 3 & 1 & 0 \\
2 & 7 & 0 & 1
\end{array}
\right]
\rightarrow
\left[
\begin{array}{c c | c c}
2 & 6 & 2 & 0 \\
2 & 7 & 0 & 1
\end{array}
\right]
\rightarrow
\left[
\begin{array}{c c | c c}
1 & 3 & 1 & 0 \\
0 & 1 & -2 & 1
\end{array}
\right]
$$
Ahora necesitamos que el segundo elemento de la primera fila sea igual a cero. Por lo tanto, el siguiente paso será multiplicar por 3 a la segunda fila y restamos la primera con la segunda.
$$
\left[
\begin{array}{c c | c c}
1 & 3 & 1 & 0 \\
0 & 1 & -2 & 1
\end{array}
\right]
\rightarrow
\left[
\begin{array}{c c | c c}
1 & 3 & 1 & 0 \\
0 & 3 & -6 & 3
\end{array}
\right]
\rightarrow
\left[
\begin{array}{c c | c c}
1 & 0 & 7 & -3 \\
0 & 1 & -2 & 1
\end{array}
\right]
$$
En consecuencia, a partir del método de Gauss-Jordan decimos que:
$$
A^{-1} =
\begin{bmatrix}
7 & -3 \\
-2 & 1
\end{bmatrix}
$$
Comprobemos que $A^{-1}$ sea realmente la matriz inversa de $A$.
$$
\begin{aligned}
AA^{-1} &= I \\
\begin{bmatrix}
1 & 3 \\
2 & 7
\end{bmatrix}
\begin{bmatrix}
7 & -3 \\
-2 & 1
\end{bmatrix}
&=
\begin{bmatrix}
1 & 0 \\
0 & 1
\end{bmatrix} \\
\begin{bmatrix}
1 & 0 \\
0 & 1
\end{bmatrix}
&=
\begin{bmatrix}
1 & 0 \\
0 & 1
\end{bmatrix}
\end{aligned}
$$
De este modo, se cumple que $A^{-1}$ es la matriz inversa de $A$ y, también, hemos demostrado que $A$ es invertible.

La explicación de que hayamos obtenido la matriz $A^{-1}$ por medio del método de Gauss-Jordan, se puede dar también desde una lógica de solo matrices.

Recordemos que el proceso de eliminación de una matriz podemos expresarlo como los productos entre distintas matrices de eliminación $E$ (o matrices elementales) a una matriz $A$. Y si multiplicamos todas esas $E$, podemos obtener una matriz general $E$ que resume todo el proceso de eliminación.

La idea del método de Gauss-Jordan es la misma. Comenzamos con una matriz aumentada $[A \ | \ I]$ y la multiplicamos por una matriz general de eliminación $E$ a esta matriz aumentada.
$$
  E [A \ | \ I]
$$
El objetivo es que $E$ sea una matriz de eliminación tal que
$$
  EA = I
$$
Y como vimos anteriormente, si al multiplicar dos matrices obtenemos una matriz identidad, entonces la de la izquierda debe corresponder a la matriz inversa de la derecha. Es decir, a partir de la igualdad de arriba podemos decir que $E = A^{-1}$ y, por consiguiente:
$$
  EA = A^{-1}A = I
$$
A partir de este proceso, obtenemos la mitad izquierda de la matriz aumentada resultante.
$$
  E [A \ | \ I] = [I \ | \text{ ? }]
$$
Para obtener la mitad derecha de la matriz aumentada resultante, debemos resolver $EI$. Como $I$ es una matriz identidad, entonces $EI = E$ y sabemos que $E = A^{-1}$. Por lo tanto, $EI = A^{-1}$. En otras palabras:
$$
  E [A \ | \ I] = [I \ | A^{-1}]
$$

