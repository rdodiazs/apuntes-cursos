---
title: Clase 2. Eliminación con Matrices.
subtitle: Curso 'Linear Algebra' del MIT.
fontsize: 12pt
geometry: [margin=1in]
header-includes:
  - \usepackage{setspace} \onehalfspacing
  - \usepackage{graphicx}
  - \usepackage{amsmath}
  - \usepackage{amssymb}
---

En esta clase nos concentraremos en buscar la solución de un sistema de ecuaciones a partir del método de eliminación de Gauss (o gaussiana). Veremos distintas maneras de lograr aquello, como por medio de los elementos pivotes de la matriz, usando una matriz aumentada o buscando la matriz que nos permite realizar la eliminación en un paso, multicándola por la original. Esto último nos dará la entrada a lo que es la matriz inversa.

Vamos a trabajar con el siguiente sistema de ecuaciones:
$$
\begin{aligned}
x + 2y + z &= 2 \\
3x + 8y + z &= 12 \\
     4y + z &= 2
\end{aligned}
$$
Expresemos este sistema como una ecuación matricial $Ax = b$.
$$
\begin{bmatrix}
1 & 2 & 1 \\
3 & 8 & 1 \\
0 & 4 & 1
\end{bmatrix}
\begin{bmatrix} x \\ y \\ z \end{bmatrix}
=
\begin{bmatrix} 2 \\ 12 \\ 2 \end{bmatrix}
$$
Nos centraremos, específicamente, en la matriz $A$.


## 2.1 Método de Eliminación.

Una forma de aplicar el método de eliminación, es por medio de operaciones al sistema de ecuaciones o a la matriz $A$, de manera que termine en una __forma triangular__. Al lograr aquello, podemos buscar las soluciones aplicando lo que se denomina como __sustitución hacia atrás__.

\newpage

En el caso del sistema con el que vamos a trabajar, su forma triangular significa a que siga la siguiente forma:

Nro. Fila | Incógnita(s) 
:-------------: | :------------:
1 | $x$ $y$ $z$ 
2 | $y$ $z$ 
3 | $z$ 

Comencemos eliminando $x$ de la segunda ecuación. Para ello, multipliquemos la primera ecuación por 3 y, luego, restemos la segunda ecuación con la primera. Haremos todas estas operaciones en la matriz $A$.
$$
\begin{bmatrix}
1 & 2 & 1 \\
3 & 8 & 1 \\
0 & 4 & 1
\end{bmatrix}
\longrightarrow
\begin{bmatrix}
3 & 6 & 3 \\
3 & 8 & 1 \\
0 & 4 & 1
\end{bmatrix}
\longrightarrow
\begin{bmatrix}
1 & 2 & 1 \\
0 & 2 & -2 \\
0 & 4 & 1
\end{bmatrix}
$$
El primer paso fue multiplicar por 3 la primera fila. Esto se debe a que nos basamos en la primera entrada de dicha fila porque el objetivo era eliminar la misma entrada, pero de la segunda fila. Aquella entrada sobre la cual definimos la operación para eliminar una variable/incógnita de otra fila, se llama __Elemento Pivote__. En otras palabras, el 1 del extremo izquierdo de la primera fila, es nuestro primer pivote.

También necesitamos eliminar el $x$ de la tercera ecuación, por lo tanto el siguiente paso sería realizar una operación similar a la anterior, pero en la tercera fila de $A$. No obstante, como podemos ver en la matriz original, la primera entrada de la tercera fila ya es igual a cero, de manera que dicha incógnita ya no está. Así que continuamos con el siguiente paso.

Entonces, ya hemos cumplido una buena parte del objetivo, puesto que en la primera ecuación están todas las incógnitas y en la segunda solo está $y$ y $z$. Ahora nos falta que en la tercera ecuación solo esté $z$.

Por lo tanto, el tercer paso es eliminar $z$ de la tercera ecuación. Para alcanzar este propósito, usaremos como segundo pivote al número 2 de la segunda fila (i.e, 2da entrada de la 2da fila). Dicha fila la multiplicaremos por 2 y restaremos la tercera fila a la segunda.
$$
\begin{bmatrix}
1 & 2 & 1 \\
0 & 2 & -2 \\
0 & 4 & 1
\end{bmatrix}
\longrightarrow
\begin{bmatrix}
1 & 2 & 1 \\
0 & 4 & -4 \\
0 & 4 & 1
\end{bmatrix}
\longrightarrow
\begin{bmatrix}
1 & 2 & 1 \\
0 & 2 & -2 \\
0 & 0 & 5
\end{bmatrix}
$$
Pondré en negrita los tres pivotes de la matriz resultante, a la cual denominaremos como $U$.
$$
U =
\begin{bmatrix}
\mathbf{1} & 2 & 1 \\
0 & \mathbf{2} & -2 \\
0 & 0 & \mathbf{5}
\end{bmatrix}
$$
Algo a tener en consideración es que __los pivotes SIEMPRE deben ser distinto de cero__. En este caso, los tres cumplen con aquella condición, por lo que la matriz $U$ es perfecta para nuestro propósito de resolver el sistema de ecuaciones.

Ahora bien, si, por ejemplo, el primer pivote es cero, el método de eliminación estaría fallando, pero lo que podemos hacer es __intercambiar alguna de las filas que tengan un número en aquel lugar, con la primera__. En otras palabras, siempre es bueno ir revisando si podemos hacer intercambio entre filas en caso de que algún pivote sea igual a cero.

Cuando nos aparecen pivotes iguales a cero en, por decir, la primera o segunda fila, decimos que el método de eliminación tiene una __falla temporal__, porque podemos corregirlo aún. Sin embargo, si el pivote de la última fila es igual a cero, entonces estamos en presencia de una __falla total__, puesto que todos los valores de la fila serían iguales a cero y, por consiguiente, no tendría sentido hacer intercambios de fila.

Por ejemplo, digamos que luego de aplicar el método de eliminación a la matriz $A$, nuestra matriz $U$ fuese como la que sigue:
$$
\begin{bmatrix}
1 & 2 & 1 \\
0 & 2 & -2 \\
0 & 0 & 0
\end{bmatrix}
$$
En este caso, no podríamos corregir la matriz intercambiando la tercera fila con algunas de las anteriores, porque seguiría siendo la misma en la ubicación que tome. Por lo tanto, cuando ocurre esta situación, también decimos que __la matriz no es invertible__, lo que también implica que __el sistema de ecuaciones no tiene solución__.

\newpage

## 2.2. Sustitución hacia Atrás.

El sistema también podemos aplicar el mismo método de eliminación, pero agregando el vector $b$ como una cuarta columna a la matriz $A$ (por tanto, dejando de ser una matriz cuadrada), convirtiéndola en una __matriz aumentada__. 

Sea: 
$$b = \begin{bmatrix} 2 \\ 12 \\ 2 \end{bmatrix}$$
Entonces:
$$
\begin{bmatrix}
1 & 2 & 1 & 2 \\
3 & 8 & 1 & 12 \\
0 & 4 & 1 & 2
\end{bmatrix}
$$
Es una matriz aumentada.

Al aplicar los mismos pasos u operaciones que le realizamos a $A$ para que se convirtiera en $U$, obtendremos la siguiente __matriz aumentada reducida__.
$$
\begin{bmatrix}
1 & 2 & 1 & 2\\
0 & 2 & -2 & 6\\
0 & 0 & 5 & -10
\end{bmatrix}
$$
<!--Establezcamos ahora que:-->
Donde:
$$
\begin{aligned}
U &=
\begin{bmatrix}
1 & 2 & 1 \\ 
0 & 2 & -2 \\
0 & 0 & 5 \\
\end{bmatrix}
&
c &=
\begin{bmatrix} 2\\ 6 \\ -10 \end{bmatrix}
\end{aligned}
$$
Es decir, la matriz $U$ y el vector $c$ provienen de $A$ y $b$ luego de haber aplicado el método de eliminación.

Por lo tanto, si resolvemos la multiplicación entre $U$ y el vector $x$, lo cual debe ser igual al vector $c$, tendremos el siguiente sistema de ecuaciones en forma triangular:
$$
\begin{aligned}
x + 2y + z &= 2 \\
    2y - 2z &= 6 \\
         5z &= -10
\end{aligned}
$$
Al tener el sistema de ecuaciones en forma triangular, podemos aplicar el __Método de Sustitución hacia Atrás__ (_backward substitution_), que consiste en ir resolviendo cada ecuación desde la última hasta la primera, reemplazando cada incógnita en la ecuación de más arriba.

Partamos con la tercera ecuación, para obtener $z$.
$$
\begin{aligned}
5z &= -10 \\
z &= -2
\end{aligned}
$$
Luego con la segunda, reemplazando $z$ para obtener $y$.
$$
\begin{aligned}
2y - 2(-2) &= 6 \\
y &= 1
\end{aligned}
$$
Finalmente, reemplazamos $z$ e $y$ para conocer el valor de $x$.
$$
\begin{aligned}
x + 2(1) + (-2) &= 2 \\
x &= 2
\end{aligned}
$$
Por lo tanto, a partir de los métodos de eliminación y de sustitución hacia atrás, la solución del sistema es $x = 2$, $y = 1$ y $z = -2$.


## 2.3 Eliminación usando Matrices.

Como lo hemos dicho anteriormente, la idea en este curso y en el álgebra lineal en general, es trabajar principalmente con matrices. Por lo tanto, lo que haremos ahora es escribir las operaciones que usamos en el método de eliminación, como matrices.

Anteriormente vimos que el primer paso fue eliminar la incógnita $x$ de la segunda ecuación. Para ello, multiplicamos la primera ecuación por 3 y restamos la segunda a la primera. Ahora lo que haremos será buscar una matriz cuadrada que, al multiplicar a $A$, logremos el mismo paso señalado. En este caso, nuestro objetivo es que la entrada $a_{2, 1} = 3$ sea igual a cero.

Primero, establezcamos que $E$ es una matriz de $3 \times 3$ con entradas $e_{i, j}$, la cual por ahora está vacía y la ubicaremos a la izquierda de $A$, tal que al multiplicarla a esta última obtengamos la matriz resultante del primer paso del método de eliminación
$$
\begin{bmatrix}
- & - & - \\
- & - & - \\
- & - & -
\end{bmatrix}
\begin{bmatrix}
1 & 2 & 1 \\
3 & 8 & 1 \\
0 & 4 & 1
\end{bmatrix}
=
\begin{bmatrix}
1 & 2 & 1 \\
0 & 2 & -2 \\
0 & 4 & 1
\end{bmatrix}
$$
Algo interesante a saber, es que cada entrada de una fila de la matriz resultante está determinada por las entradas de la misma fila de, en este caso, la matriz $E$. Por lo tanto, en este primer paso debemos concentrarnos en los valores de la segunda fila de $E$ de manera que al multiplicarlos a los valores de cada columna de $A$, logremos eliminar la entrada $a_{2, 1}$.

Por lo tanto, si $e_{2, 1} = -3$, $e_{2, 2} = 1$ y $e_{2, 3} = 0$, entonces:
$$
\begin{bmatrix}
- & - & - \\
-3 & 1 & 0\\
- & - & -
\end{bmatrix}
\begin{bmatrix}
1 & 2 & 1 \\
3 & 8 & 1 \\
0 & 4 & 1
\end{bmatrix}
=
\begin{bmatrix}
1 & 2 & 1 \\
-3 + 3 + 0 & -6 + 8 + 0 & -3 + 1 + 0 \\
0 & 4 & 1
\end{bmatrix}
=
\begin{bmatrix}
1 & 2 & 1 \\
0 & -2 & 2 \\
0 & 4 & 1
\end{bmatrix}
$$
Es decir, hasta ahora tenemos que:
$$
\begin{bmatrix}
- & - & - \\
-3 & 1 & 0\\
- & - & -
\end{bmatrix}
\begin{bmatrix}
1 & 2 & 1 \\
3 & 8 & 1 \\
0 & 4 & 1
\end{bmatrix}
=
\begin{bmatrix}
1 & 2 & 1 \\
0 & 2 & -2 \\
0 & 4 & 1
\end{bmatrix}
$$
Aún debemos llenar tanto la primera como la tercera fila de $E$ para obtener la matriz resultante. Como podemos observar, dichas filas son iguales a las mismas de la matriz $A$. Siguiendo la lógica de la multiplicación entre matrices, si $e_{1, 1} = 1$, $e_{1, 2} = 0$ y $e_{1, 3} = 0$; y si $e_{3, 1} = 0$, $e_{3, 2} = 0$ y $e_{3, 3} = 1$, entonces:
$$
\begin{bmatrix}
1 & 0 & 0 \\
-3 & 1 & 0\\
0 & 0 & 1
\end{bmatrix}
\begin{bmatrix}
1 & 2 & 1 \\
3 & 8 & 1 \\
0 & 4 & 1
\end{bmatrix}
=
\begin{bmatrix}
1 & 2 & 1 \\
0 & 2 & -2 \\
0 & 4 & 1
\end{bmatrix}
$$
Como esta matriz $E$ la usamos para eliminar la entrada $a_{2, 1}$, diremos que:
$$
E_{2, 1} =
\begin{bmatrix}
1 & 0 & 0 \\
-3 & 1 & 0\\
0 & 0 & 1
\end{bmatrix}
$$
El segundo paso fue eliminar $y$ de la tercera ecuación, multiplicando por 4 la segunda y restando la tercera con esta última. Para ello, veremos otra matriz que multiplique a la anterior resultante, de manera que elimine la entrada $a_{3, 2} = 4$. En otras palabras, buscaremos una matriz $E_{3, 2}$ para que se cumpla la igualdad que vemos a continuación.
$$
\begin{bmatrix}
- & - & - \\
- & - & - \\
- & - & -
\end{bmatrix}
\begin{bmatrix}
1 & 2 & 1 \\
0 & 2 & -2 \\
0 & 4 & 1
\end{bmatrix}
=
\begin{bmatrix}
1 & 2 & 1 \\
0 & 2 & -2 \\
0 & 0 & 5
\end{bmatrix}
$$
Como la primera y segunda fila de la matriz resultante son iguales a la de la matriz $A$ resultante del paso anterior, entonces estableceremos que $e_{1, 1} = 1$ y que $e_{2, 2} = 1$, mientras que el resto de los elementos de ambas filas dejaremos que sean iguales a cero.
$$
\begin{bmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
- & - & -
\end{bmatrix}
\begin{bmatrix}
1 & 2 & 1 \\
0 & 2 & -2 \\
0 & 4 & 1
\end{bmatrix}
=
\begin{bmatrix}
1 & 2 & 1 \\
0 & 2 & -2 \\
0 & 0 & 5
\end{bmatrix}
$$
La tercera fila es la que nos importa en este paso. Como queremos eliminar la entrada $a_{3, 2}$, entonces los valores que busquemos en la tercera fila de $E$ debemos pensarlos a partir de la segunda columna de $A$. Si nos damos cuenta, necesitamos que la suma entre $a_{2, 2}$ y $a_{3, 2}$ sea igual a cero. Por lo tanto, $e_{3, 2} = -2$, mientras que $e_{3, 1} = 0$ y que $e_{3, 3} = 1$, puesto que necesitamos conservar la incógnita $z$. Con esto logramos el objetivo.
$$
\begin{bmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & -2 & 1
\end{bmatrix}
\begin{bmatrix}
1 & 2 & 1 \\
0 & 2 & -2 \\
0 & 4 & 1
\end{bmatrix}
=
\begin{bmatrix}
1 & 2 & 1 \\
0 & 2 & -2 \\
0 & 0 & 5
\end{bmatrix}
$$
Es decir:
$$
\begin{aligned}
E_{3, 2} &=
\begin{bmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & -2 & 1
\end{bmatrix}
&
U &=
\begin{bmatrix}
1 & 2 & 1 \\
0 & 2 & -2 \\
0 & 0 & 5
\end{bmatrix}
\end{aligned}
$$
Lo genial de trabajar con matrices es que todo el método de eliminación lo podemos expresar como un producto de matrices. Es decir, la matriz $U$ corresponde al producto entre $E_{3, 2}$ y la multiplicación entre $E_{2, 1}$ y $A$.
$$
  E_{3, 2} \cdot (E_{2, 1} \cdot A) = U
$$
Y como en la multiplicación entre matrices podemos aplicar la propiedad asociativa, entonces:
$$
  (E_{3, 2} \cdot E_{2, 1}) \cdot A = U
$$


### 2.3.1 Matriz de Permutación.

Como sabemos, no podemos aplicar la propiedad conmutativa en un producto entre matrices, porque al cambiar su orden obtenemos resultados distintos. Por ejemplo, $E_{2, 1} \cdot A \neq A \cdot E_{2, 1}$. No obstante, lo anterior nos sirve para introducir el concepto de __Matriz de Permutación__ que es, básicamente, una matriz compuesta por ceros y unos (no necesariamente es una matriz identidad) que al multiplicar a otra, nos permite intercambiar (o permutar) filas o columnas de esta última.

La matriz de permutación se vincula a lo señalado sobre la propiedad conmutativa entre matrices, porque dependiendo de dónde la ubiquemos, en el producto vamos a intercambiar una fila o una columna. En general, si:

- M. Permutación en la __izquierda__ $\rightarrow$ Intercambio de filas.

- M. Permutación en la __derecha__ $\rightarrow$ Intercambio de columnas.

Por ejemplo, digamos que queremos intercambiar las columnas de
$$
\begin{bmatrix}
a & b \\
c & d
\end{bmatrix}
$$
Para ello, buscaremos una matriz $P$ (de permutación), tal que al multiplicarla por la matriz de arriba, obtengamos:
$$
\begin{bmatrix}
b & a \\
d & c 
\end{bmatrix}
$$
Debido a que queremos intercambiar columnas, ubicaremos a $P$ (por ahora sin entradas) a la derecha.
$$
\begin{bmatrix}
a & b \\
c & d
\end{bmatrix}
\begin{bmatrix}
- & - \\
- & -
\end{bmatrix}
=
\begin{bmatrix}
b & a \\
d & c 
\end{bmatrix}
$$
Como vemos, necesitamos que las entradas $p_{2, 1}$ y $p_{1, 2}$ sean iguales a 1 para intercambiar las columnas, mientras que las restantes sean iguales a cero.
$$
\begin{bmatrix}
a & b \\
c & d
\end{bmatrix}
\begin{bmatrix}
0 & 1 \\
1 & 0
\end{bmatrix}
=
\begin{bmatrix}
b & a \\
d & c 
\end{bmatrix}
$$
Por lo tanto, la matriz de permutación $P$ es:
$$
P =
\begin{bmatrix}
0 & 1 \\
1 & 0
\end{bmatrix}
$$


### 2.3.2 Breve Introducción a la Matriz Inversa.

Continuemos con el ejemplo de la eliminación de matrices. Recordemos que quedamos con la siguiente ecuación:
$$
  (E_{3, 2} \cdot E_{2, 1}) \cdot A = U
$$
Una forma de obtener una sola matriz para realizar todo el proceso de eliminación (i.e, ir desde $A$ hasta $U$), sería resolver el producto $(E_{3, 2} \cdot E_{2, 1})$, pero una forma más sencilla es calcular la __Matriz Inversa__ de una de ellas.

Hay condiciones para que una matriz tenga una inversa, pero eso lo veremos en la siguiente clase. Lo que podemos asegurar, es que las que hemos visto, tienen una.

La idea de usar una matriz inversa es __revertir el proceso de eliminación__. Es decir, movernos desde $U \to A$. En ese sentido, vamos a buscar una matriz que al multiplicarla por una de las de eliminación, nos devuelva al paso anterior. Por lo tanto, __debe resultar en una matriz identidad__. Podemos pensarlo como obtener una matriz que, en realidad, nos diga que nada pasó, que no transformamos la matriz original.

Tomemos como ejemplo a la matriz $E_{2, 1}$ del primer paso. Hemos dado por asumido que existe $E_{2, 1}^{-1}$, pero no conocemos sus entradas, por lo que estará vacía. Y se debe cumplir que su producto sea igual a una matriz $I$ (de identidad):
$$
\begin{bmatrix}
- & - & - \\
- & - & - \\
- & - & - 
\end{bmatrix}
\begin{bmatrix}
1 & 0 & 0 \\
-3 & 1 & 0 \\
0 & 0 & 1 
\end{bmatrix}
=
\begin{bmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & 1
\end{bmatrix}
$$
Como vemos, lo que necesitamos es lograr que $e_{2, 1} = 0$. Por lo tanto, debemos obtener lo siguiente en la segunda fila de $E_{2, 1}^{-1}$ y las otras filas debemos mantenerlas igual.
$$
\begin{bmatrix}
1 & 0 & 0 \\
3 & 1 & 0 \\
0 & 0 & 1 
\end{bmatrix}
\begin{bmatrix}
1 & 0 & 0 \\
-3 & 1 & 0 \\
0 & 0 & 1 
\end{bmatrix}
=
\begin{bmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & 1
\end{bmatrix}
$$
En otras palabras, la matriz inversa de $E_{2, 1}$ es:
$$
E_{2, 1}^{-1} =
\begin{bmatrix}
1 & 0 & 0 \\
3 & 1 & 0 \\
0 & 0 & 1 
\end{bmatrix}
$$
Y nos debe devolver a la matriz $A$.
