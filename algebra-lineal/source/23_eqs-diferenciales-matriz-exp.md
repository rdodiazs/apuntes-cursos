---
title: "Clase 23. Ecuaciones Diferenciales y la Matriz Exponencial."
subtitle: "Curso ‘Linear Algebra’ del MIT."
abstract: \noindent La potencia de una matriz, así como sus eigenvalores y eigenvectores, pueden llegar a ser muy útiles para resolver __sistemas de ecuaciones diferenciales__. En esta clase nos centraremos en aquellas de primer orden y nos encontraremos con una nueva matriz llamada __Matriz exponencial__, la cual es parte de la solución de dicho sistema.
geometry: margin=1in
lang: es
fontsize: 12pt
header-includes:
  - \usepackage{setspace} \onehalfspacing
  - \usepackage{parskip}
  - \usepackage{amsmath, amssymb}
---


# 1. Ecuaciones Diferenciales (*Differential Equations*).

Las ecuaciones diferenciales son aquellas que involucran a una(s) función(es) y sus **derivadas**. La **solución general** corresponde a una familia de funciones que difieren por una constante y que satisfacen a la derivada de la ecuación original.

Por ejemplo, resolvamos la siguiente ecuación diferencial
$$
  \frac{dy}{dx} = 2xy
$$
usando el método de separación de variables^[Existen mejores técnicas, pero usaré ésta porque es la que manejo hasta ahora. En los apuntes sobre integrales del curso de Cálculo de una Variable hay más detalles de ella.]. Para ello, multipliquemos por $(1/y)$ y por $dx$, lo que nos lleva a lo siguiente:
$$
  \frac{1}{y} dy = 2x dx
$$
Luego, integremos esta ecuación.
$$
\begin{aligned}
  \int \frac{1}{y} dy &= \int 2x dx \\
  \ln(|y|) &= x^{2} + C
\end{aligned}
$$
Al usar la definición del logaritmo natural para encontrar a $x$, obtenemos la siguiente solución general.
$$
  y = \exp(x^{2} + C) = \exp(x^{2}) \cdot \exp(C) = C \cdot \exp(x^{2})
$$
Para comprobar que esta solución satisface a la ecuación original, simplemente la derivamos.
$$
  \frac{dy}{dx} = (2x) \cdot C \exp(x^{2}) = 2xy
$$
Si queremos obtener una **solución particular** de una ecuación diferencial, debemos definir una **condición inicial** la cual es un punto $(x_{0}, y_{0})$ por donde pasa la curva de una de las ecuaciones. Para ello, lo reemplazamos en ella para conocer el valor de $C$ en aquel lugar y, posteriormente, se sustituye la constante en la ecuación general.

Por ejemplo, supongamos que nos interesa una solución de $y = C \cdot \exp(x^{2})$ que pase por $(2, \ 2)$. Primero, hacemos el reemplazo en esta ecuación para obtener a $C$.
$$
\begin{aligned}
  2 &= C \cdot \exp(2^{2}) \\
  \frac{2}{\exp(4)} &= C \\
  2 \cdot \exp(-4) &= C
\end{aligned}
$$
Luego, reemplazamos a $C$ en la solución general para conocer una particular que pasa por $(2, \ 2)$.
$$
  y = (2 \cdot \exp(-4)) \cdot \exp(x^{2}) = 2 \cdot \exp(x^{2} - 4)
$$
En esta ocasión nos concentraremos en **ecuaciones diferenciales lineales de primer orden**, las cuales siguen la siguiente forma:
$$
  P(x) \frac{dy}{dx} + Q(x)y = G(x); \; (P(x) \neq 0)
$$
donde:

1. **Lineal** $\rightarrow$ Puede ser escrita como una combinación lineal de la derivada de $y$.

2. **Primer orden** $\rightarrow$ La derivada mayor es de primer orden.

En particular, estaremos enfocados en **sistemas** de ecuaciones diferenciales lineales de primer orden **no homogéneas y con coeficientes constantes**. En otras palabras, donde $P(x)$, $Q(x)$ y $G(x)$ son constantes, sumado a que $G(x) \neq 0$ (i.e, no homogénea).

## 1.1 Sistemas de ecuaciones diferenciales lineales de primer orden.

En esta clase nuestro interés se centra en la siguiente ecuación diferencial:
$$
  \frac{du}{dt} = u
$$
la cual tiene como solución general:
$$
  u(t) = C \cdot \exp(t)
$$
Esta ecuación se caracteriza por el hecho de que, al multiplicar el lado derecho por un factor $a$, la variable $t$ de la solución general aumenta por el mismo valor.
$$
  \frac{du}{dt} = au \Rightarrow u(t) = C \cdot \exp(at)
$$
Ahora veamos el siguiente **sistema de ecuaciones diferenciales lineales de primer orden con coeficientes constantes**.
$$
\begin{aligned}
\frac{du_{1}}{dt} &= a_{1,1} u_{1} + a_{1,2} u_{2} + \cdots + a_{1,n} u_{n} \\
\frac{du_{2}}{dt} &= a_{2,1} u_{1} + a_{2,2} u_{2} + \cdots + a_{2,n} u_{n} \\
\vdots \\
\frac{du_{n}}{dt} &= a_{n,1} u_{1} + a_{n,2} u_{2} + \cdots + a_{n,n} u_{n}
\end{aligned}
$$
Es posible escribir este sistema en forma matricial, estableciendo que:
$$
\frac{d\vec{u}}{dt} =
\begin{bmatrix}
\frac{du_{1}}{dt} \\
\frac{du_{2}}{dt} \\
\vdots \\
\frac{du_{n}}{dt}
\end{bmatrix}; \qquad
A =
\begin{bmatrix}
a_{1,1} & a_{1,2} & \cdots & a_{1,n} \\
a_{2,1} & a_{2,2} & \cdots & a_{2,n} \\
\vdots & \vdots & \ddots & \vdots \\
a_{n,1} & a_{n,2} & \cdots & a_{n,n}
\end{bmatrix}; \qquad
\vec{u} =
\begin{bmatrix}
u_{1} \\
u_{2} \\
\vdots \\
u_{n}
\end{bmatrix}
$$
Por lo tanto, el sistema de ecuaciones diferenciales inicial podemos reescribirlo del siguiente modo:
$$
  \frac{d\vec{u}}{dt} = A \vec{u}
$$
Como se puede apreciar, es similar a la ecuación diferencial $u'(t) = au(t)$ que vimos antes y su solución general también es parecida a la de ella:
$$
  \vec{u} = \exp(\lambda t) \cdot \vec{x}
$$
En este caso, $\lambda$ es el eigenvalor de $A$ y $\vec{x}$ su eigenvector^[En esta clase nos centraremos solo en sistemas cuadrados, de manera que $A$ siempre será de $n \times n$.]. Podemos comprobarlo al reemplazar al vector $\vec{u}$ en la ecuación diferencial.
$$
\begin{aligned}
  \frac{d\vec{u}}{dt} &= A \vec{u} \\
  \frac{d}{dt} \exp(\lambda t) \cdot \vec{x} &= A \cdot \exp(\lambda t) \cdot \vec{x}
\end{aligned}
$$
El eigenvector $\vec{x}$ consiste de entradas constantes, de manera que podemos dejarlo de lado en la derivada del lado izquierdo de la ecuación diferencial.
$$
\begin{aligned}
  \lambda \cdot \exp(\lambda t) \cdot \vec{x} &= A \cdot \exp(\lambda t) \cdot \vec{x} \\
  \lambda \vec{x} &= A \vec{x}
\end{aligned}
$$
Que hayamos obtenido la definición del eigenvalor y eigenvector de una matriz en esta ecuación diferencial no es una coincidencia. Su origen proviene, justamente, para resolver sistemas cuadrados del tipo $\vec{u} \ '(t) = A \vec{u}(t)$.

Por otra parte, esto nos muestra que es posible llevar un problema de ecuaciones diferenciales a uno de álgebra lineal, el cual además permite facilitar el cálculo de sus soluciones.

**Ejemplo 1**. Calcule las soluciones particulares del siguiente sistema de ecuaciones diferenciales para $\vec{u}(0) = \begin{bmatrix} 1 \\ 0 \end{bmatrix}$.
$$
\begin{aligned}
\frac{du _ {1}}{dt} &= - u _ {1} + 2 u _ {2} \\
\frac{du _ {2}}{dt} &= u _ {1} - 2 u _ {2}
\end{aligned}
$$
**Solución**. Comencemos pasando las constantes de los lados derechos de las ecuaciones a una matriz $A$ de coeficientes.
$$
A =
\begin{bmatrix}
-1 & 2 \\
1 & -2
\end{bmatrix}
$$
Si nos damos cuenta, el $\det(A) = 0$. Es decir, la matriz $A$ es singular y, por consiguiente, uno de sus eigenvalores es $\lambda_{1} = 0$. En ese sentido, el otro corresponde a $\lambda_{2} = \mathrm{tr}(A) = -3$. Lo anterior podemos comprobarlo al calcular las raíces del polinomio característico.

Debido a que $\lambda_{1} \neq \lambda_{2}$, podemos dar por sentado que cada eigenvalor tiene su eigenvector asociado y, en consecuencia, que estos últimos son linealmente independientes entre sí.

Calculemos al eigenvector $\vec{x} _ {1}$ el cual tiene asociado a $\lambda_{1} = 0$.
$$
\begin{aligned}
  (A - I \lambda_{1}) \vec{x} _ {1} &= \vec{0} \\
  A \vec{x} _ {1} &= \vec{0}
\end{aligned}
$$
Es claro que, al pasar a la matriz $A \to U$, la segunda entrada pivote será igual a cero.
$$
A =
\begin{bmatrix}
-1 & 2 \\
1 & -2
\end{bmatrix}
\Longrightarrow
\begin{bmatrix}
1 & -2 \\
0 & 0
\end{bmatrix} =
U
$$
Por lo tanto:
$$
\begin{aligned}
U \vec{x} _ {1} &= \vec{0} \\
\begin{bmatrix}
1 & -2 \\
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
Al conocer a la entrada $x_{1}$ podemos concluir que el eigenvector $\vec{x} _ {1}$ es:
$$
\vec{x} _ {1} =
\begin{bmatrix}
2 \\ 1
\end{bmatrix}
$$
Continuemos con el eigenvalor $\vec{x} _ {2}$ de $\lambda_{2} = -3$.
$$
\begin{aligned}
(A - I \lambda_{2}) \vec{x} _ {2} &= \vec{0} \\
\begin{bmatrix}
2 & 2 \\
1 & 1
\end{bmatrix} \cdot
\begin{bmatrix}
x _ {1} \\ x _ {2}
\end{bmatrix} &=
\begin{bmatrix}
0 \\ 0
\end{bmatrix}
\end{aligned}
$$
Al pasar a $(A - I \lambda_{2}) \to U$, obtenemos que:
$$
(A - I \lambda_{2}) =
\begin{bmatrix}
2 & 2 \\
1 & 1
\end{bmatrix}
\Longrightarrow
\begin{bmatrix}
1 & 1 \\
0 & 0
\end{bmatrix} =
U
$$
Por lo tanto, al calcular el espacio nulo de $U$ o, en otras palabras, al buscar una base para el eigenespacio en:
$$
\begin{aligned}
U \vec{x} _ {2} &= \vec{0} \\
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
el eigenvector $\vec{x} _ {2}$ corresponde a:
$$
\vec{x} _ {2} =
\begin{bmatrix}
-1 \\ 1
\end{bmatrix}
$$
En ese sentido, hemos obtenido un **conjunto de soluciones** de $\vec{u}$.
$$
\begin{aligned}
\vec{u} _ {1} &=
  \vec{x} _ {1} \exp(\lambda_{1}t) =
  \begin{bmatrix}
  2 \\ 1
  \end{bmatrix}
  \exp(0t) =
  \begin{bmatrix}
  2 \\ 1
  \end{bmatrix} \\
\vec{u} _ {2} &=
  \vec{x} _ {2} \exp(\lambda_{2}t) =
  \begin{bmatrix}
  -1 \\ 1
  \end{bmatrix}
  \exp(-3t)
\end{aligned}
$$
Cuando tenemos un conjunto de soluciones, la **solución general** de un sistema de ecuaciones diferenciales se rige bajo el **principio de superposición**. En otras palabras, $\vec{u}$ corresponde a una combinación lineal de dicho conjunto.
$$
\vec{u}(t) =
c _ {1} \cdot
\begin{bmatrix}
2 \\ 1
\end{bmatrix} +
c _ {2} \cdot
\begin{bmatrix}
-1 \\ 1
\end{bmatrix}
\exp(-3t)
$$
Nuestro propósito es buscar una **solución particular** del sistema a partir de $\vec{u}(0) = \begin{bmatrix} 1 \\ 0 \end{bmatrix}$. Aquello lo hacemos al igual que con una ecuación diferencial: buscamos los valores de las constantes $c _ {1}$ y $c _ {2}$ para los cuales se cumple la condición inicial.

Así, en $t = 0$ tenemos que:
$$
\begin{bmatrix}
1 \\ 0
\end{bmatrix} =
c _ {1} \cdot
\begin{bmatrix}
2 \\ 1
\end{bmatrix} +
c _ {2} \cdot
\begin{bmatrix}
-1 \\ 1
\end{bmatrix}
\exp(-3 \cdot 0) =
c _ {1} \cdot
\begin{bmatrix}
2 \\ 1
\end{bmatrix} +
c _ {2} \cdot
\begin{bmatrix}
-1 \\ 1
\end{bmatrix}
$$
Podemos reescribir esta ecuación como
$$
\begin{bmatrix}
1 \\ 0
\end{bmatrix} =
\begin{bmatrix}
2 & -1 \\
1 & 1
\end{bmatrix} \cdot
\begin{bmatrix}
c _ {1} \\ c _ {2}
\end{bmatrix}
$$
La **matriz** que vemos en la ecuación de arriba corresponde a la de **eigenvectores** $S$. Como $\vec{x} _ {1}$ y $\vec{x} _ {2}$ son linealmente independientes, podemos dar por asegurado que existe $S^{-1}$. Para conocerla, usemos el método de Gauss-Jordan.
$$
\left[
\begin{array}{c c |c c}
2 & -1 & 1 & 0 \\
1 & 1 & 0 & 1
\end{array}
\right]
\Longrightarrow
\left[
\begin{array}{c c|c c}
1 & 0 & 1/3 & 1/3 \\
0 & 1 & -1/3 & 2/3
\end{array}
\right]
\Longrightarrow
S^{-1} =
\begin{bmatrix}
1/3 & 1/3 \\
-1/3 & 2/3
\end{bmatrix}
$$
Luego, multipliquemos a $S^{-1}$ a la izquierda de ambos lados de la ecuación.
$$
\begin{aligned}
\begin{bmatrix}
1/3 & 1/3 \\
-1/3 & 2/3
\end{bmatrix} \cdot
\begin{bmatrix}
1 \\ 0
\end{bmatrix} &=
\begin{bmatrix}
1/3 & 1/3 \\
-1/3 & 2/3
\end{bmatrix} \cdot
\begin{bmatrix}
2 & -1 \\
1 & 1
\end{bmatrix} \cdot
\begin{bmatrix}
c _ {1} \\ c _ {2}
\end{bmatrix} \\
\begin{bmatrix}
1/3 \\ -1/3
\end{bmatrix} &=
\begin{bmatrix}
c _ {1} \\ c _ {2}
\end{bmatrix}
\end{aligned}
$$
En otras palabras:
$$
  c _ {1} = \frac{1}{3} \qquad \text{ y } \qquad c _ {2} = - \frac{1}{3}
$$
Por consiguiente, al reemplazar a $c _ {1}$ y $c _ {2}$ en la solución general, obtenemos que para $t = 0$ la **solución particular** es:
$$
\begin{aligned}
\vec{u}(t) &=
\frac{1}{3} \cdot
\begin{bmatrix}
2 \\ 1
\end{bmatrix} +
\left(-\frac{1}{3}\right) \cdot
\begin{bmatrix}
-1 \\ 1
\end{bmatrix} \cdot
\exp(-3t) \\
&=
\begin{bmatrix}
2/3 \\ 1/3
\end{bmatrix} +
\begin{bmatrix}
1/3 \\ -1/3
\end{bmatrix} \cdot
\exp(-3t)
\end{aligned}
$$

# 2. Comportamiento de la solución de una ecuación diferencial.

En una ecuación diferencial estamos calculando las funciones que nos permiten obtener una tasa de cambio continua/instantánea conocida. En ese sentido, al obtener una solución podríamos estar interesados en evaluar su comportamiento en determinados contextos.

Analicemos la solución general del ejemplo anterior. Para ello, asumamos que $t$ es una variable de tiempo, de manera que $t \geq 0$ siempre.
$$
\vec{u}(t) =
\begin{bmatrix}
2/3 \\ 1/3
\end{bmatrix} +
\begin{bmatrix}
1/3 \\ -1/3
\end{bmatrix} \cdot
\exp(-3t)
$$
Hasta ahora sabemos qué valores toma el sistema al inicio o en $t = 0$. En forma escalar, los valores de las dos funciones son $u_{1}(0) = 1$ y $u_{2}(0) = 0$.
$$
\begin{aligned}
  u_{1}(0) &= \frac{2}{3} + \frac{1}{3} \exp(-3 \cdot 0) = 1 \\
  u_{2}(0) &= \frac{1}{3} - \frac{1}{3} \exp(-3 \cdot 0) = 0
\end{aligned}
$$
Por otra parte, como las funciones de la solución general van en constante cambio, sería interesante saber cómo se comportan a medida que el tiempo $t \to \infty$. Aquello podemos observarlo al evaluar el límite de $\exp(-3t)$, donde
$$
  \lim_{t \to \infty} \exp(-3t) = 0
$$
Por lo tanto:
$$
\vec{u}(\infty) \approx
\begin{bmatrix}
2/3 \\ 1/3
\end{bmatrix} +
\begin{bmatrix}
1/3 \\ -1/3
\end{bmatrix} \cdot
0 =
\begin{bmatrix}
2/3 \\ 1/3
\end{bmatrix}
$$
En "lenguaje" de ecuaciones diferenciales decimos que el sistema alcanza un **estado estable** (*steady state*) a medida que tiende al infinito y éste corresponde al vector $\begin{bmatrix} 2/3 \\ 1/3 \end{bmatrix}$.

## 2.1 Información dada por los Eigenvalores.

Los **eigenvalores** de $A$ también nos entregan información sobre el comportamiento que puede tener la solución general del sistema de ecuaciones diferenciales.

**1. Estabilidad.** Esta condición corresponde a los valores para los cuales $u(t) \to 0$ para cualquier condición inicial. Aquello se cumple cuando $\exp(\lambda t) \to 0$ y esto sucede en la siguiente situación:
$$
  \operatorname{Re}(\lambda_{i}) < 0
$$
donde $\operatorname{Re}$ es la parte real de los eigenvalores $\lambda_{i}$, ya que no olvidemos que pueden ser números complejos^[Como lo vimos en la Clase 21.].

Supongamos que $\lambda_{i} = a + bi$ (i.e, un número complejo). Esto significa que en la solución general de un sistema de ecuaciones diferenciales:
$$
  \exp(\lambda_{i}t) = \exp([a + bi]t) = \exp(at) \cdot \exp(bit)
$$
donde $\operatorname{Re}(\lambda_{i}) = at$ y $\operatorname{Im}(\lambda_{i}) = bit$ (la parte imaginaria).

La idea es evaluar qué ocurre con la solución general $u(t)$ a medida que el tiempo $t$ avanza (i.e, $t \to \infty$). Veamos qué ocurre con la parte imaginaria $\exp(bit)$.

A partir de la fórmula de Euler^[$\exp(ix) = \cos(x) + i\sin(x)$.] podemos establecer que:
$$
  \exp(bit) = \cos(bt) + i\sin(bt)
$$
Como el propósito es ver a qué valor crece $\exp(bit)$, entonces usamos su valor absoluto.
$$
  |\exp(bit)|
$$
Debido a que el valor absoluto de un número complejo es $|a + bi| = \sqrt{a^{2} + b^{2}}$, entonces:
$$
  |\exp(bit)| = \sqrt{\cos^{2}(bt) + \sin^{2}(bt)} = \sqrt{1} = 1
$$
En otras palabras, independiente del valor que tome $t$, $\operatorname{Im}(\lambda_{i}) = \exp(bit) = 1$.
$$
  \exp(\lambda_{i}t) = \exp([a + bi]t) = \exp(at) \cdot 1 = \exp(at); \quad \text{para cualquier } t \geq 0
$$
Por consiguiente, la única posibilidad de que el sistema alcance **estabilidad**^[Si el eigenvalor $\lambda_{i}$ es real, entonces solo tiene que ser negativo para que haya estabilidad.] o, en otras palabras, que $u(t) \to 0$, es que
$$
  \operatorname{Re}(\lambda_{i}) = at < 0
$$
puesto que en aquel caso $\exp(\lambda_{i}t) \to 0$.

**2. Estado Estable.** Anteriormente vimos que esta condición corresponde a cuando la solución general, en cierto periodo $t$, toma un valor constante. Incluyendo ahora el caso de tener eigenvalores $\lambda_{i}$ complejos, aquello ocurre cuando:
$$
  \lambda_{1} = 0 \quad \text{ y } \quad \operatorname{Re}(\lambda_{i}) < 0, \text{ para } i > 1
$$
**3. Crecimiento Infinito.** Es posible asegurar que la solución general de un sistema de ecuaciones diferenciales va a crecer sin estabilizarse cuando los eigenvectores son mayores a cero. Para el caso de los complejos, cuando:
$$
  \operatorname{Re}(\lambda) > 0
$$

### 2.1.1 Estabilidad para $A$ de $2 \times 2$.

Una forma sencilla de evaluar la condición de estabilidad de un sistema de ecuaciones diferenciales, es a partir de una matriz de $2 \times 2$.

Asumamos que existen los eigenvalores de $A$ y que son complejos (de manera que se aplican también a los reales). Esto significa que:
$$
  \operatorname{Re}(\lambda_{1}) < 0 \quad \text{ y } \quad \operatorname{Re}(\lambda_{2}) < 0
$$
Sin calcular los eigenvalores de $A$ sabemos que podemos tener una pista de ellos al calcular su **traza** y **determinante**. Si ambos son negativos, implica que:
$$
  \operatorname{tr}(A) = \operatorname{Re}(\lambda_{1}) + \operatorname{Re}(\lambda_{2}) < 0
  \quad \text{ y } \quad
  \det(A) = \operatorname{Re}(\lambda_{1}) \cdot \operatorname{Re}(\lambda_{2}) > 0
$$
Por lo tanto, podemos garantizar **estabilidad** en el sistema de ecuaciones diferenciales sin conocer los eigenvalores de $A$ si:

1. $\operatorname{tr}(A) < 0$.

2. $\det(A) > 0$.

Las dos condiciones en conjunto deben cumplirse. Con la primera, por si sola, aún la solución general puede tener crecimiento infinito.


# 3. Desacoplando un Sistema de Ecuaciones Diferenciales.

En la sección 1 resolvimos un sistema de ecuaciones diferenciales utilizando los eigenvalores y eigenvectores de la matriz de coeficientes $A$. Cuando tiene $n$ eigenvectores linealmente independientes, podemos resolver este sistema usando la matriz diagonalizada $\Lambda$.

Volvamos al sistema
$$
  \frac{d \vec{u}}{dt} = A \vec{u}
$$
donde $A$ es una matriz de $n \times n$ y tiene $n$ eigenvectores linealmente independientes.

Luego, introduzcamos un vector de incógnitas $\vec{w}$ y establezcamos que:
$$
  \vec{u}(t) = S \vec{w}
$$
con $S$ siendo la matriz de eigenvectores de $A$.

Reemplacemos a $\vec{u}(t)$ en el sistema de ecuaciones^[No olvidemos que las entradas de $S$ son escalares.].
$$
\begin{aligned}
  \frac{d S \vec{w}}{dt} &= A (S \vec{w}) \\
  S \frac{d \vec{w}}{dt} &= A (S \vec{w})
\end{aligned}
$$
Multipliquemos a la izquierda de ambos lados de la ecuación por $S^{-1}$.
$$
  \frac{d \vec{w}}{dt} = S^{-1} A S \vec{w}
$$
La clase anterior estudiamos que podemos diagonalizar a la matriz $A$ como $\Lambda = S^{-1} A S$. Por lo tanto:
$$
  \frac{d \vec{w}}{dt} = \Lambda \vec{w}
$$
donde:
$$
\Lambda =
\begin{bmatrix}
\lambda_{1} & 0 & \cdots & 0 \\
0 & \lambda_{2} & \cdots & 0 \\
\vdots & \vdots & \ddots & \vdots \\
0 & 0 & \cdots & \lambda_{n}
\end{bmatrix}
\quad \text{ y } \quad
\vec{w} =
\begin{bmatrix}
w_{1}(t) \\ w_{2}(t) \\ \vdots \\ w_{n}(t)
\end{bmatrix}
$$
Este es un sistema de ecuaciones diferenciales distinto al inicial $\vec{u} \ ' (t)$, el cual tiene la peculiaridad de que **desacopla** o separa el sistema. En otras palabras, cada variable no es dependiente de la otra, como lo era a un comienzo. Veámoslo al escribirlo en forma escalar.
$$
\begin{aligned}
\frac{d w_{1}}{dt} &= \lambda_{1} w_{1}(t) \\
\frac{d w_{2}}{dt} &= \lambda_{2} w_{2}(t) \\
\vdots \\
\frac{d w_{n}}{dt} &= \lambda_{n} w_{n}(t)
\end{aligned}
$$
Por lo tanto, cada solución general de las ecuaciones diferenciales de arriba será:
$$
\begin{aligned}
w_{1}(t) &= c_{1} \exp(\lambda_{1} t) \\
w_{2}(t) &= c_{2} \exp(\lambda_{2} t) \\
\vdots \\
w_{n}(t) &= c_{n} \exp(\lambda_{n} t)
\end{aligned}
$$
En otras palabras:
$$
\vec{w}(t) =
\begin{bmatrix}
c_{1} \exp(\lambda_{1} t) \\
c_{2} \exp(\lambda_{2} t) \\
\vdots \\
c_{n} \exp(\lambda_{n} t) \\
\end{bmatrix}
$$
Al reemplazar a $\vec{w}(t)$ en la igualdad $\vec{u}(t) = S \vec{w}$, obtenemos la solución general del sistema.
$$
\begin{aligned}
\vec{u}(t) &= S \vec{w} \\
&=
\begin{bmatrix}
\vec{x} _ {1} & \vec{x} _ {2} & \cdots & \vec{x} _ {n}
\end{bmatrix} \cdot
\begin{bmatrix}
c_{1} \exp(\lambda_{1} t) \\
c_{2} \exp(\lambda_{2} t) \\
\vdots \\
c_{n} \exp(\lambda_{n} t) \\
\end{bmatrix} \\
\vec{u}(t) &=
c_{1} \exp(\lambda_{1} t) \vec{x} _ {1} + c_{2} \exp(\lambda_{2} t) \vec{x} _ {2} + \cdots + c_{n} \exp(\lambda_{n} t) \vec{x} _ {n}
\end{aligned}
$$
Conocer la solución general de esta forma solo es posible si $A$ de $n \times n$ tiene $n$ **eigenvectores linealmente independientes**.


# 4. Matriz Exponencial.

Hasta ahora hemos visto dos formas para resolver un sistema de ecuaciones diferenciales con coeficientes constantes. Ahora revisaremos una tercera que es menos restrictiva que la anterior y es la más usada.

Al inicio señalamos que la ecuación diferencial base de esta clase era:
$$
  \frac{du}{dt} = au
$$
cuya solución general es $u(t) = C \exp(at)$.

Interpretemos la ecuación diferencial de arriba de otra forma, pero sin alterarla, señalando que $a$ es una matriz de $1 \times 1$. Todo se mantiene igual, su solución general sigue siendo $u(t) = C \exp(at)$. Lo que sí tendremos que modificar, es el análisis de la función exponencial $\exp(at)$ cuando dicha matriz es de mayor dimensión.

Digamos que el sistema de ecuaciones diferenciales con coeficientes constantes
$$
  \frac{d\vec{u}}{dt} = A \vec{u}
$$
donde $A$ es de $n \times n$ y tiene como solución general:
$$
  \vec{u}(t) = C \exp(At)
$$
Hemos seguido el razonamiento inicial y obtuvimos la expresión de arriba. Probablemente nos preguntemos cómo calculamos un número exponencial elevado a una matriz y esto es menos raro de lo que podríamos pensar.

Formalmente, una **función exponencial** se define como la siguiente **serie de Taylor**.
$$
  \exp(x) = 1 + x + \frac{x^{2}}{2!} + \frac{x^{3}}{3!} + \cdots = \sum_{n = 0}^{\infty} \frac{x^{n}}{n!}
$$
Por lo tanto, la expresión $\exp(at)$ de la solución general $u(t) = C \exp(at)$ corresponde a:
$$
  \exp(at) = 1 + at + \frac{(at)^{2}}{2!} + \frac{(at)^{3}}{3!} + \cdots
$$
Para verificar que satisface a la ecuación diferencial, usemos esta expansión en la solución general y derivémosla.
$$
\begin{aligned}
  \frac{du}{dt} &= \frac{d}{dt} (C \exp(at)) \\
  &= C \cdot \frac{d}{dt} \left(1 + at + \frac{(at)^{2}}{2!} + \frac{(at)^{3}}{3!} + \cdots \right) \\
  &= C \cdot \left(a + a^{2}t + \frac{a^{3}t^{2}}{2!} + \cdots \right) \\
  &= C \cdot a \cdot \left(1 + at + \frac{a^{2}t^{2}}{2!} + \cdots \right) \\
  &= a \cdot C \exp(at) \\
  \frac{du}{dt} &= au
\end{aligned}
$$
En ese sentido, podemos tomarnos de este razonamiento para tener una fórmula que nos permita calcular $\exp(At)$, la cual corresponde a:
$$
  \exp(At) = I + At + \frac{(At)^{2}}{2!} + \frac{(At)^{3}}{3!} + \cdots ; \; (I = \text{matriz identidad})
$$
Como vemos, es una suma de matrices que resulta en otra llamada **Matriz Exponencial**.

Podemos comprobar que la matriz exponencial $\exp(At)$ es parte de la solución general al calcular la derivada de $\vec{u}(t) = C \exp(At)$.

$$
\begin{aligned}
  \frac{d\vec{u}}{dt} &= \frac{d}{dt} C \cdot \exp(At) \\
                      &= C \cdot \frac{d}{dt} \left(I + At + \frac{(At)^{2}}{2!} + \frac{(At)^{3}}{3!} + \cdots \right) \\
                      &= C \cdot \left(A + A^{2}t + \frac{A^{3}t^{2}}{2!} + \cdots \right) \\
                      &= C \cdot A \left(I + At + \frac{A^{2}t^{2}}{2!} + \cdots \right) \\
                      &= A \cdot C \exp(At) \\
  \frac{d\vec{u}}{dt} &= A \vec{u}
\end{aligned}
$$
Ahora, supongamos que $A$ de $n \times n$ tiene $n$ eigenvectores linealmente independientes. Esto significa que podemos factorizarla como:
$$
  A = S \Lambda S^{-1}
$$
Reemplacemos esta descomposición de $A$ en la serie de Taylor de $\exp(At)$.
$$
\begin{aligned}
  \exp(At) &= I + S \Lambda S^{-1} t + \frac{(S \Lambda S^{-1} t)^{2}}{2!} + \frac{(S \Lambda S^{-1} t)^{3}}{3!} + \cdots \\
           &= I + S \Lambda S^{-1} t + \frac{S \Lambda^{2} S^{-1} t^{2}}{2!} + \frac{S \Lambda^{3} S^{-1} t^{3}}{3!} + \cdots
\end{aligned}
$$
En el lado derecho de la ecuación, factoricemos por $S$ a la izquierda y por $S^{-1}$ en la derecha.
$$
\begin{aligned}
  \exp(At) = S \left(I + \Lambda t + \frac{\Lambda^{2} t^{2}}{2!} + \frac{\Lambda^{3} t^{3}}{3!} + \cdots \right) S^{-1}
\end{aligned}
$$
Si nos damos cuenta, el paréntesis del lado derecho de la ecuación de arriba corresponde a:
$$
  \exp(\Lambda t) = I + \Lambda t + \frac{\Lambda^{2} t^{2}}{2!} + \frac{\Lambda^{3} t^{3}}{3!} + \cdots
$$
Por lo tanto, cuando $A$ tiene $n$ eigenvectores linealmente independientes, la matriz exponencial corresponde a:
$$
  \exp(At) = S \exp(\Lambda t) S^{-1}
$$
Y la solución general del sistema para dicho caso, es:
$$
  \vec{u}(t) = C \cdot S \exp(\Lambda t) S^{-1}
$$
donde
$$
\exp(\Lambda t) =
\begin{bmatrix}
\exp(\lambda_{1}t) & 0 & \cdots & 0 \\
0 & \exp(\lambda_{2}t) & \cdots & 0 \\
\vdots & \vdots & \ddots & \vdots \\
0 & 0 & \cdots & \exp(\lambda_{n}t)
\end{bmatrix}
$$

