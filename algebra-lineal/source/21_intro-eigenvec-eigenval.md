---
title: Clase 21. Introducción a los Eigenvectores y Eigenvalores.
subtitle: Curso 'Linear Algebra' del MIT.
abstract: \noindent El siguiente tema de este curso que ahora comenzaremos a abordar, corresponde a los __eigenvectores__ y __eigenvalores__. Veremos qué son, cómo hallarlos y casos particulares que pueden surgir. Nos encontraremos con conceptos ya estudiados como el __determinante__ y el __espacio nulo__, así como uno nuevo llamado __Traza__ (_trace_) de una Matriz.
lang: es
fontsize: 12pt
geometry: margin=1in
header-includes:
  - \usepackage{setspace} \onehalfspacing
  - \usepackage{parskip}
  - \usepackage{amsmath, amssymb}
---


# 1. Eigenvectores y Eigenvalores.

Cuando es posible calcular el producto entre una matriz y un vector (en ese orden), siempre obtendremos un vector. Un ejemplo ya clásico que hemos visto en este curso es el de
$$
  A\vec{x},
$$
donde pasamos de $\vec{x} \to A\vec{x}$ a partir de la matriz $A$.

A nivel geométrico, los vectores $\vec{x}$ y $A\vec{x}$ no siempre se encuentran en la misma dirección. Sin embargo, cuando $A$ es una matriz cuadrada sí es posible que sean paralelos.

Sea $A$ una matriz de $n \times n$ y $\vec{x}$ un vector no nulo. Si al calcular el producto $A \vec{x}$ obtenemos el mismo vector $\vec{x}$ multiplicado por un escalar $\lambda$,
$$
  A \vec{x} = \lambda \vec{x},
$$
entonces $\vec{x}$ es un **Eigenvector** de $A$ y $\lambda$ su **Eigenvalor**, con $\lambda \vec{x}$ siendo paralelo a $\vec{x}$.

La palabra *eigen* proviene del alemán y se suele traducir como "propio" o "característico". Es por ello que también es posible encontrar mencionados a los eigenvectores y eigenvalores como "vectores y valores **propios**" o "vectores y valores **característicos**".

El eigenvalor $\lambda \in \mathbb{R}$, pero también veremos que $\lambda \in \mathbb{C}$, donde $\mathbb{C}$ es el conjunto de los números complejos. Esto implica que existe la posibilidad de que $\lambda$ sea un número imaginario $\pm i$.

Siempre vamos a considerar eigenvectores $\vec{x} \neq \vec{0}$ para **evitar la solución trival** $A\vec{0} = \lambda \vec{0}$, ya que es irrelevante en cuanto a la información que nos da de la matriz $A$. Además, nuestro interés se centrará en aquellos **linealmente independientes**.


# 2. Ejemplos de Eigenvalores y Eigenvectores.

Revisemos algunos ejemplos de eigenvalores y eigenvectores de matrices singular, de proyección y permutación.

## 2.1 Matriz Singular.

Supongamos que $A$ es una matriz de $n \times n$, $\vec{x} \neq \vec{0}$ y que al calcular el producto matricial entre $A$ y $\vec{x}$ obtenemos el vector $\lambda \vec{x}$ paralelo a $\vec{x}$.
$$
 A \vec{x} = \lambda \vec{x}
$$
Si $\lambda = 0$, entonces
$$
  A \vec{x} = 0 \vec{x} = \vec{0}
$$
Es decir, cuando $\lambda = 0$, $\vec{x} \in N(A)$ donde $N(A)$ es el **Espacio Nulo**^[Para más detalles sobre el espacio nulo, revisar Clases 6 y 7.] de la matriz $A$.

Ahora bien, la única posibilidad de que el eigenvalor sea $\lambda = 0$ es que $A$ sea una **Matriz Singular**, ya que estamos trabajando bajo el supuesto de que $\vec{x} \neq \vec{0}$.

Por lo tanto, podemos generalizar que:
$$
  \lambda = 0 \ \mathrm{y} \ \vec{x} \in N(A) \iff \nexists \ A^{-1}
$$
En otras palabras, si $A$ es **singular**, entonces $\lambda = 0$ es un eigenvalor de esta matriz y su eigenvector pertenece al espacio nulo.

## 2.2 Matriz de Proyección.

Ahora tratemos de buscar los eigenvalores y eigenvectores de una matriz de proyección.

Si tenemos un vector y queremos proyectarlo sobre otro objeto (sea una línea, un plano, un subespacio, etc) por medio de otro vector, podemos multiplicar al primero por una **matriz de proyección** para obtener al último^[Revisar las Clases 15 y 16 para ver cómo se obtiene así como sus aplicaciones.].

Por ejemplo, digamos que $P$ es una matriz de proyección cuadrada con la cual proyectamos a un vector $\vec{b}$ en un plano a partir de otro vector $P\vec{b}$ y que nuestro propósito es **conocer los eigenvectores y eigenvalores de $P$**.

Cuando estudiamos sobre proyecciones, nos centramos en proyectar vectores en objetos a los cuales no pertenecían^[Por ejemplo, sobre una línea o sobre el espacio columna en el problema de mínimos cuadrados.]. Si lo pensamos bien, aquellos **no cumplen con ser eigenvectores** porque nunca serán paralelos al de proyección.

Por lo tanto, para este ejemplo un **eigenvector** de $P$ que proyecta a $\vec{b}$ en un plano a partir de $P\vec{b}$ será aquel que también se encuentre en (o pertenezca a) éste, el cual es el mismo $\vec{b}$.
$$
  P \vec{b} = \vec{b}
$$
Esto implica, por consiguiente, que su **eigenvalor** es $\lambda = 1$.
$$
  P \vec{b} = 1 \vec{b}
$$
Más en general, si proyectamos a un vector $\vec{b}$ en un plano a partir de $P\vec{b}$, entonces **todos los $\vec{b}$ que estén en el plano serán eigenvectores de $P$** con un **eigenvalor de $1$**.

No obstante, de igual modo podemos buscar un eigenvector de $P$ que no esté en el plano. Principalmente, será de un vector $\vec{b}$ que sea **perpendicular** a éste porque su proyección $P\vec{b}$ en el plano será el **vector cero**.
$$
  P \vec{b} = \vec{0}
$$
Como $\vec{b}$ debe ser un vector no nulo para que sea un eigenvector de $P$, podemos asumir que el **eigenvalor es $\lambda = 0$**.
$$
  P \vec{b} = 0 \vec{b}
$$
Así, podemos generalizar también que en la proyección $P \vec{b}$ en un plano donde $\vec{b}$ es perpendicular a éste, los **eigenvectores de $P$ serán todos los vectores $\vec{b}$ ortogonales al plano** los cuales tendrán **eigenvalores $\lambda = 0$**.

El caso de la matriz de proyección nos muestra que **es posible encontrar múltiples eigenvalores y eigenvectores en una matriz cuadrada**.

## 2.3 Matriz Permutación.

Busquemos los eigenvectores y eigenvalores de la siguiente matriz de permutación.
$$
A =
\begin{bmatrix}
0 & 1 \\
1 & 0
\end{bmatrix}
$$
Y asumamos que está multiplicando a un vector no nulo $\vec{x}$.
$$
A \vec{x} =
\begin{bmatrix}
0 & 1 \\
1 & 0
\end{bmatrix} \cdot
\begin{bmatrix}
x_{1} \\ x_{2}
\end{bmatrix} =
\begin{bmatrix}
x_{2} \\ x_{1}
\end{bmatrix}
$$
Un eigenvector de $A$ debe devolvernos al $\vec{x}$ inicial y siendo multiplicado por $\lambda$. En ese sentido, uno de ellos debe ser aquel con eigenvalor igual a $1$, el cual corresponde a:
$$
\vec{x}_{1} =
\begin{bmatrix}
1 \\ 1
\end{bmatrix},
\; \mathrm{con} \ \lambda_{1} = 1
$$
El vector $\vec{x}_{1}$ es un eigenvector de $A$ porque cuando esta matriz de permutación multiplica al $\vec{x}_{1}$ obtenemos al mismo vector.
$$
A \vec{x}_{1} =
\begin{bmatrix}
0 & 1 \\
1 & 0
\end{bmatrix} \cdot
\begin{bmatrix}
1 \\ 1
\end{bmatrix} =
1 \cdot
\begin{bmatrix}
1 \\ 1
\end{bmatrix} =
\lambda_{1} \vec{x}_{1}
$$
Por consiguiente, bajo la misma lógica otro eigenvector de $A$ será uno con eigenvalor $\lambda_{2} = -1$, el cual puede ser:
$$
\vec{x}_{2} =
\begin{bmatrix}
-1 \\ 1
\end{bmatrix}
$$
puesto que
$$
A \vec{x}_{2} =
\begin{bmatrix}
0 & 1 \\
1 & 0
\end{bmatrix} \cdot
\begin{bmatrix}
-1 \\ 1
\end{bmatrix} =
\begin{bmatrix}
1 \\ -1
\end{bmatrix} =
-1 \cdot
\begin{bmatrix}
-1 \\ 1
\end{bmatrix} =
\lambda_{2} \vec{x}_{2}
$$


# 3. La Ecuación Característica.

En los ejemplos anteriores buscamos eigenvalores y eigenvectores de forma intuitiva, porque lo hicimos con matrices que ya conocemos. Ahora veremos un procedimiento que nos permite encontrarlos de forma más sistemática para cualquier matriz de $n \times n$.

Digamos que $A$ es una matriz de $n \times n$ y el vector $\vec{x} \neq \vec{0}$. Como vimos en la sección 1, la definición de los eigenvalores y eigenvectores de $A$ está dada por la igualdad
$$
  A \vec{x} = \lambda \vec{x}
$$
Podemos usar esta ecuación para conocer tanto a $\lambda$ como a $\vec{x}$, a pesar de que ambos son desconocidos. Para ello, la estrategia que es usada es, en primer lugar, despejar el lado derecho sumando por $(- \lambda \vec{x})$.
$$
  A \vec{x} - \lambda \vec{x} = \vec{0}
$$
Como vemos, en el lado izquierdo de la ecuación el vector $\vec{x}$ es un término común, por lo que podemos factorizarlo.
$$
  (A - \lambda I) \ \vec{x} = \vec{0}
$$
donde $I$ es la matriz identidad, ya que $I \vec{x} = \vec{x}$.

La expresión $(A - \lambda I)$ es una matriz y, a partir de la ecuación de arriba, podemos afirmar que el eigenvector $\vec{x}$ de $A$ es el **espacio nulo** de $(A - \lambda I)$ o, en otras palabras, $\vec{x} = N(A - \lambda I)$. Pero para conocerlo, antes tenemos que encontrar al eigenvalor $\lambda$.

Recordemos que trabajamos bajo el supuesto de que el eigenvector $\vec{x} \neq \vec{0}$. En la ecuación
$$
  (A - \lambda I) \ \vec{x} = \vec{0}
$$
la única posibilidad de que no sea el vector cero es que la matriz $(A - \lambda I)$ sea **singular** y, como ya hemos estudiado, una forma de evaluar aquello es que **su determinante sea igual a cero**.
$$
  \det(A - \lambda I) = 0
$$
La igualdad de arriba recibe el nombre de **Ecuación Característica** o **Ecuación del Eigenvalor**, porque con ella obtenemos a $\lambda$, lo que nos permite después conocer a $\vec{x}$.

El cálculo de $\det(A - \lambda I)$ siempre resultará en un polinomio de $n$-ésimo grado, con $n$ coincidiendo con ser la cantidad de filas y columnas de $A$, el cual recibe el nombre de **Polinomio Característico** y sus raíces corresponden a los eigenvalores.

Entonces, para buscar los eigenvalores y eigenvectores de una matriz $A$ de $n \times n$ seguimos los pasos de a continuación:

1. Calcular el $\det(A - \lambda I)$ para obtener el polinomio característico.

2. Buscar los eigenvalores $\lambda_{i}$ como las raíces del polinomio característico.

3. Calcular los eigenvectores $\vec{x}$ para cada $\lambda_{i}$ resolviendo $(A - \lambda_{i} I) \vec{x} = \vec{0}$.

**Ejemplo 1.** Calcule los eigenvalores y eigenvectores de la siguiente matriz:
$$
A =
\begin{bmatrix}
3 & 1 \\
1 & 3
\end{bmatrix}
$$
**Solución.** Comencemos buscando los eigenvalores de $A$ usando la ecuación característica. Para ello, primero calculemos la matriz $(A - \lambda I)$.
$$
A - \lambda I =
\begin{bmatrix}
3 & 1 \\
1 & 3
\end{bmatrix} -
\lambda \cdot
\begin{bmatrix}
1 & 0 \\
0 & 1
\end{bmatrix} =
\begin{bmatrix}
3 & 1 \\
1 & 3
\end{bmatrix} -
\begin{bmatrix}
\lambda & 0 \\
0 & \lambda
\end{bmatrix} =
\begin{bmatrix}
3 - \lambda & 1 \\
1 & 3 - \lambda
\end{bmatrix}
$$
Luego, apliquemos la ecuación característica.
$$
\begin{aligned}
\det(A - \lambda I) &= 0 \\
\begin{vmatrix}
3 - \lambda & 1 \\
1 & 3 - \lambda
\end{vmatrix} &= 0 \\
(3 - \lambda) \cdot (3 - \lambda) - (1 \cdot 1) &= 0 \\
(3 - \lambda)^{2} - 1 &= 0 \\
\lambda^{2} - 6\lambda + 8 &= 0
\end{aligned}
$$
Hemos obtenido el polinomio característico $\lambda^{2} - 6\lambda + 8$. Como está igualado a cero, podemos buscar a los eigenvalores $\lambda$ como las raíces de este polinomio cuadrático.
$$
\begin{aligned}
\lambda^{2} - 6\lambda + 8 &= 0 \\
(\lambda - 4) \cdot (\lambda - 2) &= 0
\end{aligned}
$$
Por lo tanto:
$$
\begin{aligned}
\lambda_{1} - 4 &= 0 \qquad & \lambda_{2} - 2 &= 0 \\
    \lambda_{1} &= 4 \qquad &     \lambda_{2} &= 2
\end{aligned}
$$
Ahora busquemos los eigenvectores para $\lambda_{1}$ y $\lambda_{2}$. Comencemos con el primero.
$$
\begin{aligned}
(A - \lambda_{1} I) \ \vec{x} &= \vec{0} \\
\begin{bmatrix}
3 - (4) & 1 \\
1 & 3 - (4)
\end{bmatrix} \cdot
\begin{bmatrix}
x_{1} \\ x_{2}
\end{bmatrix} &=
\begin{bmatrix}
0 \\ 0
\end{bmatrix} \\
\begin{bmatrix}
-1 & 1 \\
1 & -1
\end{bmatrix} \cdot
\begin{bmatrix}
x_{1} \\ x_{2}
\end{bmatrix} &=
\begin{bmatrix}
0 \\ 0
\end{bmatrix}
\end{aligned}
$$
Como vemos, ahora calculamos el espacio nulo de $(A - \lambda_{1} I)$. Por lo tanto, primero pasamos esta matriz a una de forma escalonada o triangular superior $U$.
$$
(A - \lambda_{1} I) =
\begin{bmatrix}
-1 & 1 \\
1 & -1
\end{bmatrix}
\Longrightarrow
\begin{bmatrix}
1 & -1 \\
-1 & 1
\end{bmatrix}
\Longrightarrow
\begin{bmatrix}
1 & -1 \\
0 & 0
\end{bmatrix} =
U
$$
En la matriz $U$, su primera columna pivote y la segunda es libre, lo que nos permite establcer que:
$$
\begin{aligned}
U \vec{x} &= \vec{0} \\
\begin{bmatrix}
1 & -1 \\
0 & 0
\end{bmatrix} \cdot
\begin{bmatrix}
x_{1} \\ 1
\end{bmatrix} &=
\begin{bmatrix}
0 \\ 0
\end{bmatrix}
\end{aligned}
$$
Luego, al pasar la igualdad de arriba a un sistema a ecuaciones y al aplicar el método de sustitución hacia atrás, obtenemos que:
$$
\begin{aligned}
x_{1} - 1 &= 0 \\
x_{1} &= 1
\end{aligned}
$$
Por consiguiente, el eigenvector $\vec{x}_{1}$ de $A$ con eigenvalor $\lambda_{1} = 4$ es:
$$
\vec{x}_{1} =
\begin{bmatrix}
1 \\ 1
\end{bmatrix}
$$
Ahora, de la misma manera busquemos al segundo eigenvector $\vec{x}_{2}$ de $A$ a partir de $\lambda_{2} = 2$. Partamos conociendo a la matriz $(A - I \lambda_{2})$.
$$
(A - I \lambda_{2}) =
\begin{bmatrix}
3 - (2) & 1 \\
1 & 3 - (2)
\end{bmatrix} =
\begin{bmatrix}
1 & 1 \\
1 & 1
\end{bmatrix}
$$
Posteriormente, apliquemos operaciones de reducción de fila a $(A - I \lambda_{2})$.
$$
(A - I \lambda_{2}) =
\begin{bmatrix}
1 & 1 \\
1 & 1
\end{bmatrix}
\Longrightarrow
\begin{bmatrix}
1 & 1 \\
0 & 0
\end{bmatrix} =
U
$$
La primera columna de $U$ es pivote y la segunda es libre. Por lo tanto, estableceremos que:
$$
\begin{aligned}
U \vec{x}_{2} &= \vec{0} \\
\begin{bmatrix}
1 & 1 \\
0 & 0
\end{bmatrix} \cdot
\begin{bmatrix}
x_{1} \\ 1
\end{bmatrix} &=
\begin{bmatrix}
0 \\ 0
\end{bmatrix}
\end{aligned}
$$
Al pasar este sistema matricial a uno de ecuaciones lineales y al aplicar el método de sustitución hacia atrás, obtenemos que
$$
\begin{aligned}
x_{1} + 1 &= 0 \\
x_{1} &= -1
\end{aligned}
$$
y, por consiguiente, el eigenvector $\vec{x}_{2}$ de $A$ con eigenvalor $\lambda_{2} = 2$ es:
$$
\vec{x}_{2} =
\begin{bmatrix}
-1 \\ 1
\end{bmatrix}
$$


# 4. Peculiaridades de los eigenvalores y eigenvectores.

A partir de la ecuación característica y del polinomio característico que acabamos de estudiar, veamos algunas particularidades que es posible observar de ellos en los eigenvalores y eigenvectores.

## 4.1 La traza y el determinante de una matriz como guías para conocer sus eigenvalores.

Un hecho que ocurre en todas las matrices cuadradas, es que la **suma de las entradas de su diagonal principal**, también conocida como **Traza de una matriz**, es equivalente a la **suma de sus eigenvalores**.

En otras palabras, sea $A$ una matriz de $n \times n$, donde las entradas su diagonal principal son $a_{i, j}$, con $i = j$, y sea $\mathrm{tr}(A)$ su traza. Es posible garantizar que:
$$
  \mathrm{tr}(A) = \sum_{i = 1}^{n} a_{i, j} = \sum_{i = 1}^{n} \lambda_{i}
$$
Esta información nos da una buena guía en cuanto a los valores que pueden tomar los eigenvalores de una matriz. Si su suma es distinta a la de la traza de $A$, quiere decir que alguno de los $\lambda$ fue calculado de forma errónea.

Los **eigenvalores** de una matriz también nos entrega información sobre su **determinante**, ya que es equivalente al **producto de los primeros**.
$$
  \det(A) = \prod_{i = 1}^{n} \lambda_{i}
$$

## 4.2 Condición para que eigenvectores sean linealmente independientes.

Otro hecho relevante es que cuando los **eigenvalores** de una matriz son **distintos entre sí**, sus **eigenvectores** siempre serán **linealmente independientes**^[De hecho, si incluimos al $\vec{0}$ y conformamos una base (*basis*) de eigenvectores, es posible generar (*to span*) el llamado **Subespacio Eigenvectorial**.].

## 4.3 Información sobre los eigenvalores recolectada desde el polinomio característico.

También es posible conocer el valor de la **suma de los eigenvalores** de una matriz en su **polinomio característico**. Este siempre corresponde al **coeficiente del segundo término de mayor grado**.

Por ejemplo, en el polinomio $\lambda^{2} - 6\lambda + 8$ de la matriz
$$
A =
\begin{bmatrix}
3 & 1 \\
1 & 3
\end{bmatrix},
$$
el coeficiente de $6 \lambda$ coincide con ser igual a $\mathrm{tr}(A) = 6$.

Por otra parte, **la constante del polinomio característico siempre es igual al determinante de la matriz**. En el mismo ejemplo visto arriba podemos ver que la constante de $\lambda^{2} - 6\lambda + 8$ es equivalente al $\det(A) = 8$.

El **grado del polinomio característico** es igual a la cantidad de filas o columnas de la matriz $A$, que también es equivalente a la **cantidad de eigenvalores** que ésta tiene.

Así, en general el polinomio característico es de la siguiente forma:
$$
  \det(A - \lambda I) = \lambda^{n} - \mathrm{tr}(A) \lambda^{n - 1} + \cdots + \det(A) = 0
$$

## 4.4 Eigenvectores y eigenvalores cuando la matriz $A$ es el producto entre un escalar y la matriz $I$.

Otro aspecto relevante, es que si a una matriz cuadrada $A$ le sumamos (o restamos) otra matriz que es el **multiplo de una matriz identidad** $I$, los **eigenvalores** de $A$ serán la suma (o resta) entre ellos y el factor de $I$, mientras que los **eigenvectores se mantendrán iguales**.

**Demostración.** Sea:
$$
  A \vec{x} = \lambda \vec{x}
$$
Si $A = (A + cI)$, con $c$ siendo un escalar, entonces:
$$
  (A + cI) \vec{x} = A \vec{x} + c \vec{x} = \lambda \vec{x} + c \vec{x} = (\lambda + c) \vec{x} \quad (\text{Q. E. D})
$$
Esto podemos verlo en las matrices:
$$
A =
\begin{bmatrix}
3 & 1 \\
1 & 3
\end{bmatrix}
\qquad \text{ y } \qquad
B =
\begin{bmatrix}
0 & 1 \\
1 & 0
\end{bmatrix}
$$
donde la de la derecha es la de permutación que vimos en la sección 2 y se cumple que:
$$
  A = (B + 3I)
$$
Si bien los eigenvectores de ambas matrices son los mismos, los eigenvalores de $A$ son $\lambda_{A_{1}} = 4$ y $\lambda_{A_{2}} = 2$; mientras que los de $B$ corresponden a $\lambda_{B_{1}} = 1$ y $\lambda_{B_{2}} = -1$. Es decir:
$$
  \lambda_{A_{1}} = \lambda_{B_{1}} + 3 \qquad \text{ y } \qquad \lambda_{A_{2}} = \lambda_{B_{2}} + 3
$$


# 5. Casos Especiales.

Al calcular eigenvalores y eigenvectores es posible que nos encontremos con situaciones que son recurrentes e inesperadas a la vez, pero que de igual modo debemos tener en cuenta. En esta sección veremos dos casos habituales.

## 5.1 Eigenvalores imaginarios.

A continuación tenemos una matriz de rotación.
$$
R =
\begin{bmatrix}
\cos(\theta) & -\sin(\theta) \\
\sin(\theta) & \cos(\theta)
\end{bmatrix}
$$
Digamos que $R$ es una matriz que rota vectores en $90^{\circ}$. Es decir, sea $\theta = \pi/2$.
$$
R =
\begin{bmatrix}
\cos(\pi/2) & -\sin(\pi/2) \\
\sin(\pi/2) & \cos(\pi/2)
\end{bmatrix} =
\begin{bmatrix}
0 & -1 \\
1 & 0
\end{bmatrix}
$$
Como la traza de esta matriz es $\mathrm{tr}(R) = 0$, podemos asegurar que sus dos eigenvalores son iguales a cero o el mismo valor, pero de distinto signo. Comprobémoslo a partir de su ecuación característica.
$$
\begin{aligned}
\det(R - \lambda I) &= 0 \\
\begin{vmatrix}
- \lambda & -1 \\
1 & -\lambda
\end{vmatrix} &= 0 \\
\lambda^{2} + 1 &= 0 \\
\lambda^{2} &= -1
\end{aligned}
$$
Justamente, los eigenvalores de $R$ son iguales y de distinto signo, pero con la característica de ser **números complejos**^[Revisar el Apéndice para profundizar en las ideas básicas de los números complejos.]. En particular, son **imaginarios puros** donde uno de ellos es el **conjugado complejo** del otro.
$$
  \lambda_{1} = i \qquad \lambda_{2} = -i; \quad \text{para } i = \sqrt{-1}
$$
Uno podría esperar tener eigenvalores complejos si las entradas de la matriz también lo fuesen, pero es posible que ocurra con aquellas con entradas reales.

La explicación geométrica de que obtengamos en este caso eigenvalores imaginarios se debe a que, bajo el contexto de los números reales, el vector $R \vec{x}$ es $\vec{x}$ rotado en $90^{\circ}$. Efectivamente tiene eigenvalores, pero solo es posible que $R \vec{x}$ sea paralelo a $\vec{x}$ en el conjunto de los $\mathbb{C}$.

Suele ocurrir que las matrices simétricas con entradas reales tienen eigenvalores reales, mientras que en aquellas que no lo son (sea en menor medida o totalmente anti-simétricas) dichos escalares tienden a ser números complejos.


## 5.2 Eigenvalores repetidos.

Un caso problemático en nuestro ideal de matrices cuadradas, es que al menos un par de sus **eigenvalores sean iguales**, porque significa que sus **eigenvectores** son **linealmente dependientes**.

Veamos la siguiente matriz:
$$
A =
\begin{bmatrix}
3 & 1 \\
0 & 3
\end{bmatrix}
$$
Podemos conocer los eigenvalores de $A$ por medio de la ecuación característica, pero al ser triangular es posible obtenerlos más rápido calculando su traza y determinante. Recordemos que la propiedad 7 de este último^[Revisar Clase 18 para más detalles sobre las propiedades del determinante de una matriz.] señala que corresponde al producto de su diagonal cuando es triangular. En ese sentido, podemos decir que:
$$
  \mathrm{tr}(A) = 6 = \lambda_{1} + \lambda_{2} \quad \text{ y } \quad \det(A) = 9 = \lambda_{1} \lambda_{2}
$$
Debido a que la $\mathrm{tr}(A) = 6$ y el $\det(A) = 9$, podemos asumir que $\lambda_{1} = 3$ y $\lambda_{2} = 3$.

Como vemos, los eigenvalores de $A$ son iguales y el problema surge al buscar los eigenvectores a partir de la igualdad
$$
  (A - \lambda I) \vec{x} = \vec{0},
$$
porque $\vec{x}_{1} = \vec{x}_{2}$. Es decir, son linealmente dependientes y nuestro ideal es que sean independientes. Por lo tanto, está la posibilidad que al trabajar con matrices cuadradas de mayor tamaño de igual modo terminemos con menos eigenvectores de los que pensamos que podríamos tener, debido a dicho problema.


# Apéndice: Breve revisión de los números complejos.

A continuación haré un revisión introductoria a los números complejos. Me baso, principalmente, en los libros *Precálculo. Matemáticas para el Cálculo* (Stewart, et.al; 2017) y *Linear Algebra Done Right* (Axler, 2015).

## A.1 Definición de los números complejos.

En el conjunto de los números reales $\mathbb{R}$, es imposible encontrar la solución de ecuaciones cuadráticas de la forma
$$
  x^{2} + a = 0,
$$
con $a > 0$, puesto que la **raíz cuadrada de un número negativo** no está definida. Es decir, ningún número real satisface aquella ecuación.

Con el fin de poder resolver ecuaciones cuya solución es la raíz cuadrada de un número menor a cero, se desarrolló el **conjunto de los números complejos**, denotado como $\mathbb{C}$. Para ello, se definió un **nuevo número**:
$$
  i = \sqrt{-1}
$$
llamado **número imaginario**, donde el símbolo $i$ se conoce como **unidad imaginaria**. Este nuevo valor permite resolver la ecuación
$$
  i^{2} = -1
$$
Así, se definió a un **número complejo** a toda expresión de la forma:
$$
  a + bi
$$
donde $a$ y $b$ $\in \mathbb{R}$, mientras que $i$ es la unidad imaginaria donde $i^{2} = -1$.

Un número complejo $a + bi$ está compuesto de dos partes:
$$
  a \rightarrow \text{parte real} \qquad \text{ y } \qquad b \rightarrow \text{parte imaginaria}
$$
En la siguiente tabla tenemos algunos ejemplos de números complejos:

|  Número Complejo |  Parte Real   |Parte Imaginaria|
|:----------------:|:-------------:|:--------------:|
|$\frac{1}{2} - 4i$| $\frac{1}{2}$ |      $-4$      |
|        $3i$      |      $0$      |       $3$      |
|        $-7$      |      $-7$     |       $0$      |

Un número complejo con parte real igual a cero, tal como $3i$, recibe el nombre de **número imaginario puro**.

En general, **dos números complejos son iguales** siempre que sus **partes reales son iguales** y sus **partes imaginarias también lo sean**.

Por otra parte, si al tener dos números complejos la parte imaginaria de uno de ellos es igual a la del otro, pero de **signo contrario**, entonces decimos que el primero es el **Conjugado Complejo** del otro.

Más formalmente, sea $z = a + bi$ un número complejo. Su **conjugado complejo**, denotado como $\bar{z}$, corresponde a:
$$
  \bar{z} = a - bi
$$
A continuación tenemos ejemplos de números complejos y sus conjugados.

Número Complejo|Conjugado
:-------------:|:-------:
    $3 + 2i$   |$3 - 2i$
    $5 - i$    |$5 + i$
     $7i$      |$-7i$
     $8$       |$8$

## A.2 Operaciones aritméticas con números complejos.

Las operaciones aritméticas entre números complejos es similar a la realizada con números reales, salvo algunas diferencias que veremos a continuación.

Primero, establezcamos que $a + bi$ y $c + di$ son dos números complejos, donde $a$, $b$, $c$ y $d$ $\in \mathbb{R}$, mientras que $i^{2} = -1$.

### A.2.1 Adición, sustracción y multiplicación entre números complejos.

Tanto al sumar como al restar números complejos, primero agrupamos las partes imaginarias y las partes reales, para después aplicar dichas operaciones.
$$
\begin{aligned}
  &\text{Suma} \rightarrow (a + bi) + (c + di) = (a + c) + (bi + di) = (a + c) + (b + d)i \\
  &\text{Resta} \rightarrow (a + bi) - (c + di) = (a - c) + (bi - di) = (a - c) + (b - d)i
\end{aligned}
$$
Por ejemplo:
$$
  (2 + 4i) - (3 - i) = (2 + 4i) + (-3 + i) = (2 - 3) + (4i + i) = -1 + 5i
$$
En cuanto a la multiplicación entre números complejos, es similar a calcular el producto entre dos binomios. Esto implicará que también obtengamos a $i^{2}$, el cual no debemos olvidar que es igual a $-1$.
$$
  (a + bi) \cdot (c + di) = ac + adi + cdi + bdi^{2} = (ac - bd) + (ad + cd)i
$$
Ejemplo:
$$
  (2 + 4i) \cdot (3 - i) = 6 - 2i + 12i - 4i^{2} = 10 + 10i
$$

### A.2.2 División entre números complejos.

La división entre números complejos la he dejado aparte porque es un tanto distinta de aquella entre números reales, pero aún así es bastante sencilla.

Para dividir dos números complejos, antes necesitamos **cancelar la unidad imaginaria del divisor**. Aquello lo logramos **multiplicando** tanto a éste como al dividendo por el **conjugado complejo del divisor**. En otras palabras:
$$
  \frac{a + bi}{c + di} = \left(\frac{a + bi}{c + di}\right) \cdot \left(\frac{c - di}{c - di}\right) = \frac{(a + bi)(c - di)}{c^{2} - d^{2}}
$$
Por ejemplo:
$$
  \frac{7 + 3i}{4i} = \frac{7 + 3i}{4i} \cdot \frac{-4i}{-4i} = \frac{-28i - 12i^{2}}{-16i^{2}} = \frac{12 - 28i}{16} = \frac{3}{4} - \frac{7}{4} i
$$








































