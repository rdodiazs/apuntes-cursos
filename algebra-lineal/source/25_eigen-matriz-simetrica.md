---
title: "Clase 25. Matrices Simétricas y sus Eigenvalores y Eigenvectores."
subtitle: "Curso 'Linear Algebra' del MIT."
abstract: \noindent Las matrices simétricas siempre serán de nuestro interés por las facilidades que nos entregan. En esta ocasión las estudiaremos a partir de sus eigenvalores y eigenvectores, las características de éstos y la posibilidad de obtener una descomposición matricial conocida como Teorema Espectral.
geometry: margin=1in
lang: es
fontsize: 12pt
header-includes:
  - \usepackage{setspace} \onehalfspacing
  - \usepackage{parskip}
  - \usepackage{amsmath, amssymb}
---


# 1. Eigenvalores y Eigenvectores de Matrices Simétricas.

Como recordaremos, las matrices simétricas son matrices cuadradas cuyas entradas son iguales a las de su transpuesta. Es decir, si en $A$ de $n \times n$,
$$
  A = A^{T}
$$
entonces $A$ es simétrica.

Al ser cuadradas las matrices simétricas, podemos calcular sus eigenvalores y eigenvectores, los cuales poseen las siguientes caracterísicas:

- Eigenvalores son **reales**.

- Eigenvectores son **ortogonales**.

Ahora bien, sabemos que existe la posibilidad de obtener eigenvalores repetidos, lo que significa que algunos eigenvectores serán linealmente dependientes. Incluso en ese caso, de igual modo podemos **elegir eigenvectores ortogonales** con eigenvalores distintos.

## 1.1 Explicación de Eigenvalores Reales.

Es posible evaluar que los eigenvalores de una matriz simétrica son reales de la siguiente manera: Digamos que $A$ es una matriz de $n \times n$ y se cumple que $A = A^{T}$.

A ser $A$ una matriz cuadrada, se cumple que:
$$
  A \vec{x} = \lambda \vec{x}
$$
con $\lambda$ y $\vec{x}$ siendo los eigenvalores y eigenvectores de $A$.

Asumamos, además, que $A$ es una matriz con entradas reales. Es decir, $[a_{i,j}] \in \mathbb{R}$.

Ahora bien, como vimos en la Clase 21, a pesar de que una matriz pueda tener entradas reales, de igual manera sus eigenvalores pueden ser números complejos. Por lo tanto, supongamos que $\lambda \in \mathbb{C}$ y agreguemos que las entradas de $\vec{x}$ también son complejos.

Luego, concentrémonos en los conjugados complejos $\overline{\lambda}$ y $\overline{\vec{x}}$. Algo que siempre se cumplirá es que $\overline{\lambda} \cdot \overline{\vec{x}} = \overline{\lambda \vec{x}}$. En ese sentido, es válido establecer que:
$$
  A \overline{\vec{x}} = \overline{\lambda} \cdot \overline{\vec{x}}
$$
Posteriormente, calculemos la transpuesta para ambos lados de la ecuación de arriba.
$$
\begin{aligned}
  (A \overline{\vec{x}})^{T} &= (\overline{\lambda} \cdot \overline{\vec{x}})^{T} \\
  \overline{\vec{x}}^{T} A^{T} &= \overline{\lambda} \ \overline{\vec{x}}^{T}
\end{aligned}
$$
Como $A = A^{T}$, entonces:
$$
  \overline{\vec{x}}^{T} A = \overline{\lambda} \ \overline{\vec{x}}^{T}
$$
Luego, multipliquemos por $\vec{x}$ a la derecha de ambos lados de la ecuación anterior.
$$
  \overline{\vec{x}}^{T} A \vec{x} = \overline{\lambda} \ \overline{\vec{x}}^{T} \vec{x}
$$
Teniendo en cuenta a la ecuación de arriba, volvamos a la inicial $A \vec{x} = \lambda \vec{x}$ y multipliquémosla por $\overline{\vec{x}}^{T}$ a la izquierda.
$$
  \overline{\vec{x}}^{T} A \vec{x} = \overline{\vec{x}}^{T} \lambda \vec{x}
$$
Debido a que $\overline{\vec{x}}^{T} A \vec{x} = \overline{\lambda} \ \overline{\vec{x}}^{T} \vec{x}$, en consecuencia:
$$
  \overline{\lambda} \ \overline{\vec{x}}^{T} \vec{x} = \overline{\vec{x}}^{T} \lambda \vec{x}
$$
Al calcular el producto punto $\overline{\vec{x}}^{T} \vec{x}$, la multiplicación entre los componentes de ambos vectores será $(a + bi)(a - bi) = a^{2} - b^{2}i^{2}$. Debido a que $i^{2} = -1$, entonces $(a + bi)(a - bi) = a^{2} + b^{2}$, donde $a, \ b \in \mathbb{R}$. En otras palabras, aquel producto punto corresponde a un valor escalar real. Por consiguiente, al dividir la ecuación de arriba por aquel escalar, obtenemos que:
$$
  \overline{\lambda} = \lambda
$$
Esta igualdad explica por qué el eigenvalor $\lambda$ es un número real. Recordemos que dos números complejos son iguales si sus partes imaginarias y reales son iguales. En este caso, lo que nos está diciendo es que $\lambda$ es un **número real puro**. Es decir, si $\lambda = a + bi$, entonces $bi = 0$. Por lo tanto,
$$
\begin{aligned}
  \overline{\lambda} &= \lambda \\
  a - bi &= a + bi \\
  a &= a
\end{aligned}
$$
En consecuencia, los eigenvalores de una matriz $A$ simétrica siempre serán reales.

### 1.1.1 Signo de los eigenvalores en una matriz simétrica.

Al trabajar con eigenvalores podríamos estar interesados en saber si $\lambda_{i} > 0$ o $\lambda_{i} < 0$. Por ejemplo, en la Clase 23 usamos esta información para evaluar el comportamiento de las soluciones de un sistema de ecuaciones diferenciales.

Una forma de conocer el signo de los eigenvalores sería buscarlos como las raíces de su polinomio característico, pero se vuelve tedioso al hacerlo con matrices de gran tamaño^[Recordemos que el grado del polinomio característico es igual al tamaño de la matriz cuadrada inicial.]. No obstante, otra manera más eficiente es a partir de sus valores **pivotes**.

Como sabemos, los eigenvalores de una matriz no son iguales a sus pivotes, pero el producto de estos últimos es igual a su determinante el cual también es igual al producto de los eigenvalores.
$$
  \text{Prod. Pivotes} = \text{Determinante} = \text{Prod. Eigenvalores}
$$
El **signo del producto entre los pivotes** puede decirnos algo sobre el signo de los eigenvalores, pero no nos asegura aún cuántos son positivos y cuántos negativos. Sin embargo, esto sí puede conocerse en **matrices simétricas**.

En particular, otra característica especial de las **matrices simétricas** es que **siempre tiene la misma cantidad de pivotes positivos y eigenvalores positivos**.
$$
  \text{Si } A = A^{T} \Rightarrow \text{Cant. Pivotes Positivos} = \text{Cant. Eigenvalores Positivos}
$$
Por lo tanto, todos los $\lambda_{i}$ de $A = A^{T}$ serán positivos si todos sus pivotes también lo son.

La ventaja de usar los valores pivotes de una matriz para saber cuántos eigenvalores positivos y/o negativos hay, es que son mucho más rápidos de obtener. Como recordaremos, solo tenemos que pasarla a una matriz triangular superior $U$ por medio del método de eliminación de Gauss, donde los elementos de su diagonal principal serán los pivotes de la matriz original $A$. Si esta última es simétrica, entonces sabremos el número exacto de $\lambda_{i}$ positivos y negativos.

## 1.2 Explicación de Eigenvectores Ortogonales.

Demostremos que los eigenvectores de una matriz simétrica $A$ son ortogonales.

Digamos que $A = A^{T}$ es una matriz de $n \times n$, la cual tiene dos eigenvectores $\vec{x}$ e $\vec{y}$ y sus correspondientes eigenvalores son $\lambda_{i}$ y $\lambda_{2}$, respectivamente, donde $\lambda_{1} \neq \lambda_{2}$. En ese sentido, es válido establecer que:
$$
  A \vec{x} = \lambda_{1} \vec{x} \quad \text{y} \quad A \vec{y} = \lambda_{2} \vec{y}
$$
Continuemos con la ecuación de la izquierda $A \vec{x} = \lambda_{1} \vec{x}$, calculando su transpuesta.
$$
\begin{aligned}
(A \vec{x})^{T} = (\lambda_{1} \vec{x})^{T} \\
\vec{x}^{T} A^{T} = \lambda_{1} \vec{x}^{T}
\end{aligned}
$$
Como $A = A^{T}$, entonces:
$$
  \vec{x}^{T} A = \lambda_{1} \vec{x}^{T}
$$
Luego, multipliquemos por $\vec{y}$ a la izquierda en la ecuación de arriba.
$$
  \vec{x}^{T} A \vec{y} = \lambda_{1} \vec{x}^{T} \vec{y}
$$
Debido a que $A \vec{y} = \lambda_{2} \vec{y}$, entonces:
$$
\begin{aligned}
  \vec{x}^{T} \lambda_{2} \vec{y} &= \lambda_{1} \vec{x}^{T} \vec{y} \\
  \lambda_{2} \vec{x}^{T} \vec{y} &= \lambda_{1} \vec{x}^{T} \vec{y}
\end{aligned}
$$
La idea es mostrar que la igualdad de arriba sea cero en ambos lados. Como^[Si $\lambda_{1} = \lambda_{2}$, solo necesitamos que uno de los dos eigenvalores sean iguales a cero.] $\lambda_{1} \neq \lambda_{2}$, la única posibilidad es que $\vec{x}^{T} \vec{y} = 0$ y sabemos que esto ocurre solo cuando ambos vectores son **ortogonales**. En consecuencia, **se demuestra que los eigenvectores de una matriz simétrica son ortogonales entre sí**.


# 2 Teorema de Descomposición Espectral.

Supongamos que $A$ es una matriz de $n \times n$ con eigenvalores $\lambda_{i}$ distintos entre sí. En la Clase 22 vimos que podemos factorizar esta matriz como:
$$
  A = S \Lambda S^{-1}
$$
donde $\Lambda$ es una matriz diagonal de los eigenvalores de $A$ y los vectores columna de $S$ son los eigenvectores de $A$.

Añadamos ahora el hecho de que $A$ es simétrica o, en otras palabras, $A = A^{T}$. Esto implica que los vectores columna $\vec{x} _ {i}$ de $S$ son **ortogonales**. Por lo tanto, transformemos dicha matriz a una **matriz ortogonal** $Q$, ortonormalizando a los eigenvectores^[Como son linealmente independientes, podemos ortonormalizarlos usando el **Método de Gram-Schmidt** estudiado en la Clase 17.].

Lo anterior significa que a $S$ podemos denotarla como $Q$. Reemplacémosla en la ecuación de la descomposición de $A$.
$$
  A = Q \Lambda Q^{-1}
$$
En la Clase 17 estudiamos que cuando $Q$ es cuadrada, entonces $Q^{T} = Q^{-1}$. Por consiguiente,
$$
  A = Q \Lambda Q^{T}
$$
Esta factorización de $A$ se conoce como **Teorema de Descomposición Espectral** o, simplemente, **Teorema Espectral** y se cumple cuando:

1. $A = A^{T}$ (i.e, cuando $A$ es simétrica).

2. Los eigenvalores $\lambda_{i}$ son distintos entre sí.

El teorema espectral también puede tener otra interpretación. Reescribamos su igualdad como matrices, donde $\vec{a} _ {i}$ y  $\vec{q} _ {i}$ son los vectores columna de $A$ y $Q$, respectivamente.
$$
\begin{aligned}
A &= Q \Lambda Q^{T} \\
\begin{bmatrix}
\vdots & \vdots &   & \vdots \\
\vec{a} _ {1} & \vec{a} _ {2} & \cdots & \vec{a} _ {n} \\
\vdots & \vdots &   & \vdots
\end{bmatrix} &=
\begin{bmatrix}
\vdots & \vdots &   & \vdots \\
\vec{q} _ {1} & \vec{q} _ {2} & \cdots & \vec{q} _ {n} \\
\vdots & \vdots &   & \vdots
\end{bmatrix} \cdot
\begin{bmatrix}
\lambda_{1} & 0 & \cdots & 0 \\
0 & \lambda_{2} & \cdots & 0 \\
\vdots & \vdots & \ddots & \vdots \\
0 & 0 & \cdots & \lambda_{n}
\end{bmatrix} \cdot
\begin{bmatrix}
\cdots & \vec{q}^{T} _ {1} & \cdots  \\
\cdots & \vec{q}^{T} _ {2} & \cdots  \\
  & \vdots &  \\
\cdots & \vec{q}^{T} _ {n} & \cdots
\end{bmatrix} \\
&= \lambda_{1}\vec{q} _ {1} \vec{q}^{T} _ {1} + \lambda_{2}\vec{q} _ {2} \vec{q}^{T} _ {2} + \cdots + \lambda_{n}\vec{q} _ {n} \vec{q}^{T} _ {n}
\end{aligned}
$$
Como podemos observar, el producto $\vec{q} _ {i} \vec{q}^{T} _ {i}$ resulta en una matriz cuadrada^[$\vec{q} _ {i}$ es de $n \times 1$ y $\vec{q}^{T} _ {i}$ es de $1 \times n$.] de $n \times n$. Por otra parte, ambos vectores son unitarios. En particular,
$$
  ||\vec{q} _ {i}|| = ||\vec{q}^{T} _ {i}|| = 1
$$
Si elevamos al cuadrado la magnitud del vector $\vec{q} _ {i}$, ésta se mantiene igual ya que $1^{2} = 1$:
$$
  ||\vec{q} _ {i}|| = ||\vec{q} _ {i}||^{2} = 1
$$
Y algo que hemos estudiado en otras ocasiones, es que:
$$
  \vec{q}^{T} _ {i} \vec{q} _ {i} = ||\vec{q} _ {i}||^{2}
$$
Ahora, veamos que:
$$
  \vec{q} _ {i} \vec{q}^{T} _ {i} = \left(\frac{1}{||\vec{q} _ {i}||} \cdot \frac{1}{||\vec{q}^{T} _ {i}||}\right) \cdot \vec{q} _ {i} \vec{q}^{T} _ {i}
$$
Debido a que $||\vec{q} _ {i}|| = ||\vec{q}^{T} _ {i}||$, entonces:
$$
  \vec{q} _ {i} \vec{q}^{T} _ {i} = \left(\frac{1}{||\vec{q} _ {i}||^{2}}\right) \cdot \vec{q} _ {i} \vec{q}^{T} _ {i}
$$
Y puesto que $||\vec{q} _ {i}||^{2} = \vec{q}^{T} _ {i} \vec{q} _ {i}$, en consecuencia:
$$
  \vec{q} _ {i} \vec{q}^{T} _ {i} = \left(\frac{1}{\vec{q}^{T} _ {i} \vec{q} _ {i}}\right) \cdot \vec{q} _ {i} \vec{q}^{T} _ {i}
$$
En la Clase 15 estudiamos que la matriz del lado derecho de la ecuación de arriba corresponde a una **Matriz de Proyección**. En este caso, es aquella que permite obtener un vector que se **proyecta ortogonalmente** a un subespacio de una dimensión^[Es decir, geométricamente es una línea que pasa por el origen.] generado (*spanned*) por $\vec{q} _ {i}$.

De este modo, también es posible interpretar el **teorema espectral** como la suma de los productos entre los **eigenvalores de $A$** y las **matrices de proyección ortogonal** $\vec{q} _ {i} \vec{q}^{T} _ {i}$.
$$
  A = Q \Lambda Q^{T} = \sum_{i = 1}^{n} \lambda_{i} \vec{q} _ {i} \vec{q}^{T} _ {i}
$$

