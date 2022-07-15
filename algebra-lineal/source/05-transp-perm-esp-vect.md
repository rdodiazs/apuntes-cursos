---
title: Clase 5. Matrices Transpuestas, Permutaciones y el Espacio Vectorial $\mathbb{R}^{n}$.
subtitle: Curso 'Linear Algebra' del MIT.
fontsize: 12pt
geometry: [margin=1in]
header-includes:
  - \usepackage{setspace} \onehalfspacing
  - \usepackage{graphicx}
  - \usepackage{amsmath}
  - \usepackage{amssymb}
---

En esta quinta clase, terminaremos de profundizar sobre la permutación de matrices y la matriz transpuesta. Es decir, podremos decir que lo "básico" sobre matrices ya lo tendremos cubierto porque, posteriormente, comenzamos a tratar temáticas que atañen directamente al álgebra lineal, con una introducción al espacio vectorial $\mathbb{R}^{n}$.


## 5.1. Permutaciones.

Como ya lo mencionamos en la clase anterior, las permutaciones son __matrices que, al multiplicar a otra, conllevan a un intercambio de filas de esta última__. Se denotan con la letra $P$ y __suelen ser matrices identidad con filas reordenadas__.

No siempre nos encontraremos con matrices que no solo son invertibles, sino que también sus entradas pivotes son distintas de cero. Cuando estamos en presencia de un caso donde se cumple lo primero, pero no lo segundo, podemos reordenar sus filas con matrices de permutación.

Podemos usar una o múltiples $P$ o resumir en una a estas últimas, todo dependerá de cuántos intercambios de fila necesitemos realizar. No obstante, __solo podemos realizar $n!$ reordenamientos__, donde $n$ es la dimensión de la matriz cuadrada a la que aplicaremos la matriz de permutación.

Entonces, digamos que $A$ es una matriz cuadrada de coeficientes de un sistema de ecuaciones. Nuestro objetivo es realizar una eliminación gaussiana, pero no podemos descomponerla como $A = LU$ porque algunas de sus entradas pivotes son iguales a cero. Esto implica que antes tendremos que intercambiar filas y, para ello, usamos matrices de permutación.

En ese sentido, la descomposición de $A$ la denotamos como:
$$
  PA = LU \quad \text{para cualquier } A \text{ invertible.}
$$
Si nos damos cuenta, esta es una mejor forma de generalizar la factorización $LU$ de $A$, porque si no necesitamos intercambiar filas, simplemente definimos que $P = I$ y, por tanto, $PA = A = LU$.

Otra propiedad de las matrices de permutación, es que __son invertibles__ y dicha matriz conlleva a ubicar en su posición original a la(s) fila(s) de la matriz que se reordenó. Además se cumple que esta inversa corresponde a la transpuesta:
$$
  P^{-1} = P^{T}
$$
En ese sentido, se puede establecer que:
$$
  P^{-1}P = P^{T}P = I
$$


## 5.2. Transpuestas.

Decimos que transponemos una matriz cuando __movemos sus filas a columnas y sus columnas a filas a través de su diagonal principal__.

Sea $A$ una matriz con filas $i$ y columnas $j$. Entonces:
$$
  A_{i, j}^{T} = A_{j, i}
$$
Por ejemplo, sea una matriz:
$$
\begin{bmatrix}
1 & 3 \\
2 & 3 \\
4 & 1
\end{bmatrix}
$$
Entonces su transpuesta será:
$$
\begin{bmatrix}
1 & 3 \\
2 & 3 \\
4 & 1
\end{bmatrix}
^{T}
=
\begin{bmatrix}
1 & 2 & 4 \\
3 & 3 & 1
\end{bmatrix}
$$

### 5.2.1. Matriz Simétrica.

Si al transponer una matriz, __las entradas de sus filas y columnas se mantienen iguales__, decimos que es una __Matriz Simétrica__. Por ejemplo:
$$
\begin{bmatrix}
3 & 1 & 7 \\
1 & 2 & 9 \\
7 & 9 & 4
\end{bmatrix}
^{T}
=
\begin{bmatrix}
3 & 1 & 7 \\
1 & 2 & 9 \\
7 & 9 & 4
\end{bmatrix}
$$
En general, se señala que $A$ es una matriz simétrica cuando:
$$
  A^{T} = A \quad \text{donde } a_{i, j} = a_{j, i}
$$
Una propiedad de las matrices transpuestas, es que al multiplicar a la matriz original se obtiene una matriz simétrica.

Por ejemplo, sea:
$$
\begin{aligned}
R^{T} &= R \\
\begin{bmatrix}
1 & 3 \\
2 & 3 \\
4 & 1
\end{bmatrix}
^{T}
&=
\begin{bmatrix}
1 & 2 & 4 \\
3 & 3 & 1
\end{bmatrix}
\end{aligned}
$$
Entonces la matriz $R^{T}R$ __siempre será simétrica__.
$$
R^{T}R =
\begin{bmatrix}
1 & 3 \\
2 & 3 \\
4 & 1
\end{bmatrix}
^{T}
\cdot
\begin{bmatrix}
1 & 2 & 4 \\
3 & 3 & 1
\end{bmatrix}
=
\begin{bmatrix}
10 & 11 & 7 \\
11 & 13 & 11 \\
7 & 11 & 17
\end{bmatrix}
$$
Por lo tanto:
$$
(R^{T}R)^{T} =
\begin{bmatrix}
10 & 11 & 7 \\
11 & 13 & 11 \\
7 & 11 & 17
\end{bmatrix}
^{T}
=
\begin{bmatrix}
10 & 11 & 7 \\
11 & 13 & 11 \\
7 & 11 & 17
\end{bmatrix}
$$
Lo anterior se cumple porque:
$$
  (R^{T}R)^{T} = R^{T}(R^{T})^{T} = R^{T}R
$$


## 5.3. Espacio Vectorial.

Antes de introducirnos en lo que es el espacio vectorial, es bueno revisitar el concepto de la combinación lineal porque es central en este gran tema.

Una __combinación lineal__ es un __vector__ que resulta de __la suma de los productos entre un vector y un escalar arbitrario__. Se señala que es "lineal" porque, algebraicamente, dichas operaciones son solo con términos de exponente igual a $1$.

Por ejemplo, sean los vectores $\vec{v}$ y $\vec{w}$; y los escalares $c$ y $d$. Entonces:
$$
  c\vec{v} + d\vec{w} \quad \text{es una combinación lineal.}
$$
En ese sentido, dependiendo de los valores que pueden tomar los vectores y los escalares, podemos tener una gran cantidad de combinaciones lineales.

El concepto de __espacio vectorial__ se vincula con el de combinación lineal, porque corresponde a __un conjunto de vectores los cuales podemos sumar entre ellos y multiplicar por escalares__. Es decir, la condición para que ese conjunto sea un espacio vectorial, es que podamos ser capaces de realizar combinaciones lineales.

Los espacios vectoriales se denotan con la letra del conjunto numérico al que pertenecen los componentes de los vectores y con un número como superíndice indicando la cantidad (dimensión) de estos últimos.

Por ejemplo, $\mathbb{R}^{2}$ es un espacio vectorial con vectores de dos componentes (i.e, de dos dimensiones) que pertenencen a los reales. Algunos de ellos pueden ser:
$$
\begin{bmatrix} 3 \\ 2 \end{bmatrix} \text{, }
\begin{bmatrix} 0 \\ 0 \end{bmatrix} \text{, }
\begin{bmatrix} e \\ \pi \end{bmatrix} \text{, }
\ldots
$$
Y se cumple que podemos sumarlos entre ellos y/o multiplicarlos por escalares. Además, en este espacio vectorial podemos graficarlos^[Tuve que denotar mal los vectores en el gráfico, porque R no me deja escribirlos en la forma $\langle a, \ b \rangle$. Así que tuve que optar por los paréntesis redondos.].

\newpage

\begin{figure}[hbt!]
\centering
\includegraphics[scale=0.7]{img/class-5/R_2_vec_sp.jpg}
\end{figure}

Fijémonos que $\langle 0, \ 0 \rangle$ es un vector y uno bastante importante. Más adelante profundizaremos en ello.

En síntesis, todo el plano $x-y$ que vimos en el gráfico de arriba corresponde a $\mathbb{R}^{2}$ y es un espacio vectorial porque __todos los vectores__ se encuentran ahí.

El plano $\mathbb{R}^{2}$ dejará de ser un espacio vectorial si, por ejemplo, no existiese el vector $\langle 0, \ 0 \rangle$, puesto que deberíamos ser capaces de realizar combinaciones lineales con todos los valores del conjunto de los reales. En este caso, no podríamos calcular $0 \cdot \langle 3, \ 2 \rangle$ o también, el vector $-1 \cdot \langle 3, \ 2 \rangle$ no podría pasar por el origen. En otras palabras, la sola inexistencia del vector $\langle 0, \ 0 \rangle$ es problemático.

Todo lo anterior podemos generalizarlo señalando que el __espacio vectorial $\mathbb{R}^{n}$__ corresponde a __todos los vectores de columna con $n$ componentes que pertenencen al conjunto de los reales__.

Por otra parte, en todo __espacio vectorial__ se deben cumplir los __siguientes ocho requisitos__ para realizar suma entre vectores y/o multiplicación con escalares^[Sea $c =$ escalar; $\vec{x}$ y $\vec{y}$ vectores; $\vec{0} = \langle 0, \ 0, \cdots, \ 0 \rangle$ (i.e, vector cero).]:

1. $\vec{x} + \vec{y} = \vec{y} + \vec{x}$
2. $\vec{x} + (\vec{y} + \vec{z}) = (\vec{x} + \vec{y}) + \vec{z}$
3. Hay un único "vector cero" tal que $\vec{x} + \vec{0} = \vec{x}$; $\forall \vec{x}$
4. Para cada $\vec{x}$ hay un único vector $-\vec{x}$ tal que $\vec{x} + (-\vec{x}) = \vec{0}$
5. $1 \cdot \vec{x} = \vec{x}$
6. $(c_{1}c_{2}) \vec{x} = c_{1}(c_{2} \vec{x})$
7. $c(\vec{x} + \vec{y}) = c\vec{x} + c\vec{y}$
8. $(c_{1} + c_{2}) \vec{x} = c_{1}\vec{x} + c_{2}\vec{x}$

Ahora bien, el requisito para que el __conjunto de vectores__ que resultan de estas operaciones y/o de combinaciones lineales __sea un espacio vectorial__, es que __todos ellos se mantengan en dicho lugar__. Veamos un caso donde esto __no ocurre__.

Digamos que tomamos un __conjunto de vectores del espacio $\mathbb{R}^{2}$ donde ambos componentes son mayores o iguales a cero__^[Es decir, están en el primer cuadrante del plano $x$-$y$.]. Todo va bien cuando los sumamos, porque los vectores resultantes seguirán estando adentro de este conjunto. Lo mismo cuando los multiplicamos por escalares positivos o por cero, __pero dejarán esa ubicación cuando éstos son negativos (o menores a cero)__. Debido a este último hecho, es que __este conjunto no es un espacio vectorial__.

En particular, en este caso se indica que dicho conjunto no es un espacio vectorial porque __no es cerrado bajo multiplicación para todos los números reales__. La palabra "cerrado" (_closed_ o, también, _closure_) hace referencia a que, al realizar la multiplicación (o con la suma igual), el vector resultante sigue estando adentro del conjunto. Acá se dice que no es cerrado porque termina en lo contrario.

Por lo tanto, __otro requisito__ para que un __conjunto de vectores sea un espacio vectorial__, es que __debe estar cerrado bajo multiplicación de escalares y bajo suma de vectores__. Es decir, bajo combinación lineal.


### 5.3.1 Subespacio Vectorial.

Ahora bien, en gran parte de los casos vamos a estar más interesados en espacios vectoriales que están adentro de, por ejemplo, $\mathbb{R}^{n}$. El ejemplo anterior pudo haber sido uno de ellos, pero no seguía uno de los requisitos para serlo. Aquellos conjuntos de vectores que sí cumplen con todos ellos, se llaman __subespacios vectoriales__.

En particular, un __subespacio vectorial__ es un conjunto de vectores que __cumple con ser un espacio vectorial__ y que se encuentra al interior de otro espacio.

Una característica que define a todo subespacio vectorial, es que __siempre considera al vector $\vec{0}$__. Si éste no está contenido en un subconjunto de un espacio vectorial, entonces no es un subespacio.

Por ejemplo, en el espacio $\mathbb{R}^{2}$ podemos tener los siguientes subespacios vectoriales:

1. Todo el conjunto $\mathbb{R}^{2}$. Es decir, en sí mismo también es un subconjunto.
2. Una línea que va al infinito en sus dos extremos y que consiste de vectores, el cual pasa a través de $\vec{0}$.
3. El vector $\vec{0}$ por sí mismo.

De modo similar ocurre con los subespacios de $\mathbb{R}^{3}$. Estos pueden ser:

1. Todo el conjunto $\mathbb{R}^{3}$.
2. Un plano al infinito que pasa a través de $\vec{0}$.
3. Una línea al infinito que pasa a través de $\vec{0}$.
4. El vector $\vec{0}$.


### 5.3.2 Espacio Columna.

Entendiendo lo que son los subespacios de vectores, podemos dar un paso hacia adelante y evaluar si las columnas de una matriz pueden formar o no un subespacio. Cuando es posible, a dicho conjunto se lo denomina como __espacio de columna__ (_column space_).

Por ejemplo, volvamos a la siguiente matriz, que ahora llamaremos $A$ y veamos si podemos formar un espacio columna con sus columnas.
$$
A =
\begin{bmatrix}
1 & 3 \\
2 & 3 \\
4 & 1
\end{bmatrix}
$$
Si consideramos las columnas de $A$ como vectores columna, entonces podemos asumir que están en el espacio $\mathbb{R}^{3}$. Ahora, para que formen un subespacio, debemos ser capaces de sumarlos entre ellos, de realizar la misma operación con otros vectores columna (incluido el vector cero); también de multiplicarlos por escalares que pertenecen a $\mathbb{R}$ y de sumar los vectores escalados de estas columnas.

En otras palabras, un __espacio columna__ corresponde a __todas las combinaciones lineales de las columnas de una matriz, las cuales forman un subespacio vectorial__. Si se cumple con las columnas de $A$, entonces denotamos el espacio columna como $C(A)$.

En ese sentido, __geométricamente__, la idea del __espacio columna__ $C(A)$ es que si tomamos todas las combinaciones lineales entre las dos columnas de $A$, __se formará un subespacio__ el cual corresponde a __un plano que pasa por el origen__ $(0, \ 0, \ 0)$. 

Obviamente, lo anterior es posible visualizarlo en $\mathbb{R}^{1}$ (línea con vectores de un componente que pasa por el origen), $\mathbb{R}^{2}$ (línea con vectores con dos componentes que pasan por el origen) y $\mathbb{R}^{3}$ (un plano con vectores de tres componentes que pasa por el origen). Pero ya en espacios vectoriales $\mathbb{R}^{n}$ con $n > 3$, esto se complica. No obstante, geométricamente la idea es la misma con respecto a los espacios columna. Y al trabajar con vectores y matrices, aquello se hace más fácil de entender y sin necesidad de visualizar.
