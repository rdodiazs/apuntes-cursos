---
title: Clase 7. Resolviendo $Ax = 0$. Variables Pivote y Soluciones Especiales.
subtitle: Curso 'Linear Algebra' del MIT.
fontsize: 12pt
geometry: [margin=1in]
header-includes:
  - \usepackage{setspace} \onehalfspacing
  - \usepackage{graphicx}
  - \usepackage{amsmath}
  - \usepackage{amssymb}
---

Ahora y en la siguiente sección, comenzaremos a buscar soluciones de subespacios vectoriales. En esta ocasión nos concentraremos en el __espacio nulo__, intentando resolver $Ax = 0$. Producto de lo anterior, nos toparemos con 3 nuevos conceptos: el __rango__ (_rank_) de una matriz y las matrices en forma __escalonada__ y __escalonada reducida__. Estas dos últimas resultan de haber aplicado el método de eliminación de Gauss a la matriz $A$.



## 7.1 Calculando el Espacio Nulo.

Tratemos de calcular el espacio nulo o, en otras palabras, buscar las soluciones de un sistema $Ax = 0$. A continuación tenemos la matriz de coeficientes:
$$
A =
\begin{bmatrix}
1 & 2 & 2 & 2 \\
2 & 4 & 6 & 8 \\
3 & 6 & 8 & 10
\end{bmatrix}
$$
Observemos que no todas las filas y columnas de $A$ son independientes. En particular, la tercera fila es la suma de las dos anteriores, mientras que la segunda columna es multiplo de 2 (o el doble) de la primera.

Para resolver $Ax = 0$ usaremos el método (algoritmo) de eliminación de Gauss. Algo a destacar es que no alteraremos el espacio nulo, puesto que solo iremos intercambiando o simplificando entradas. Por otra parte, la aplicaremos a una matriz rectangular y, debido a la dependencia lineal señalada antes, nos encontraremos con entradas pivotes iguales a cero.

El procedimiento será el siguiente:
\begin{enumerate}
\item Multiplicar por $2$ la primera fila y restar la segunda con la primera.
\item Multiplicar por $3$ la primera fila y restar la tercera con la primera.
\end{enumerate}
$$
\begin{aligned}
\begin{bmatrix}
1 & 2 & 2 & 2 \\
2 & 4 & 6 & 8 \\
3 & 6 & 8 & 10
\end{bmatrix}
&\Longrightarrow
\begin{bmatrix}
2 & 4 & 4 & 4 \\
2 & 4 & 6 & 8 \\
3 & 6 & 8 & 10
\end{bmatrix}
&\Longrightarrow
\begin{bmatrix}
1 & 2 & 2 & 2 \\
0 & 0 & 2 & 4 \\
3 & 6 & 8 & 10
\end{bmatrix} \\
\begin{bmatrix}
1 & 2 & 2 & 2 \\
0 & 0 & 2 & 4 \\
3 & 6 & 8 & 10
\end{bmatrix}
&\Longrightarrow
\begin{bmatrix}
3 & 6 & 6 & 6 \\
0 & 0 & 2 & 4 \\
3 & 6 & 8 & 10
\end{bmatrix}
&\Longrightarrow
\begin{bmatrix}
1 & 2 & 2 & 2 \\
0 & 0 & 2 & 4 \\
0 & 0 & 2 & 4
\end{bmatrix}
\end{aligned}
$$
Veamos que en la matriz resultante $a_{1, 1} \neq 0$ (primera pivote), pero $a_{2, 2} = 0$ (segunda pivote) y no podemos intercambiar filas porque $a_{3, 2} = 0$ (i.e, quedamos igual). Lo que podemos hacer es tomar como segundo pivote a $a_{2, 3} = 2$, lo que implica que debemos agregar un tercer paso para que $a_{3, 3} = 0$.

\begin{itemize}
\item[3] Restar la tercera fila a la segunda.
\end{itemize}
$$
\begin{bmatrix}
1 & 2 & 2 & 2 \\
0 & 0 & 2 & 4 \\
0 & 0 & 2 & 4
\end{bmatrix}
\Longrightarrow
U = 
\begin{bmatrix}
\mathbf{1} & 2 & 2 & 2 \\
0 & 0 & \mathbf{2} & 4 \\
0 & 0 & 0 & 0
\end{bmatrix}
$$
La matriz $U$ también es conocida como de __forma escalonada__, donde los "escalones" son los pivotes y, como vimos, es la que __resulta de haber aplicado el método de eliminación de Gauss__ a una matriz de coeficientes $A$.

De ahora en adelante tomaremos en cuenta la __cantidad de entradas pivotes__ de una matriz, la cual recibe el nombre de __Rango__ (_rank_) y se denota como $r$. Es decir, el rango de $A$ es $r = 2$ porque solo tiene dos entradas pivote (ambas en negrita en $U$).

## 7.2 Columnas Pivote y Columnas Libres.

Recordemos que el espacio nulo de $U$ es el mismo de $A$, por tanto lo buscaremos resolviendo $Ux = 0$. Lo que haremos es catalogar sus columnas en dos tipos: __Columnas Pivotes__ y __Columnas Libres__.

Las __columnas pivotes__ de una matriz son aquellas donde sus entradas pivotes no son iguales a cero, mientras que en las __columnas libres__ sí lo son. Se las denominan como "__libres__" porque al buscar los componentes de $\vec{x}$ (i.e, las soluciones del sistema), a éstas __podemos asignarles cualquier valor__, aunque los más recomendados son el $1$ y el $0$.

\newpage

En el caso de $U$, sabemos que tiene dos columnas pivotes (columnas 1 y 3, en negrita) y dos libres (columnas 2 y 4):
$$
U = 
\begin{bmatrix}
\mathbf{1} & 2 & \mathbf{2} & 2 \\
\mathbf{0} & 0 & \mathbf{2} & 4 \\
\mathbf{0} & 0 & \mathbf{0} & 0
\end{bmatrix}
$$
Lo que hacemos es aplicar el __método de sustitución hacia atrás__ y estableciendo que $x_{2} = 1$ y $x_{4} = 0$ del vector $\vec{x}$, las cuales son las que multiplican a las columnas libres.
$$
\begin{aligned}
Ux &= 0 \\
\begin{bmatrix}
1 & 2 & 2 & 2 \\
0 & 0 & 2 & 4 \\
0 & 0 & 0 & 0
\end{bmatrix}
\begin{bmatrix}
x_{1} \\ 1 \\ x_{3} \\ 0
\end{bmatrix}
&=
\begin{bmatrix}
0 \\ 0 \\ 0 \\ 0
\end{bmatrix}
\end{aligned}
$$
Por lo tanto:
$$
\begin{aligned}
x_{1} + 2(1) + 2x_{3} + 2(0) &= 0 \\
0(x_{1}) + 0(1) + 2x_{3} + 4(0) &= 0 \\
0(x_{1}) + 0(1) + 0x_{3}+ 0(0) &= 0 \\
\end{aligned}
$$
<!--Que es lo mismo a:
$$
\begin{aligned}
x_{1} + 2(1) + 2x_{3} + 2(0) &= 0 \\
2x_{3} + 4(0) &= 0
\end{aligned}
$$-->
Debido a que la tercera fila consiste solo de ceros, descartémosla y busquemos el valor de $x_{3}$ a partir de la segunda ecuación.
$$
\begin{aligned}
0(x_{1}) + 0(1) + 2x_{3} + 4(0) &= 0 \\
x_{3} &= 0
\end{aligned}
$$
Finalmente, a partir de $x_{3} = 0$ busquemos $x_{1}$ en la primera ecuación.
$$
\begin{aligned}
x_{1} + 2(1) + 2(0) + 2(0) &= 0 \\
x_{1} &= -2
\end{aligned}
$$
Por lo tanto, __un__ vector del espacio nulo de $U$ (i.e, una solución a $Ux = 0$) es el vector columna $\vec{x} = \langle -2, \ 1, \ 0, \ 0 \rangle$, el cual podemos escalar por un valor $c \in \mathbb{R}$.

$$
c\vec{x} =
c \cdot
\begin{bmatrix}
-2 \\ 1 \\ 0 \\ 0
\end{bmatrix}
$$
Pero $c\vec{x}$ __es solo una parte__ del espacio nulo de $A$. Recordemos que en $U$ existen dos columnas libres, debido a aquello, también podemos establecer que $x_{2} = 0$ y $x_{4} = 1$ y volver a aplicar el método de sustitución hacia atrás.
$$
\begin{aligned}
x_{1} + 2(0) + 2x_{3} + 2(1) &= 0 \\
0(x_{1}) + 0(0)+ 2x_{3} + 4(1) &= 0 \\
0(x_{1}) + 0(0)+ 0x_{3}+ 0(1) &= 0 \\
\end{aligned}
$$
Otra vez, cancelamos la tercera ecuación y, a partir de la segunda, buscamos el valor de $x_{3}$.
$$
\begin{aligned}
0(x_{1}) + 0(0)+ 2x_{3} + 4(1) &= 0 \\
x_{3} &= -2
\end{aligned}
$$
Luego, reemplazamos $x_{3} = -2$ en la primera ecuación para encontrar $x_{1}$.
$$
\begin{aligned}
x_{1} + 2(0) + 2(-2) + 2(1) &= 0 \\
x_{1} &= 2
\end{aligned}
$$
En consecuencia, otro vector del espacio nulo de $A$ es $\vec{x} = \langle 2, \ 0, \ -2, \ 1 \rangle$, el cual también podemos escalar por un número $d \in \mathbb{R}$ sin salirnos de este subespacio vectorial.
$$
d\vec{x} =
d \cdot
\begin{bmatrix}
2 \\ 0 \\ -2 \\ 1
\end{bmatrix}
$$
Ahora podemos obtener todo el espacio nulo $N(U)$, que consiste de __todas las combinaciones lineales entre $c\vec{x}$ y $d\vec{x}$__ adentro de $\mathbb{R}^{4}$, el cual es el mismo de $A$.
$$
N(A) = N(U) =
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
Y si unimos los dos vectores columna $\vec{x}$, formamos la __Matriz del Espacio Nulo__ $N$, la cual al multiplicar a $A$ o a $U$, obtenemos una __Matriz Nula__.

$$
\begin{aligned}
AN &= 0 \\
\begin{bmatrix}
1 & 2 & 2 & 2 \\
2 & 4 & 6 & 8 \\
3 & 6 & 8 & 10
\end{bmatrix}
\begin{bmatrix}
-2 & 2 \\
1 & 0 \\
0 & -2 \\
0 & 1
\end{bmatrix}
&=
\begin{bmatrix}
0 & 0 \\
0 & 0 \\
0 & 0
\end{bmatrix}
\end{aligned}
$$

## 7.3 Soluciones Especiales.

A los vectores $\vec{x} = \langle -2, \ 1, \ 0, \ 0 \rangle$ y $\vec{x} = \langle 2, \ 0, \ -2, \ 1 \rangle$ podemos entenderlos como __Soluciones Especiales__ porque provienen de "números especiales" que asignamos a los componentes de las columnas (variables) libres, que en este caso fueron $x_{2}$ y $x_{4}$.

Por lo tanto, podemos decir que el espacio nulo $N(U)$ que calculamos son __todas las combinaciones lineales entre las dos soluciones especiales__.

También, si $A$ es una matriz rectangular de $n \times m$ con __Rango__ igual a $r$, entonces:
$$
\begin{aligned}
  \#\text{Columnas Pivotes de } A &= r \\
  \#\text{Columnas Libres de } A &= m - r
\end{aligned}
$$
Y, como vimos anteriormente, la __cantidad de soluciones especiales__ está dada por el __número de columnas libres__ que tengamos. Por lo tanto:
$$
  \#\text{Sol. Especiales} = \#\text{Columnas Libres} = m - r
$$
Esto implica que la __dimensión de una matriz $N$__ siempre será de $m \times (m - r)$.

## 7.4 Matriz en Forma Escalada Reducida.

Es posible seguir realizando operaciones en $U$ para llevarla a una __Matriz en Forma Escalonada Reducida__, donde sus __pivotes son todas iguales a uno__ y las __entradas por sobre y debajo__ de ellas corresponden a __ceros__. La denotamos como $R$.

Por ejemplo, en el caso de $U$ aún podemos eliminar la entrada $a_{1, 3} = 2$ que está arriba de la segunda pivote $a_{2, 3} = 2$ y hacer que esta última sea igual a $1$. Para ello, realizamos los siguientes pasos:

\begin{itemize}
\item[4.] Restar la primera fila a la segunda.
\item[5.] Multiplicar la segunda fila por $1/2$.
\end{itemize}
$$
\begin{aligned}
U =
\begin{bmatrix}
1 & 2 & 2 & 2 \\
0 & 0 & 2 & 4 \\
0 & 0 & 0 & 0
\end{bmatrix}
&\Longrightarrow
\begin{bmatrix}
1 & 2 & 0 & -2 \\
0 & 0 & 2 & 4 \\
0 & 0 & 0 & 0
\end{bmatrix} \\
\begin{bmatrix}
1 & 2 & 0 & -2 \\
0 & 0 & 2 & 4 \\
0 & 0 & 0 & 0
\end{bmatrix}
&\Longrightarrow
R =
\begin{bmatrix}
1 & 2 & 0 & -2 \\
0 & 0 & 1 & 2 \\
0 & 0 & 0 & 0
\end{bmatrix}
\end{aligned}
$$
Luego, al aplicar el método de sustitución hacia atrás y estableciendo que $x_{2} = 1$ y $x_{4} = 0$ y, posteriormente, que $x_{2} = 0$ y $x_{4} = 1$, obtenemos el __mismo espacio nulo__ de $A$ y de $U$:

$$
N(A) = N(U) = N(R) =
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
__Una ventaja__ de obtener una matriz $R$ es que las __columnas pivotes__ son más fáciles de identificar, porque se ubican donde existen las entradas pivotes, que son iguales a $1$. Mientras que en aquellas donde ésto no ocurre, podemos deducir que son __columnas libres__.

__Otra ventaja__, es que en ella __podemos encontrar las soluciones especiales casi de forma exacta__.

Unamos las columnas pivotes (1 y 3) y las columnas libres (2 y 4) de $R$ como dos matrices distintas (sin considerar a la tercera fila), que llamaremos $P$ y $L$.
$$
\begin{aligned}
P &= I =
\begin{bmatrix}
1 & 0 \\
0 & 1
\end{bmatrix}
&
L &=
\begin{bmatrix}
2 & -2 \\
0 & 2
\end{bmatrix}
\end{aligned}
$$
Veamos que $P$ es una matriz identidad ($I$). Por otra parte, al unir las entradas $x_{1}$ y $x_{3}$ de ambas soluciones especiales $\vec{x}$, se forma una matriz que es equivalente a $-L$. En general, __una matriz escalonada reducida se conforma como bloques de matrices de $P = I$ y de $L$__.

Por ejemplo, digamos que tenemos una matriz en forma escalonada reducida $R$ de $n \times m$, donde las primeras $r$ columnas son pivotes.

\newpage

\begin{figure}[hbt!]
\centering
\includegraphics[scale=0.7]{img/class-7/rref-matrix.jpg}
\end{figure}

Observemos que $I$ __siempre será de $r \times r$ dimensiones__.

Por otra parte, para que se cumpla que $RN = 0$, la matriz $N$ tendrá que ser:
$$
N =
\begin{bmatrix}
-L \\ I
\end{bmatrix}
$$
Puesto que:
$$
\begin{aligned}
RN &= 0 \\
\begin{bmatrix}
I & L \\
0 & 0
\end{bmatrix}
\begin{bmatrix}
-L \\ I
\end{bmatrix}
&=
\begin{bmatrix}
0 \\ 0
\end{bmatrix} \\
\begin{bmatrix}
I(-L) + LI \\
0(-L) + 0I
\end{bmatrix}
&=
\begin{bmatrix}
0 \\ 0
\end{bmatrix} \\
\begin{bmatrix}
0 \\ 0
\end{bmatrix}
&=
\begin{bmatrix}
0 \\ 0
\end{bmatrix}
\end{aligned}
$$
Lo que esto nos está mostrando, es que las __entradas pivotes__^[Es decir, las que buscamos al aplicar el método de sustitución hacia atrás habiendo asignado los valores a las entradas libres o "números especiales".] de las __soluciones especiales__ siempre serán los __inversos aditivos de las entradas de las columnas libres de $A$__ (i.e, las columnas de $-L$).

Lo anterior podemos comprobarlo al resolver $Rx = 0$. Digamos que los componentes pivotes de $\vec{x}$ son $x_{P}$ y las libres $x_{L}$, entonces:
$$
\begin{aligned}
Rx &= 0 \\
\begin{bmatrix}
I & L \\
0 & 0
\end{bmatrix}
\begin{bmatrix}
x_{P} \\ x_{L}
\end{bmatrix}
&=
\begin{bmatrix}
0 \\ 0
\end{bmatrix} \\
x_{P}
\begin{bmatrix}
I \\ 0
\end{bmatrix}
+
x_{L}
\begin{bmatrix}
L \\ 0
\end{bmatrix}
&=
\begin{bmatrix}
0 \\ 0
\end{bmatrix}
\end{aligned}
$$
Descartemos los segundos componentes de los vectores columnas de ambos lados de la ecuación (i.e, los ceros).
$$
  Ix_{P} + Lx_{L} = 0
$$
Si sumamos $-Lx_{L}$ a la ecuación, entonces:
$$
\begin{aligned}
Ix_{P} &= -Lx_{L} \\
x_{P} &= -Lx_{L}
\end{aligned}
$$
__Ejercicio.__ \quad Calcule el espacio nulo de la siguiente matriz^[Es $A^{T}$ del ejemplo anterior xd.]:
$$
A =
\begin{bmatrix}
1 & 2 & 3 \\
2 & 6 & 8 \\
2 & 4 & 6 \\
2 & 8 & 10
\end{bmatrix}
$$
__Solución.__ \quad Antes de calcular $N(A)$, veamos qué información nos entrega la matriz $A$. En primer lugar, veamos que la tercera columna es la suma de las dos anteriores. Es decir, es linealmente dependiente mientras que las otras son independientes. Esto implica que el rango de $A$ es $r = 2$.

Como la cantidad de columnas libres es $m - r = 3 - 2 = 1$, por tanto tenemos la misma cantidad de soluciones especiales. En otras palabras, $N(A)$ debería ser el producto entre una constante y solo un vector $\vec{x}$ de soluciones.

Ahora pasemos $A \to U$. Para ello, realicemos los siguientes pasos:

\begin{enumerate}
\item Multiplicar por $2$ a la primera fila y restar la segunda a la primera, luego la tercera a la primera y, posteriormente, la cuarta a la primera.

\item Intercambiar la cuarta por la tercera fila.

\item Multiplicar por $2$ la segunda fila y restar la tercera con la segunda.
\end{enumerate}

$$
\begin{aligned}
A =
\begin{bmatrix}
1 & 2 & 3 \\
2 & 6 & 8 \\
2 & 4 & 6 \\
2 & 8 & 10
\end{bmatrix}
&\Longrightarrow
\begin{bmatrix}
2 & 4 & 6 \\
2 & 6 & 8 \\
2 & 4 & 6 \\
2 & 8 & 10
\end{bmatrix}
\Longrightarrow
\begin{bmatrix}
1 & 2 & 3 \\
0 & 2 & 2 \\
0 & 0 & 0 \\
0 & 4 & 4
\end{bmatrix} \\
\begin{bmatrix}
1 & 2 & 3 \\
0 & 2 & 2 \\
0 & 0 & 0 \\
0 & 4 & 4
\end{bmatrix}
&\Longrightarrow
\begin{bmatrix}
1 & 2 & 3 \\
0 & 2 & 2 \\
0 & 4 & 4 \\
0 & 0 & 0
\end{bmatrix}
\end{aligned}
$$

$$
\begin{aligned}
\begin{bmatrix}
1 & 2 & 3 \\
0 & 2 & 2 \\
0 & 4 & 4 \\
0 & 0 & 0
\end{bmatrix}
&\Longrightarrow
\begin{bmatrix}
1 & 2 & 3 \\
0 & 4 & 4 \\
0 & 4 & 4 \\
0 & 0 & 0
\end{bmatrix}
\Longrightarrow
U =
\begin{bmatrix}
1 & 2 & 3 \\
0 & 2 & 2 \\
0 & 0 & 0 \\
0 & 0 & 0
\end{bmatrix}
\end{aligned}
$$

Sigamos operando sobre $U$ para que $U \to R$. Los pasos que realizaremos son:

\begin{enumerate}
\item Restar la primera fila a la segunda.
\item Multiplicar por $1/2$ la segunda fila.
\end{enumerate}
$$
\begin{aligned}
U =
\begin{bmatrix}
1 & 2 & 3 \\
0 & 2 & 2 \\
0 & 0 & 0 \\
0 & 0 & 0
\end{bmatrix}
&\Longrightarrow
\begin{bmatrix}
1 & 0 & 1 \\
0 & 2 & 2 \\
0 & 0 & 0 \\
0 & 0 & 0
\end{bmatrix} \\
\begin{bmatrix}
1 & 0 & 1 \\
0 & 2 & 2 \\
0 & 0 & 0 \\
0 & 0 & 0
\end{bmatrix}
&\Longrightarrow
R =
\begin{bmatrix}
1 & 0 & 1 \\
0 & 1 & 1 \\
0 & 0 & 0 \\
0 & 0 & 0
\end{bmatrix}
\end{aligned}
$$
Finalmente, resolvamos $Rx = 0$. Ya sabemos que solo tenemos una columna libre, por lo que solo debemos asignar un "número especial". Establezcamos que $x_{3} = 1$ (si es cero, no obtendríamos información alguna de las soluciones).
$$
\begin{aligned}
Rx &= 0 \\
\begin{bmatrix}
1 & 0 & 1 \\
0 & 1 & 1 \\
0 & 0 & 0 \\
0 & 0 & 0
\end{bmatrix}
\begin{bmatrix}
x_{1} \\ x_{2} \\ 1
\end{bmatrix}
&=
\begin{bmatrix}
0 \\ 0 \\ 0
\end{bmatrix}
\end{aligned}
$$
Como sistema de ecuaciones quedaría de la siguiente manera:
$$
\begin{aligned}
1x_{1} + 0x_{2} + 1(1) &= 0 \\
0x_{1} + 1x_{2} + 1(1) &= 0
\end{aligned}
$$
Calculemos $x_{2}$ a partir de la segunda ecuación. 
$$
\begin{aligned}
0x_{1} + 1x_{2} + 1(1) &= 0 \\
x_{2} &= -1
\end{aligned}
$$
Y, reemplazando $x_{2} = -1$ en la primera ecuación, calculemos $x_{1}$.
$$
\begin{aligned}
1x_{1} + 0(-1) + 1(1) &= 0 \\
x_{1} &= -1
\end{aligned}
$$
Por lo tanto, el espacio nulo de $A$ corresponde a:
$$
N(A) = N(U) = N(R) =
c
\begin{bmatrix}
-1 \\ -1 \\ 1
\end{bmatrix}
$$
