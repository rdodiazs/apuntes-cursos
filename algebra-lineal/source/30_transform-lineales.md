---
title: "Clase 30. Transformaciones Lineales y sus Matrices."
subtitle: "Curso 'Linear Algebra' del MIT."
abstract: \noindent En ocasiones, la teoría del álgebra lineal se suele aplicar desde una mirada más abstracta donde, por ejemplo, la ecuación $A\vec{x} = \vec{b}$ se entiende como una función que toma como argumento cualquier $\vec{x}$ de un espacio vectorial y devuelve a $\vec{b}$ del mismo espacio o de uno distinto. En dicho enfoque, este proceso se conoce como **transformación lineal** y acá estudiaremos de qué se trata, cuándo lo es y algunas características.
geometry: margin=1in
lang: es
fontsize: 12pt
header-includes:
  - \usepackage{setspace} \onehalfspacing
  - \usepackage{parskip}
  - \usepackage{amsmath, amssymb}
  - \usepackage{graphicx} \graphicspath{{./img/class-30}}
---


# 1. Introducción a las transformaciones lineales.

Probablemente ya estamos familiarizados con la ecuación matricial $A \vec{x} = \vec{b}$ que podemos representar como la combinación lineal (o ecuación vectorial) $\vec{a} _ {1} x_{1} + \ldots + \vec{a} _ {n} x_{n} = \vec{b}$. Si observamos bien en estas igualdades, $\vec{b}$ está en **función** de $\vec{x}$ en la regla $A \vec{x}$.

Como sabemos, una **función** es una **regla** que asocia cada elemento de un conjunto un único elemento de otro conjunto. Suponga que $f$ es una función que toma cada $x$ de un conjunto $X$ a un único $y$ de $Y$. Aquello se suele denotar como:
$$
  y = f(x)
$$
En este caso, todos los $x \in X$ conforman el **dominio** y todos los $y \in Y$ constituyen el **codominio** de $f$. Por otra parte, cada $y$ que está asignado desde $X$ mediante $f$ se conoce como la **imagen** de dicha función y el conjunto de ellas recibe el nombre de **rango**.

Otra forma de expresar a una función es a partir de la relación entre su dominio y codominio
$$
  f:X \to Y
$$
La expresión de arriba se lee como "$f$ aplicada desde $X$ hasta $Y$" y señala que $f$ es una función que toma todos los elementos de $X$ y devuelve aquellos (no necesariamente todos) que son parte de $Y$.

El concepto de función lo tenemos más familiarizado con escalares, pero también es aplicable a vectores. Por ejemplo, en $A\vec{x} = \vec{b}$ se está indicando que cada vector $\vec{b}$ de un conjunto $B$ está asociado a cada $\vec{x} \in X$ mediante una función que denotaremos como $T(\vec{x}) = A \vec{x}$. Es decir,
$$
  T:X \to B
$$
Eventualmente, el dominio $X$ y el codominio $B$ de la función $T$ pueden ser **espacios vectoriales**. Por otra parte, $\vec{b}$ es la imagen de $\vec{x}$ bajo $T$ y el conjunto de estas también recibe el nombre de rango.

En álgebra lineal, a $T(\vec{x})$ se la suele llamar como **transformación** y el principal interés está en aquellas categorizadas como **lineales**.

Se define a una función $T:V \to W$, con $V$ y $W$ siendo espacios vectoriales, como una **transformación lineal** si sigue las siguientes propiedades:

1. **Aditividad**: $T(\vec{v} + \vec{w}) = T(\vec{v}) + T(\vec{w})$; $\forall \vec{v}, \ \vec{w} \in V$.

2. **Homogeneidad**: $T(c \vec{v}) = c T(\vec{v})$; $\forall \vec{v} \in V$ y con $c =$ constante.

A partir de estas dos propiedades se afirma que las transformaciones lineales **preservan las operaciones de adición vectorial y de multiplicación escalar**. Para entender esta idea, tomemos como ejemplo la propiedad de aditividad de $T:V \to W$.
$$
  T(\vec{v} + \vec{w}) = T(\vec{v}) + T(\vec{w})
$$
El **vector resultante** de aplicar $T$ a $\vec{v} + \vec{w}$ (lado izquierdo) es el mismo de tomar las transformaciones de ambos vectores por separado y luego sumarlas (lado derecho). Es decir, **la adición vectorial se mantiene** cuando $T$ es **lineal**, más allá si usamos la función antes o después de esta operación. En la multiplicación escalar (homogeneidad) ocurre lo mismo.

Cuando $V = W$ en $T:V \to W$, $T$ suele recibir el nombre de **operador lineal**.

Si $T$ es una transformación lineal, de las propiedades de aditividad y homogeneidad se desprenden otras dos más:

3. $T(\vec{0}) = \vec{0}$.

4. $T(c \vec{v} + d \vec{w}) = c T(\vec{v}) + d T(\vec{w})$.

Fácilmente podemos ver que la **propiedad 3** se explica por la de **homogeneidad**.
$$
  T(\vec{0}) = T(0 \cdot \vec{v}) = 0 \cdot T(\vec{v}) = \vec{0}
$$
Entonces, si $T$ es lineal, el vector $T(\vec{x})$ **debe ser** el $\vec{0}$ cuando $\vec{x} = \vec{0}$.

La **propiedad 4** se demuestra a partir de las de **aditividad** y **homogeneidad**.
$$
  T(c \vec{v} + d \vec{w}) = T(c \vec{v}) + T(d \vec{w}) = c T(\vec{v}) + d T(\vec{w})
$$
Por otra parte, la aplicación repetida de la propiedad 4 como la que vemos a continuación:
$$
  T(c \vec{v} _ {1} + \ldots + c \vec{v} _ {k}) = c T(\vec{v} _ {1}) + \ldots + c T(\vec{v} _ {k})
$$
recibe el nombre de **principio de superposición** y es una generalización muy usada en física e ingeniería^[Más información en [https://en.wikipedia.org/wiki/Superposition_principle](https://en.wikipedia.org/wiki/Superposition_principle)].


# 2. Evaluando transformaciones lineales.

En la sección anterior vimos que, al trabajar con vectores, no toda transformación será lineal. Antes debe cumplir con las propiedades de aditividad y homogeneidad. Revisemos algunos ejemplos donde éstas se cumplen y aquellas donde no.

**Ejemplo 1.** Evalúe si la transformación $T:V \to W$ dada por $T(\vec{x}) = \vec{x} + \vec{a}$, con $\vec{a} \neq \vec{0}$ siendo un vector fijo, es lineal o no.

**Solución.** Debido a que $\vec{a}$ es un vector constante, $T(\vec{x})$ a una de tipo **afín** y estas transformaciones **no son lineales**. Lo podemos demostrar a partir de la **propiedad 3**.
$$
  T(\vec{0}) = \vec{0} + \vec{a} = \vec{a}
$$
Como $\vec{a} \neq \vec{0}$, entonces la propiedad 3 no se cumple y puesto que ésta es explicada por la de homogeneidad, se puede concluir que $T(\vec{x})$ no es una transformación lineal.

**Ejemplo 2.** Sea $T:\mathbb{R}^{2} \to \mathbb{R}^{2}$ una transformación dada por
$$
T(\vec{x}) =
\begin{bmatrix}
-x_{2} \\ x_{1}
\end{bmatrix}
$$
Evalúe si $T(\vec{x})$ es o no una transformación lineal.

**Solución.** Primero definamos dos vectores que pertenecen al dominio de $T(\vec{x})$, $\mathbb{R}^{2}$.
$$
\vec{v} =
\begin{bmatrix}
v_{1} \\ v_{2}
\end{bmatrix}
\qquad \qquad
\vec{w} =
\begin{bmatrix}
w_{1} \\ w_{2}
\end{bmatrix}
$$
Luego, apliquemos el principio de aditividad en $T(\vec{x})$ usando a $\vec{v}$ y $\vec{w}$.
$$
\begin{aligned}
T(\vec{v} + \vec{w}) &= T(\vec{v}) + T(\vec{w}) \\
T\left(
\begin{bmatrix}
v_{1} \\ v_{2}
\end{bmatrix}
+
\begin{bmatrix}
w_{1} \\ w_{2}
\end{bmatrix}
\right) &=
T\left(
\begin{bmatrix}
v_{1} \\ v_{2}
\end{bmatrix}
\right)
+
T\left(
\begin{bmatrix}
w_{1} \\ w_{2}
\end{bmatrix}
\right) \\
T\left(
\begin{bmatrix}
v_{1} + w_{1} \\ v_{2} + w_{2}
\end{bmatrix}
\right) &=
\begin{bmatrix}
-v_{2} \\ v_{1}
\end{bmatrix}
+
\begin{bmatrix}
-w_{2} \\ w_{1}
\end{bmatrix} \\
\begin{bmatrix}
-(v_{2} + w_{2}) \\ v_{1} + w_{1}
\end{bmatrix} &=
\begin{bmatrix}
-(v_{2} + w_{2}) \\ v_{1} + w_{1}
\end{bmatrix}
\end{aligned}
$$
Se cumple el principio de aditividad. Veamos si ocurre lo mismo con el de homogeneidad. Para ello, definamos que $k$ es un escalar fijo y que $\vec{x} = \vec{v} \in \mathbb{R}^{2}$.
$$
\begin{aligned}
T(k \vec{v}) &= k T(\vec{v}) \\
T\left(
k \cdot
\begin{bmatrix}
v_{1} \\ v_{2}
\end{bmatrix}
\right) &=
k \cdot
T\left(
\begin{bmatrix}
v_{1} \\ v_{2}
\end{bmatrix}
\right) \\
T\left(
\begin{bmatrix}
k v_{1} \\ k v_{2}
\end{bmatrix}
\right) &=
k \cdot
\begin{bmatrix}
-v_{2} \\ v_{1}
\end{bmatrix} \\
\begin{bmatrix}
-k v_{2} \\ k v_{1}
\end{bmatrix} &=
\begin{bmatrix}
-k v_{2} \\ k v_{1}
\end{bmatrix}
\end{aligned}
$$
También se cumple el principio de homogeneidad, lo que permite concluir que $T(\vec{x})$ **es una transformación lineal**. De hecho, el principio 3 es correcto en este ejemplo.
$$
T(\vec{0}) =
T(0 \cdot \vec{x}) =
0 \cdot T(\vec{x}) =
0 \cdot
\begin{bmatrix}
-x_{2} \\ x_{1}
\end{bmatrix} =
\begin{bmatrix}
0 \\ 0
\end{bmatrix}
$$


# 3. Geometría de las transformaciones lineales.

En las dos secciones previas hemos entendido el álgebra que explica cuándo una transformación es lineal. No obstante, también es importante ver el efecto geométrico. Ambos conocimientos son muy útiles, por ejemplo, en el área de la computación gráfica.

Geométricamente, una transformación que es lineal se explica a partir de dos características:

1. El espacio vectorial de la transformación se **mantiene lineal**.

2. El **origen** sigue estando dado por $\vec{0}$.

Veamos algunos ejemplos gráficos donde cada punto es un vector. Definamos que $\vec{v} \in \mathbb{R}^{2}$ y que $T:\mathbb{R}^{2} \to \mathbb{R}^{2}$ es una transformación $T(\vec{x})$.

Comencemos con la transformación^[El ejemplo lo tomé de un video de [*3Blue1Brown*](https://www.3blue1brown.com) ([https://youtu.be/x1dGfxBdDlM](https://youtu.be/x1dGfxBdDlM)). En un comentario un usuario da una fórmula que es cercana a la del efecto y es la que uso acá.]
$$
T(\vec{x}) =
\vec{x} +
\begin{bmatrix}
\cos(x_{2}) \\ \sin(x_{1})
\end{bmatrix}
$$
Cuando cada $\vec{v} \mapsto T(\vec{x})$,^[Es decir, cuando $T(\vec{x})$ es aplicado a $\vec{v}$. Usaré más seguido esta notación desde ahora.] el conjunto de vectores $T(\vec{v})$ forman una figura curva.

\begin{figure}[hbt!]
\centering
\includegraphics[scale = 0.7]{transf-curv.jpg}
\caption{Izquierda: $\vec{v}$. Derecha: $T(\vec{v})$.}
\end{figure}

En este caso tan solo con su gráfica se puede concluir que $T(\vec{x})$ no es lineal, ya que la característica 1 no se cumple.

Por lo tanto, en $\mathbb{R}^{2}$ el conjunto de vectores de la transformación debe, al menos, formar un plano. Veamos si esto es suficiente en:
$$
T(\vec{x}) = \vec{x} +
\begin{bmatrix}
4 \\ -3
\end{bmatrix}
$$
Esta es una transformación afín y en el Ejemplo 1 (pág. 3) vimos que no es lineal ya que no incluye al $\vec{0}$. Esto se explica geométricamente porque este tipo de funciones generan una **traslación**, como lo vemos en la siguiente gráfica donde $\vec{v} \mapsto T(\vec{x})$.

\begin{figure}[hbt!]
\centering
\includegraphics[scale = 0.7]{transf-afin.jpg}
\caption{Izquierda: $\vec{v}$. Derecha: $T(\vec{v})$.}
\end{figure}

Se cumple la característica 1, pero no la segunda porque ningún vector $T(\vec{v})$ se mantiene en el origen. Para ello, el vector constante de esta transformación debería ser el $\vec{0}$.

Un caso donde se cumplen las características 1 y 2 son las **rotaciones realizadas desde el origen**. Esto lo vimos en el Ejemplo 2 (págs. 3-4), cuyo efecto es girar los vectores en $\pi/2$ radianes.
$$
T(\vec{x}) =
\begin{bmatrix}
x_{1} \cos(\pi/2) - x_{2} \sin(\pi/2) \\
x_{1} \sin(\pi/2) + x_{2} \cos(\pi/2)
\end{bmatrix} =
\begin{bmatrix}
-x_{2} \\ x_{1}
\end{bmatrix}
$$
Cuando $\vec{v} \mapsto T(\vec{x})$, los $T(\vec{v})$ resultantes son los $\vec{v}$ rotados de forma perpendicular con respecto al origen y en sentido contrario a las agujas del reloj.

\newpage

\begin{figure}[hbt!]
\centering
\includegraphics[scale = 0.7]{transf-rotacion.jpg}
\caption{Izquierda: $\vec{v}$. Derecha: $T(\vec{v})$.}
\end{figure}


# 4. Matriz de una transformación lineal.

En la primera sección señalamos que la ecuación matricial
$$
  \vec{b} = A \vec{x}
$$
puede ser entendida como una función. Para obtener un $\vec{b}$ determinado tomamos algún $\vec{x}$ y lo **transformamos** mediante $A$. Siguiendo la notación usada hasta ahora, podemos decir que:
$$
\vec{b} = T(\vec{x})
$$
donde
$$
  T(\vec{x}) = A \vec{x}
$$
En esta sección veremos, probablemente, las dos ideas claves de esta clase:

1. Cualquier operación $A \vec{x}$, también llamada como **producto matriz-vector**, es una **transformación lineal** que recibe el nombre de **transformación matricial**.

2. Toda transformación $T$ que **es lineal** puede ser **explicada por una transformación matricial**, donde la matriz proviene de una base cualquiera tomada de su dominio.

Ambas ideas se complementan entre sí y son relevantes porque una de las principales tareas al trabajar con transformaciones lineales es **buscar una matriz que la explique**.

## 4.1 Toda transformación matricial es una transformación lineal.

Como acabamos de ver, la operación $A \vec{x}$ recibe el nombre de **producto matriz-vector** y se caracteriza por tener las siguientes propiedades:

1. $A \cdot (\vec{v} + \vec{w}) = A \vec{v} + A \vec{w}$

2. $A \cdot (k \vec{v}) = k \cdot (A \vec{v})$

donde $\vec{v}$, $\vec{w} \in \mathbb{R}^{m}$; $A \in \mathbb{R}^{n \times m}$ y $k \in \mathbb{R}$ (i.e, $k$ es un escalar).

La propiedad 1 podemos demostrarla algebraicamente como sigue:
$$
\begin{aligned}
A \cdot (\vec{v} + \vec{w}) &=
\begin{bmatrix}
  &  &  & \\
\vec{a} _ {1} & \vec{a} _ {2} & \cdots & \vec{a} _ {m} \\
  &  &  &
\end{bmatrix} \cdot
\begin{bmatrix}
v_{1} + w_{1} \\
v_{2} + w_{2} \\
\vdots \\
v_{m} + w_{m}
\end{bmatrix} \\
&= (v_{1} + w_{1}) \vec{a} _ {1} + (v_{2} + w_{2}) \vec{a} _ {2} + \cdots + (v_{m} + w_{m}) \vec{a} _ {m} \\
&= \vec{a} _ {1} v_{1} + \vec{a} _ {1} w_{1} + \vec{a} _ {2} v_{2} + \vec{a} _ {2} w_{2} + \cdots + \vec{a} _ {m} v_{m} + \vec{a} _ {m} w_{m} \\
&= (\vec{a} _ {1} v_{1} + \vec{a} _ {2} v_{2} + \cdots \vec{a} _ {m} v_{m}) + (\vec{a} _ {1} w_{1} + \vec{a} _ {2} w_{2} + \cdots \vec{a} _ {m} w_{m}) \\
A \cdot (\vec{v} + \vec{w}) &= A \vec{v} + A \vec{w}
\end{aligned}
$$
De modo similar podemos demostrar la propiedad 2.
$$
\begin{aligned}
A \cdot (k \vec{v}) &=
\begin{bmatrix}
  &  &  & \\
\vec{a} _ {1} & \vec{a} _ {2} & \cdots & \vec{a} _ {m} \\
  &  &  &
\end{bmatrix} \cdot
\begin{bmatrix}
k \cdot v_{1} \\ k \cdot v_{2} \\ \vdots \\ k \cdot v_{m}
\end{bmatrix} \\
&= (k \cdot v_{1}) \vec{a} _ {1} + (k \cdot v_{2}) \vec{a} _ {2} + \cdots + (k \cdot v_{m}) \vec{a} _ {m} \\
&= k \cdot (v_{1} \vec{a} _ {1} + v_{2} \vec{a} _ {2} + \cdots + v_{m} \vec{a} _ {m}) \\
A \cdot (k \vec{v}) &= k \cdot (A \vec{v})
\end{aligned}
$$
Usemos las dos propiedades del producto matriz-vector para demostrar que
$$
  T(\vec{x}) = A \vec{x}
$$
es efectivamente una **transformación lineal**.

**Demostración 1.** Sean $\vec{v}$ y $\vec{w} \in \mathbb{R}^{m}$; $A \in \mathbb{R}^{n \times m}$ y $T:\mathbb{R}^{m} \to \mathbb{R}^{n}$ es una transformación dada por $T(\vec{x}) = A \vec{x}$. Comencemos comprobando si se cumple la propiedad de aditividad.
$$
  T(\vec{v} + \vec{w}) = A \cdot (\vec{v} + \vec{w})
$$
A partir de la propiedad 1 del producto vector matriz, el lado derecho de la igualdad de arriba podemos expresarla como:
$$
  T(\vec{v} + \vec{w}) = A \vec{v} + A \vec{w}
$$
Se ha preservado la suma vectorial en el lado derecho de la igualdad, lo que significa que **se cumple la propiedad de aditividad**.

Ahora veamos si se cumple la propiedad de homogeneidad en la transformación $T(\vec{x}) = A \vec{x}$.
$$
  T(k \vec{v}) = A \cdot (k \vec{v})
$$
Usando la propiedad 2 del producto matriz-vector en el lado derecho de la igualdad nos lleva a que:
$$
  T(k \vec{v}) = k \cdot (A \vec{v})
$$
La multiplicación escalar se mantiene en la transformación, por lo que también **se cumple la propiedad de homogeneidad**.

Por lo tanto, la transformación $T(\vec{x}) = A \vec{x}$ **sí es una transformación lineal**. Formalmente, recibe el nombre de **Transformación Matricial**.

## 4.2 Transformaciones lineales explicadas por transformaciones matriciales.

Ahora tomemos el camino reverso al visto en la sección 4.1: Veamos si una transformación lineal es una transformación matricial.

**Demostración 2.** Considere a un vector $\vec{x} \in \mathbb{R}^{m}$ definido como la combinación lineal entre sus componentes, $x_{1}, \ \ldots, \ x_{m}$, y los vectores de una **base**^[Conjunto de vectores linealmente independientes que forman un (sub)espacio vectorial.] $\{\vec{a} _ {1}, \ \ldots, \ \vec{a} _ {m}\} \in \mathbb{R}^{n}$.
$$
  \vec{x} = x_{1} \vec{a} _ {1} + x_{2} \vec{a} _ {2} + \cdots + x_{m} \vec{a} _ {m}
$$
Luego, sea $T:\mathbb{R}^{n} \to \mathbb{R}^{m}$ una **transformación lineal**. Al aplicarla a $\vec{x}$, por las propiedades de aditividad y homogeneidad obtenemos lo siguiente:
$$
\begin{aligned}
T(\vec{x}) &= T(x_{1} \vec{a} _ {1} + x_{2} \vec{a} _ {2} + \cdots + x_{m} \vec{a} _ {m}) \\
           &= T(x_{1} \vec{a} _ {1}) + T(x_{2} \vec{a} _ {2}) + \cdots + T(x_{m} \vec{a} _ {m}) \\
           &= x_{1} T(\vec{a} _ {1}) + x_{2} T(\vec{a} _ {2}) + \cdots + x_{m} T(\vec{a} _ {m})
\end{aligned}
$$
Debido a que el lado derecho es una combinación lineal, podemos expresarlo como un **producto matriz-vector**.
$$
T(\vec{x}) =
\begin{bmatrix}
  &  &  &  \\
T(\vec{a} _ {1}) & T(\vec{a} _ {2}) & \cdots & T(\vec{a} _ {m}) \\
  &  &  &
\end{bmatrix} \cdot
\begin{bmatrix}
x_{1} \\ x_{2} \\ \vdots \\ x_{m}
\end{bmatrix} =
A \vec{x}
$$
Como vemos, la **transformación lineal** $T$ puede ser expresada como una **transformación matricial**, pero debemos tener en cuenta que $A \in \mathbb{R}^{n \times m}$ es una **matriz única** porque es construida a partir de una **base** que fue **elegida arbitrariamente**.

La matriz $A$ almacena la información del efecto que genera la transformación lineal sobre un espacio vectorial (i.e, su dominio). Con ella, podemos tener un **conocimiento numérico de cómo se comporta**.

En ese sentido, si queremos graficar las imagenes de $T$, podemos expresarla como $A \vec{x}$ donde la **posición** de estos vectores resultantes estará determinado por la base que elijamos.

Otra característica de la matriz $A$ es que al ser formada por una base, su rango siempre será de columna o fila completo. Lo mismo ocurre si es cuadrada (*full rank*), lo que implica que **su inversa existirá**.

Así, a partir de lo estudiado en las secciones 4.1 y 4.2 se puede afirmar que:

> *Toda transformación matricial es una transformación lineal y toda transformación lineal puede ser expresada como una transformación matricial.*

## 4.3 Calculando las matrices de una transformación lineal.

Veamos algunos ejemplos donde obtenemos la matriz de una transformación lineal. Para ello, siempre necesitamos información sobre:

1. La transformación lineal.

2. Las bases tanto de los vectores del dominio como las imagenes.

Si no conocemos las bases, es común usar **vectores canónicos** para construirlas. Estos se caracterizan por tener un componente igual a $1$ y el resto son ceros.

**Ejemplo 3.** Considere la transformación lineal $T:\mathbb{R}^{2} \to \mathbb{R}^{3}$ dada por:
$$
T(\vec{x}) =
\begin{bmatrix}
2x_{1} + x_{2} \\ x_{1} - 3x_{2} \\ -x_{1} + x_{2}
\end{bmatrix}
$$
Busque una matriz para $T(\vec{x})$.

**Solución.** Como no tenemos información sobre las bases para la matriz de $T$, usemos vectores canónicos para construirla. En la demostración de la sección 4.2 vimos que éstos deben pertenecer al dominio y su cantidad debe ser igual a la dimensión de los vectores del codominio. Teniendo esto en consideración, definamos que:
$$
\vec{e} _ {1} =
\begin{bmatrix}
1 \\ 0
\end{bmatrix} \qquad \qquad
\vec{e} _ {2} =
\begin{bmatrix}
0 \\ 1
\end{bmatrix}
$$
es la base del dominio. En ese sentido, la de las imagenes es:
$$
T(\vec{e} _ {1}) =
\begin{bmatrix}
2(1) + 0 \\ 1 - 3(0) \\ -1 + 0
\end{bmatrix} =
\begin{bmatrix}
2 \\ 1 \\ -1
\end{bmatrix} \qquad \qquad
T(\vec{e} _ {2}) =
\begin{bmatrix}
2(0) + 1 \\ 0 - 3(1) \\ 0 + 1
\end{bmatrix} =
\begin{bmatrix}
1 \\ -3 \\ 1
\end{bmatrix}
$$
Por lo tanto, la matriz $A \in \mathbb{R}^{2 \times 3}$ de la transformación lineal $T(\vec{x})$ es la siguiente.
$$
A =
\begin{bmatrix}
2 & 1 \\
1 & -3 \\
-1 & 1
\end{bmatrix}
$$
En otras palabras, podemos expresar a $T(\vec{x})$ como la transformación matricial:
$$
T(\vec{x}) = A \vec{x} =
\begin{bmatrix}
2 & 1 \\
1 & -3 \\
-1 & 1
\end{bmatrix} \cdot
\begin{bmatrix}
x_{1} \\ x_{2}
\end{bmatrix}
$$
**Ejemplo 4.** Sean
$$
\vec{e} _ {1} =
\begin{bmatrix}
1 \\ 0
\end{bmatrix} \qquad \qquad
\vec{e} _ {2} =
\begin{bmatrix}
0 \\ 1
\end{bmatrix}
$$
los vectores de una base del dominio de la transformación lineal $T:\mathbb{R}^{2} \to \mathbb{R}^{3}$, donde
$$
T(\vec{e} _ {1}) =
\begin{bmatrix}
5 \\ -7 \\ 2
\end{bmatrix}
\qquad \qquad
T(\vec{e} _ {2}) =
\begin{bmatrix}
-3 \\ 8 \\ 0
\end{bmatrix}
$$
Encuentre la fórmula de $T$ para la imagen de un vector arbitrario $\vec{x} \in \mathbb{R}^{2}$.

**Solución.** Recordemos que en la demostración 2 comenzamos definiendo un vector arbitrario como la combinación lineal entre sus componentes y los vectores de una base. Podemos hacer lo mismo acá para definir a $\vec{x} \in \mathbb{R}^{2}$.
$$
\vec{x} = x_{1} \vec{e} _ {1} + x_{2} \vec{e} _ {2} =
x_{1}
\begin{bmatrix}
1 \\ 0
\end{bmatrix} +
x_{2}
\begin{bmatrix}
0 \\ 1
\end{bmatrix} =
\begin{bmatrix}
x_{1} \\ x_{2}
\end{bmatrix}
$$
Luego, a partir de $T(\vec{e} _ {1})$ y $T(\vec{e} _ {2})$ construyamos la matriz.
$$
A =
\begin{bmatrix}
5 & -3 \\
-7 & 8 \\
2 & 0
\end{bmatrix}
$$
Finalmente, expresemos a $T$ en términos de un vector arbitrario $\vec{x}$ como una transformación matricial y así obtener la fórmula.
$$
T(\vec{x}) = A \vec{x} =
\begin{bmatrix}
5 & -3 \\
-7 & 8 \\
2 & 0
\end{bmatrix} \cdot
\begin{bmatrix}
x_{1} \\ x_{2}
\end{bmatrix} =
\begin{bmatrix}
5x_{1} - 3x_{2} \\
-7x_{1} + 8x_{2} \\
2x_{1}
\end{bmatrix}
$$

## 4.4 Usando matrices diagonales para una transformación lineal.

En la sección anterior estudiamos cómo encontrar las matrices de una transformación lineal. A lo largo de este curso hemos estudiado a distintos tipos de ellas, por lo tanto podemos traer dicho conocimiento a este contexto para decidir cuál sería la mejor opción.

Las **matrices diagonales** son las que entregan mayor facilidad a la hora de realizar cálculos numéricos y en esta última sección nos centraremos en ellas como la mejor alternativa. Al trabajar con transformaciones lineales, tenemos que buscar una base que nos permita construirlas y si hacemos memoria, recordaremos dos procesos para encontrar este tipo de arreglos:

1. **El teorema de descomposición espectral**, $A = S \Lambda S^{-1}$.

2. **La descomposición en valores singulares**, $A = U \Sigma V^{T}$.

En ambos métodos obtenemos matrices diagonales: la de eigenvalores ($\Lambda$) y la de valores singulares ($\Sigma$), mientras que las **bases** provienen de los eigenvectores y los vectores singulares (izquierdos y derechos) puestos que son linealmente independientes y generan dichas matrices.

Por lo tanto, la matriz $\Lambda$ podemos buscarla para una transformación lineal $T:\mathbb{R}^{n} \to \mathbb{R}^{n}$, mientras que en el caso de $\Sigma$ cuando $T:\mathbb{R}^{n} \to \mathbb{R}^{m}$ con $n \neq m$.

Ahora, si con una $T:\mathbb{R}^{n} \to \mathbb{R}^{n}$ obtenemos una matriz cuadrada con $s$ eigenvalores repetidos, significa que tendremos $n - s$ eigenvectores linealmente independientes. En ese caso, podemos optar por una tercera opción que es buscar los **bloques** de una **matriz en forma Jordan** y usar dicha base con estos objetos.

