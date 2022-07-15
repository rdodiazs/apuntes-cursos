---
title: Clase 1. Geometría de las Ecuaciones Lineales.
subtitle: Curso 'Linear Algebra' del MIT.
toc_depth: 1
fontsize: 12pt
geometry: [margin=1in]
header-includes:
  - \usepackage{setspace} \onehalfspacing
  - \usepackage{graphicx}
  - \usepackage{amsmath}
  - \usepackage{amssymb}
---

La idea central del álgebra lineal, es resolver sistemas de $n$ ecuaciones lineales con $n$ incógnitas. En esta ocasión veremos tres enfoques (o formas) para encontrar sus soluciones:

1. Enfoque de filas (_row picture_).

2. Enfoque de columnas (_column picture_).

3. Enfoque matricial (_matrix form_).

Vamos a trabajar a partir del siguiente sistema de dos ecuaciones lineales con dos incógnitas, $x$ e $y$.
$$
  \begin{aligned}
  2x - y &= 0 \\
  -x + 2y &= 3
  \end{aligned}
$$


## 1.1 Enfoque de Filas.

Comencemos resolviendo este sistema a partir del enfoque de filas. Básicamente, lo que hacemos es buscar valores para $x$ e $y$ que satisfagan la primera ecuación (i.e, primera fila). Luego, realizamos la misma tarea para la segunda ecuación (i.e, segunda fila). Finalmente, revisamos en que valores de ambas incógnitas coinciden las dos ecuaciones y todo esto lo ilustramos en una gráfica.

Recordemos que estamos trabajando con ecuaciones lineales, cuyas gráficas son líneas rectas, así que basta que conozcamos dos puntos en ambas ecuaciones para visualizarlas y conocer la solución del sistema.

Veamos primero qué valores toman ambas ecuaciones cuando $x = 0$.
$$
\begin{aligned}
2(0) - y &= 0 & \quad 0 + 2y &= 3 \\
y &= 0 & \quad y &= \frac{3}{2}
\end{aligned}
$$
Ahora realicemos lo mismo que en la ecuación anterior, pero cuando $x = 1$.
$$
\begin{aligned}
2(1) - y &= 0 & \quad -1 + 2y &= 3 \\
y &= 2 & \quad y &= 2
\end{aligned}
$$
Finalmente, ubiquemos los puntos en un plano de dos dimensiones o cartesiano y tracemos sus rectas.

\begin{figure}[hbt!]
\centering
\includegraphics[scale=0.7]{img/class-1/row-picture.jpg}
\end{figure}

Por lo tanto, la solución al sistema está en $x = 1$ e $y = 2$, o está dado en el par ordenado $(1, \ 2)$.


## 1.2 Enfoque de Columnas.

Resolver el sistema de ecuaciones desde un enfoque de columnas, significa que escribimos las constantes como __vectores de columnas__, las cuales son multiplicadas por las incógnitas (en este caso, $x$ e $y$) y, posteriormente, se suman ambos productos.
$$
\begin{aligned}
x \begin{bmatrix} 2 \\ -1 \end{bmatrix} + 
y \begin{bmatrix} -1 \\ 2 \end{bmatrix} = 
  \begin{bmatrix} 0 \\ 3 \end{bmatrix}
\end{aligned}
$$
Como vemos, en este enfoque la idea es buscar valores para $x$ e $y$ tal que al sumar los productos, el vector final sea igual al vector del lado derecho de la ecuación. A esta __operación__ se lo conoce como __Combinación Lineal__.

En otras palabras, en el lado izquierdo de la ecuación decimos que __estamos buscando la combinación lineal correcta de las columnas__ cuyo resultado debe ser igual al vector del lado derecho.

Para resolver esta ecuación, comencemos dibujando los dos vectores. Por un tema de legibilidad, establezcamos que $\vec{a} = \langle 2, \ -1 \rangle$ y que $\vec{b} = \langle -1, \ 2 \rangle$. Ubicaremos al vector $\vec{a}$ en su posición estándar (i.e, en el origen) y a $\vec{b}$ en el punto inicial de $\vec{a}$.

\newpage

\begin{figure}[hbt!]
\centering
\includegraphics[scale=0.8]{img/class-1/column-picture-a.jpg}
\end{figure}

Ahora veamos en qué valores de $x$ e $y$, la combinación lineal del lado izquierdo es igual al vector del lado derecho. Usando el enfoque de filas, vimos que la solución para ambas ecuaciones era $x = 1$ e $y = 2$. Si utilizamos estos valores, deberíamos obtener lo que buscamos.
$$
\begin{aligned}
1 \begin{bmatrix} 2 \\ -1 \end{bmatrix} + 
2 \begin{bmatrix} -1 \\ 2 \end{bmatrix} &= 
  \begin{bmatrix} 0 \\ 3 \end{bmatrix} \\
\begin{bmatrix} 2 \\ -1 \end{bmatrix} + 
\begin{bmatrix} -2 \\ 4 \end{bmatrix} &=
\begin{bmatrix} 0 \\ 3 \end{bmatrix} \\
\begin{bmatrix} 0 \\ 3 \end{bmatrix} &= 
\begin{bmatrix} 0 \\ 3 \end{bmatrix} 
\end{aligned}
$$
Llevemos lo anterior al gráfico, ubicando los vectores escalados por los valores elegidos para $x$ e $y$.

\begin{figure}[hbt!]
\centering
\includegraphics[scale=0.8]{img/class-1/column-picture-b.jpg}
\end{figure}

Como podemos observar, también se cumple que el vector resultante de la combinación lineal es igual a $\langle 0, \ 3 \rangle$.

\newpage

## 1.3 Enfoque Matricial.

Revisemos ahora el siguiente sistema de ecuaciones:
$$
\begin{aligned}
2x - y &= 0 \\
-x + 2y - z &= -1 \\
-3y + 4z &= 4
\end{aligned}
$$
Como vemos es un sistema de tres ecuaciones lineales con tres incógnitas.

Si lo resolvemos desde el __enfoque de filas__, la imagen que obtendremos serán tres __planos__: cada ecuación de tres incógnitas es un plano y tenemos tres ecuaciones. Y, en caso de existir una única solución, entonces dichos planos deberían unirse en un solo punto.

Cuando trabajamos con ecuaciones lineales de dos incógnitas, era sencillo usar el enfoque de filas porque solo necesitábamos tomar dos valores para una de ellas con el fin de encontrar una solución (si es que existe) al sistema. Sin embargo, cuando dichas ecuaciones tienen 3 incógnitas (o más), esta tarea se hace más complicada porque, para construir los planos, necesitamos infinitos puntos. 

En ese sentido, otra forma más sencilla de resolver este sistema de ecuaciones, es usando el __enfoque de columnas__, el cual podemos escribir como:
$$
x \begin{bmatrix} 2 \\ -1 \\ 0 \end{bmatrix} +
y \begin{bmatrix} -1 \\ 2 \\ -3 \end{bmatrix} +
z \begin{bmatrix} 0 \\ -1 \\ 4 \end{bmatrix} =
 \begin{bmatrix} 0 \\ -1 \\ 4 \end{bmatrix} 
$$
Como vemos, este caso en particular es aún más sencillo porque solo necesitamos que la combinación lineal de las columnas sea que $z = 1$, mientras que $x$ e $y$ deben ser iguales a cero^[Entendámoslo como un caso especial, porque no siempre será así.].

Lo anterior también quiere decir que, usando el enfoque de filas, la solución (i.e, el punto donde se unen los tres planos) es la terna ordenada $(0, \ 0, \ 1)$.

Visto estos dos casos, ahora vayamos al enfoque de esta sección y que es en el que nos concentraremos en este curso: el matricial.

\newpage

En el __enfoque matricial__, escribimos el sistema de ecuaciones como una __ecuación matricial__ de la forma $Ax = b$, donde $A$ es la matriz de coeficientes. Es decir, sean:
$$
\begin{aligned}
A &=
\begin{bmatrix}
2 & -1 & 0 \\
-1 & 2 & -1 \\
0 & -3 & 4
\end{bmatrix}
&
x &= \begin{bmatrix} x \\ y \\ z \end{bmatrix}
&
b &= \begin{bmatrix} 0 \\ 1 \\ -4 \end{bmatrix}
\end{aligned}
$$
Entonces:
$$
\begin{bmatrix}
2 & -1 & 0 \\
-1 & 2 & -1 \\
0 & -3 & 4
\end{bmatrix}
\begin{bmatrix} x \\ y \\ z \end{bmatrix} =
\begin{bmatrix} 0 \\ 1 \\ -4 \end{bmatrix}
$$
Si nos damos cuenta, las columnas de la matriz $A$ corresponden a los vectores cuando resolvimos el sistema a partir del enfoque de columnas, mientras que el vector del lado derecho en dicho enfoque corresponde al vector $b$ en el __enfoque matricial__.

Ahora, una pregunta que iremos trabajando en el curso es:

>> ¿Podemos resolver la ecuación $Ax = b$ para todo $b$?

O, desde el enfoque de columnas:

>> ¿Se puede llenar el espacio de 3 dimensiones con todas las combinaciones lineales de columnas posibles?

Básicamente, es la misma pregunta, pero con otras palabras. Cuando señalamos "para todo $b$" en la primera pregunta, nos referimos a todos los $b$ adentro del espacio tridimensional desde el enfoque de columnas.

Para el caso de la matriz $A$ que hemos visto acá, resolvimos a partir de sus columnas que __sí podemos resolver $Ax = b$ para su vector $b$__. En otras palabras, es posible llenar el espacio tridimensional con la combinación lineal que encontramos, la cual está representada por el vector $b$ desde el enfoque matricial.

Por lo tanto, también podemos señalar que $A$ es una __matriz no singular__ (i.e, es invertible o existe la matriz $A^{-1}$), lo cual veremos a lo largo del curso que es ideal para encontrar la solución de $Ax = b$.

Un __caso donde no podríamos producir un vector $b$ a partir de todas las combinaciones lineales posibles__ sería, por ejemplo, que __dos o más los vectores se ubiquen en un mismo plano__. Esto se basa un poco en el concepto de __independencia__ que veremos más adelante, pero la idea es que cada vector debe pertenecer a su propio plano, puesto que __entre todos los planos deben formar el espacio de tres dimensiones__.

Por ejemplo, digamos que tenemos un sistema de nueve ecuaciones lineales con nueve incógnitas. Al trabajar desde el enfoque de columnas, obtendremos nueve vectores multiplicados por sus respectivas variables en el lado izquierdo de la ecuación. Si, por decir, el octavo vector es igual en la combinación al noveno vector o, en otras palabras, ambos vectores están en el mismo plano, entonces no todos los vectores cubrirían el espacio. Es decir, resultaría en un plano de ocho dimensiones en un espacio de nueve dimensiones.

Recordemos que la idea es que todas las combinaciones lineales permitan llenar completamente el espacio dimensional. Cuando se logra, entonces podemos decir que la matriz $A$ es invertible y, por tanto, podemos resolver la ecuación $Ax = b$ para toda $b$. En caso contrario, como lo visto en el ejemplo de arriba, significa que la matriz $A$ es singular o, en otras palabras, no tiene una matriz inversa y, por consiguiente, no es posible encontrar una solución al sistema, sea o no desde un enfoque matricial.

### 1.3.1 Multiplicando una Matriz por un Vector.

Cuando buscamos calcular la ecuación matricial $Ax = b$, en el lado derecho estamos intentando calcular el producto entre una matriz $A$ y un vector $x$. Veamos dos formas de resolver aquello.

Digamos que queremos buscar el siguiente producto:
$$
\begin{bmatrix}
2 & 5 \\
1 & 3
\end{bmatrix}
\begin{bmatrix} 1 \\ 2 \end{bmatrix}
$$
Una forma de resolver este ejemplo, es hacerlo siguiendo un enfoque de columnas. Es decir:
$$
\begin{bmatrix}
2 & 5 \\
1 & 3
\end{bmatrix}
\begin{bmatrix} 1 \\ 2 \end{bmatrix} =
1 \begin{bmatrix} 2 \\ 1 \end{bmatrix} +
2 \begin{bmatrix} 5 \\ 3 \end{bmatrix} =
\begin{bmatrix} 12 \\ 7 \end{bmatrix}
$$
Otra forma de resolver este producto, es usando la idea del __producto punto__. Es decir, multiplicar la primera fila por el vector, luego hacer la misma operación con la segunda fila y, finalmente, sumar ambos productos en cada fila.
$$
\begin{bmatrix}
2 & 5 \\
1 & 3
\end{bmatrix}
\begin{bmatrix} 1 \\ 2 \end{bmatrix} =
\begin{bmatrix}
(1 \cdot 2) + (2 \cdot 5) \\
(1 \cdot 1) + (3 \cdot 2)
\end{bmatrix}
=
\begin{bmatrix} 12 \\ 7 \end{bmatrix}
$$
Es decir, el producto $Ax$ es __una combinación de columnas de $A$__. 
