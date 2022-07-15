---
title: Clase 6. Espacio Columna y Espacio Nulo.
subtitle: Curso 'Linear Algebra' del MIT.
fontsize: 12pt
geometry: [margin=1in]
header-includes:
  - \usepackage{setspace} \onehalfspacing
  - \usepackage{graphicx}
  - \usepackage{amsmath}
  - \usepackage{amssymb}
---


Para esta sexta clase entramos más en detalle sobre el subespacio vectorial, concentrándonos en el espacio columna (que ya vimos un poco en la clase anterior) y en el espacio nulo. Iremos aplicando los requisitos para que sean un subespacio que vimos en la clase cinco y empezaremos a usar sistemas de ecuaciones lineales como ejemplos para ello^[Recomiendo revisar [los apuntes sobre el espacio y subespacio vectorial de la clase cinco](5-transp-perm-esp-vect.pdf) en caso de necesitar ayuda.].


## 6.1 Repaso: Subespacio Vectorial.

Recordemos que, para que un conjunto de vectores sea un espacio vectorial, tanto los vectores $c\vec{v}$ y $d\vec{w}$ como __todas sus combinaciones lineales__ $c\vec{v} + d\vec{w}$ __deben estar en el mismo espacio__. El requisito es el mismo para los __subespacios vectoriales__, a los cuales se incluye que deben estar __adentro de un espacio vectorial__ y contener el __vector cero__ $\vec{0}$.

Por ejemplo, en $\mathbb{R}^{3}$ podemos tener los siguientes subespacios:

(1) Todo el conjunto $\mathbb{R}^{3}$.
(2) Un plano al infinito que pasa a través de $\vec{0}$.
(3) Una línea al infinito que pasa a través de $\vec{0}$.
(4) El vector $\vec{0}$.

__Ejercicio.__ \quad En la siguiente imagen tenemos un plano $P$ y una línea $L$, los cuales son subespacios vectoriales de $\mathbb{R}^{3}$.

\newpage

\begin{figure}[hbt!]
\centering
\includegraphics[scale=0.5]{img/class-6/subspace-exer.jpg}
\end{figure}

(a) ¿La unión $P \cup L$ (todos los vectores en $P$ o $L$ o ambos) es un subespacio de $\mathbb{R}^{3}$?
(b) ¿La intersección $P \cap L$ (todos los vectores solo en $P$ y $L$) es un subespacio de $\mathbb{R}^{3}$?

__Solución.__ \quad El conjunto $P \cup L$ de (a) __no es un subespacio de $\mathbb{R}^{3}$__, porque si bien hay lugares donde los vectores de $L$ coinciden en el de $P$, en otros ésto no ocurre. Por ejemplo, si tomamos un vector de $L$ que se encuentra entre dicho subespacio y el de $P$; y otro que está en $P$ y los sumamos, el vector resultante estará afuera de la unión. Por lo tanto, deja de cumplirse que sea un subespacio de $\mathbb{R}^{3}$.

En cuanto a $P \cap L$ de (b), primero podemos observar en el gráfico que dicha intersección o que el único punto que $P$ y $L$ tienen en común es $(0, \ 0, \ 0)$ y, además, sabemos que $\vec{0}$ es un subespacio por sí mismo. En ese sentido, __$P \cap L$ sí es un subespacio de $\mathbb{R}^{3}$__.

De hecho, podemos ir más allá del ejemplo y señalar que __la intersección de dos subespacios cualesquiera también es un subespacio vectorial__.

Por ejemplo, sean $S$ y $T$ dos subespacios vectoriales. Si tomamos dos vectores $\vec{v}$ y $\vec{w}$ de la intersección $S \cap T$, ambos estarán tanto en $S$ como en $T$, por lo tanto el vector $\vec{v} + \vec{w}$ también se encontrará en $S \cap T$. Del mismo modo, si escalamos este último por $c$, el vector $c(\vec{v} + \vec{w})$ estará tanto en $S$ como en $T$ y, por consiguiente, en $S \cap T$. En consecuencia, $S \cap T$ es un subespacio vectorial porque sus combinaciones lineales están en el mismo espacio. Probablemente sea más pequeño que $S$ y $T$, pero lo es.


## 6.2 Espacio Columna (Continuación).

A continuación tenemos una matriz $A$:
$$
A =
\begin{bmatrix}
1 & 1 & 2 \\
2 & 1 & 3 \\
3 & 1 & 4 \\
4 & 1 & 5
\end{bmatrix}
$$
Asumamos que todas las combinaciones lineales de las columnas de $A$ forman un __espacio columna__ $C(A)$, el cual es un subespacio vectorial y, en este caso, de $\mathbb{R}^{4}$, puesto que cada una tiene cuatro componentes^[En ese sentido, podemos generalizar que si las columnas de una matriz $n \times m$ forman un espacio columna donde sus entradas pertenecen a los reales, podemos concluir que su espacio vectorial pariente es $\mathbb{R}^{n}$.].

Debido a que $A$ solo tiene cuatro columnas, es imposible que $C(A)$ pueda llenar todo el espacio vectorial $\mathbb{R}^{4}$. Veámoslo en el siguiente ejemplo.

Digamos que $A$ es la matriz de coeficientes del sistema $Ax = b$, donde:
$$
\begin{aligned}
Ax &= b \\
\begin{bmatrix}
1 & 1 & 2 \\
2 & 1 & 3 \\
3 & 1 & 4 \\
4 & 1 & 5
\end{bmatrix}
\begin{bmatrix}
x_{1} \\ x_{2} \\ x_{3}
\end{bmatrix}
&=
\begin{bmatrix} b_{1} \\ b_{2} \\ b_{3} \\ b_{4} \end{bmatrix}
\\
x_{1} \begin{bmatrix} 1 \\ 2 \\ 3 \\ 4 \end{bmatrix} +
x_{2} \begin{bmatrix} 1 \\ 1 \\ 1 \\ 1 \end{bmatrix} +
x_{3} \begin{bmatrix} 2 \\ 3 \\ 4 \\ 5 \end{bmatrix}
&=
\begin{bmatrix} b_{1} \\ b_{2} \\ b_{3} \\ b_{4} \end{bmatrix}
\end{aligned}
$$
Como vemos, los vectores columna $\vec{b}$ corresponden a todas las combinaciones lineales de $Ax$. Por tanto, una forma de encontrar las soluciones de este sistema (i.e, los componentes de $\vec{x}$), es buscar todos aquellos $\vec{b}$ que resulten de dichas combinaciones. No obstante, esto implica que no serán todos los de $\mathbb{R}^{4}$, sino __solo aquellos que pertenezcan al $C(A)$__. Esto nos muestra que este espacio columna es un subespacio más chico que el espacio vectorial $\mathbb{R}^{4}$.

El ejemplo anterior nos muestra la __relevancia del espacio columna__: Al saber que las columnas de una matriz de coeficientes forman un subespacio vectorial, podemos tener certeza que las __soluciones del sistema__ están en aquel conjunto de vectores que resultan de todas las __combinaciones lineales entre dichas columnas y el vector de incógnitas__.

Debido a la importancia de un espacio columna, siempre es bueno analizarla de forma descriptiva. Estas son características en las que profundizaremos en posteriores clases, pero hagamos el ejercicio ahora. Volvamos a la matriz $A$.

\newpage

$$
A =
\begin{bmatrix}
1 & 1 & 2 \\
2 & 1 & 3 \\
3 & 1 & 4 \\
4 & 1 & 5
\end{bmatrix}
$$
Una característica de $A$, es que su tercera columna corresponde a la suma de las dos anteriores. En dicho caso, decimos que los __vectores columnas__ de $A$ son __linealmente dependientes__.

La __dependencia lineal__ es cuando un vector de un conjunto de ellos __resulta de la combinación lineal de éstos__.

Saber que las columnas de $A$ son linealmente dependientes es relevante para el $C(A)$, porque significa que la tercera columna no añade nada nuevo a este subespacio. Es probable que el producto entre dicha columna y un escalar vaya en la misma dirección y/o sentido de una de las otras dos columnas. En ese sentido, __podemos deshechar__ (_throw away_) __alguna de estas columnas y seguiremos obteniendo el mismo espacio columna $C(A)$__. Por ejemplo:
$$
1 \begin{bmatrix} 1 \\ 2 \\ 3 \\ 4 \end{bmatrix} +
1 \begin{bmatrix} 1 \\ 1 \\ 1 \\ 1 \end{bmatrix} +
0 \begin{bmatrix} 2 \\ 3 \\ 4 \\ 5 \end{bmatrix}
=
\begin{bmatrix} 2 \\ 3 \\ 4 \\ 5 \end{bmatrix}
$$
Los vectores columna de una matriz que son linealmente independientes, también las nombramos como __columnas pivotes__^[No confundir con las entradas pivotes.]. Por lo tanto, las dos primeras columnas (de izq. a der) de $A$ son pivotes, mientras que la tercera no lo es. Es habitual que se descarten aquellos vectores columna que no lo son.

En consecuencia, es posible describir el espacio columna $C(A)$ como un subespacio vectorial de $\mathbb{R}^{4}$ de __dos dimensiones__. También, en próximas clases profundizaremos sobre cómo conocer la dimensión de un subespacio.


## 6.3 Espacio Nulo.

El espacio nulo es un subespacio vectorial que contiene __todos los vectores columna $\vec{x}$ que nos permiten obtener la igualdad $Ax = 0$__. Dicho de otro modo, son todas las soluciones de un sistema de ecuaciones lineales cuyos lados derechos son iguales a cero. Suele denotarse como $N(A)$.

\newpage

Continuemos con el ejemplo anterior, pero ahora establezcamos que $\vec{b}$ es el vector cero.
$$
\begin{aligned}
Ax &= 0 \\
\begin{bmatrix}
1 & 1 & 2 \\
2 & 1 & 3 \\
3 & 1 & 4 \\
4 & 1 & 5
\end{bmatrix}
\begin{bmatrix}
x_{1} \\ x_{2} \\ x_{3}
\end{bmatrix}
&=
\begin{bmatrix} 0 \\ 0 \\ 0 \\ 0 \end{bmatrix}
\end{aligned}
$$
Algo que podemos observar en este caso, es que el espacio nulo (en caso de serlo) es un subespacio vectorial de $\mathbb{R}^{3}$, porque el vector $\vec{x}$ es de tres dimensiones^[También podemos generalizar que si una matriz de coeficientes $A$ es de $n \times m$ con $a_{i, j} \in \mathbb{R}$, entonces el espacio nulo será un subespacio de $\mathbb{R}^{m}$.].

Entonces, la idea es buscar las soluciones de $Ax$ cuyas combinaciones lineales sean el vector cero. Algunos casos para el vector columna $\vec{x}$ de este ejemplo pueden ser:
$$
\begin{bmatrix} 0 \\ 0 \\ 0 \end{bmatrix}, \
\begin{bmatrix} 1 \\ 1 \\ -1 \end{bmatrix}, \
\begin{bmatrix} 9 \\ 9 \\ -9 \end{bmatrix}, \
\cdots
$$
En otras palabras, podemos generalizar que^[De hecho, el $-1$ puede ser cualquiera de los tres componentes, pero siempre solo uno.]:
$$
\begin{bmatrix} x_{1} \\ x_{2} \\ x_{3} \end{bmatrix}
=
c\begin{bmatrix} 1 \\ 1 \\ -1 \end{bmatrix}
\qquad \forall c \in \mathbb{R}
$$
Y, por tanto, el subespacio $N(A)$ es una __línea__ en $\mathbb{R}^{3}$ que pasa por $\langle 0, \ 0, \ 0 \rangle$ y se alarga al infinito en ambos sentidos, similar al que vemos a continuación.

\begin{figure}[hbt!]
\centering
\includegraphics[scale=0.7]{img/class-6/nullspace-example.jpg}
\end{figure}

\newpage

Todo lo anterior podemos generalizarlo, señalando que __las soluciones para $Ax = 0$__ (i.e, los componentes de $\vec{x}$) __siempre producirán un subespacio__, lo cual podemos demostrarlo de la siguiente manera:

Si $Av = 0$ y $Aw = 0$, entonces:
$$
  A(v + w) = 0
$$
En otras palabras, si tanto $\vec{v}$ como $\vec{w}$ están en el subespacio, entonces el vector resultante de su suma $\vec{v} + \vec{w}$ también lo está, y podemos comprobarlo resolviendo la igualdad de arriba.

Recordemos que en la multiplicación entre matrices podemos aplicar la propiedad distributiva. Esto implica que:
$$
\begin{aligned}
  A(v + w) &= 0 \\
  Av + Aw &= 0 \\
  0 + 0 &= 0 \\
  0 &= 0
\end{aligned}
$$
También podemos verlo con un escalar $c$, tal que:
$$
  A(cv) = 0
$$
Y debido a que el producto entre $A$ y $\vec{v}$ está definido, entonces:
$$
\begin{aligned}
  c(Av) &= 0 \\
  c0 &= 0 \\
  0 &= 0
\end{aligned}
$$
Por lo tanto, podemos concluir que el espacio nulo es un subespacio, porque podemos tanto sumarlos entre ellos, calcular el producto de ellos con un escalar y así como obtener la suma de estos últimos, todos los cuales están en el mismo espacio vectorial e incluye al vector cero.

__Ejercicio.__ \quad ¿El vector columna $\vec{x}$ del siguiente sistema de ecuaciones lineales forma un subespacio vectorial?
$$
\begin{bmatrix}
1 & 1 & 2 \\
2 & 1 & 3 \\
3 & 1 & 4 \\
4 & 1 & 5
\end{bmatrix}
\begin{bmatrix}
x_{1} \\ x_{2} \\ x_{3}
\end{bmatrix}
=
\begin{bmatrix} 1 \\ 2 \\ 3 \\ 4 \end{bmatrix}
$$
__Solución.__ \quad Si fuese una matriz más grande, podríamos responder aquello aplicando el método de eliminación, pero como es chica podemos observarlo de inmediato. En síntesis, __no forma un subespacio vectorial__ porque el vector $\vec{x}$ __no incluye al vector cero__. Podemos realizar combinaciones lineales, pero no incluirá a dicho vector.
