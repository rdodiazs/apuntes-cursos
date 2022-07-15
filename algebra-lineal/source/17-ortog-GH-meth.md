---
title: Clase 17. Matrices Ortogonales y el Proceso de Gram-Schmidt.
subtitle: Curso 'Linear Algebra' del MIT.
abstract: \noindent La clase pasada terminamos estudiando preliminarmente los __vectores ortonormales__. En esta ocasión nos concentraremos en ellos y en las __matrices ortogonales__, viendo sus características y cómo obtenerlas cuando, inicialmente, dichos objetos no son perpendiculares. Para esto último, usaremos el __Proceso de Gram-Schmidt__.
lang: es
fontsize: 12pt
geometry: [margin=1in]
header-includes:
  - \usepackage{setspace} \onehalfspacing
  - \usepackage{graphicx}
  - \usepackage{amsmath}
  - \usepackage{amssymb}
---



# 1. Vectores Ortonormales.

La clase anterior señalamos que los __vectores ortonormales__ son aquellos que se caracterizan por ser:

- Ortogonales entre sí.

- Vectores Unitarios (i.e, de magnitud igual a $1$).

Formalmente se indica que dos (o más) vectores $\vec{q} _ {i}$ y $\vec{q} _ {j}$ son __ortonormales__ si:
$$
\vec{q} _ {i}^{T} \cdot \vec{q} _ {j} =
\left\{
  \begin{aligned}
  0 \text{ cuando } i \neq j \\
  1 \text{ cuando } i = j
  \end{aligned}
\right.
$$
La primera condición es la de ortogonalidad. Recordemos que dos vectores de igual dimensionalidad, pero de componentes distintos, son perpendiculares si en su producto punto:
$$
  \vec{q} _ {i}^{T} \cdot \vec{q} _ {j} = 0 \ (\text{con } i \neq j)
$$
Mientras que la segunda condición hace referencia a que sean unitarios y también se puede explicar a partir de su producto punto. Como ya hemos estudiado, el producto punto entre un vector y sí mismo coincide con ser su magnitud al cuadrado.
$$
  \vec{q} _ {i}^{T} \cdot \vec{q} _ {j} = ||\vec{q}||^{2} \ (\text{con } i = j)
$$
Si $||\vec{q}|| = 1$ (i.e, si $\vec{q}$ es unitario), entonces:
$$
  \vec{q} _ {i}^{T} \cdot \vec{q} _ {j} = 1 \ (\text{con } i = j)
$$
Los __vectores unitarios__ también reciben el nombre de __vectores normalizados__ y son aquellos de __magnitud $1$__ que __van en la misma dirección de otro vector__, los cuales se obtienen multiplicando a este último por el recíproco de su magnitud.

Por ejemplo, sea $\vec{a} \neq \vec{0}$. Su versión normalizada $\hat{a}$ se calcula como:
$$
  \hat{a} = \frac{1}{||\vec{a}||} \cdot \vec{a}
$$
La __norma__ (o norma vectorial) es otra forma de referirnos a la magnitud de un vector.

De este modo, ahora podemos entender por qué los vectores __ortonormales__ se llaman así:

- Orto $\rightarrow$ Perpendiculares (u ortogonales).

- Normal $\rightarrow$ Unitarios.

Un conjunto de vectores ortonormales, al ser ortogonales, siempre son __linealmente independientes__ entre sí. A continuación se demuestra esta afirmación.

__Demostración.__ Sean $\vec{v} _ {1}, \ \vec{v} _ {2}, \ \cdots, \ \vec{v} _ {n}$ vectores ortogonales distinto de $\vec{0}$ y $c_{1}, \ c_{2}, \ \cdots, \ c_{n}$ valores escalares. Estos vectores son linealmente independientes si:
$$
  \sum_{i = 1}^{n} c_{i}\vec{v} _ {i} = \vec{0} \iff c_{1}, \ c_{2}, \ \cdots, \ c_{n} = 0
$$
Calculemos el producto punto en la igualdad de arriba con la transpuesta del vector ortogonal $\vec{v} _ {i} \neq \vec{0}$ para cada $i = 1, \ 2, \ \cdots, \ n$:
$$
\begin{aligned}
\vec{v} _ {i}^{T} \cdot \sum_{i = 1}^{n} c_{i}\vec{v} _ {i} &= \vec{v} _ {i}^{T} \cdot \vec{0} \\
\vec{v} _ {i}^{T} \cdot (c_{1}\vec{v} _ {1} + c_{2}\vec{v} _ {2} + \cdots + c_{n}\vec{v} _ {n}) &= 0 \\
c_{1}(\vec{v} _ {i}^{T}\vec{v} _ {1}) + c_{2}(\vec{v} _ {i}^{T}\vec{v} _ {2}) + \cdots + c_{n}(\vec{v} _ {i}^{T}\vec{v} _ {n}) &= 0
\end{aligned}
$$
Cada vez que $i \neq j$, con $j = 1, \ 2, \ \cdots, \ n$, $\vec{v} _ {i}^{T} \cdot \vec{v} _ {j} = 0$. Por lo tanto, cuando $i = j$:
$$
\begin{aligned}
c_{i}||\vec{v} _ {i}||^{2} &= 0
\end{aligned}
$$
Como $\vec{v} _ {i} \neq \vec{0}$, entonces $||\vec{v} _ {i}|| \neq 0$, por lo que la única posibilidad de que $c_{i}||\vec{v} _ {i}||^{2} = 0$, es que $c_{i} = 0$.

En consecuencia, se demuestra que los vectores ortogonales $\vec{v} _ {1}, \ \vec{v} _ {2}, \ \cdots, \ \vec{v} _ {n}$ __son linealmente independientes__ porque su combinación lineal puede ser igual a $\vec{0}$ solo cuando $c_{1}, \ c_{2}, \ \cdots, c_{n} = 0$.

En ese sentido, como los __vectores ortonormales__ son ortogonales, entonces también son __linealmente independientes__ y el conjunto de ellos forma una __base__ (_basis_).

# 2. Matrices Ortogonales.

<!--La matriz cuyos __vectores columna__ son una __base ortonormal__, recibe el nombre de __Matriz Ortogonal__ y se denota como $Q$.-->
Con una base ortonormal podemos formar una matriz que suele denotarse como $Q$, donde los primeros son los vectores columna de esta última.

La principal característica de una matriz $Q$, es que satisface la siguiente igualdad:
<!--La relevancia de la matriz ortogonal es que al ser multiplicada a la izquierda por __su transpuesta__, pasa a ser una __matriz identidad__.-->
$$
  Q^{T}Q = I
$$
__Demostración.__ Sean $\vec{q} _ {1}, \ \vec{q} _ {2}, \ \cdots, \ \vec{q} _ {m}$ vectores columna ortonormales de $Q$ en $\mathbb{R}^{n}$. Entonces:
$$
\begin{aligned}
Q^{T}Q &= I \\
\begin{bmatrix}
\vec{q} _ {1}^{T} \\
\vec{q} _ {2}^{T} \\
\vdots \\
\vec{q} _ {m}^{T}
\end{bmatrix}
\cdot
\begin{bmatrix}
\vec{q} _ {1} & \vec{q} _ {2} & \cdots & \vec{q} _ {m}
\end{bmatrix}
&= I \\
\begin{bmatrix}
(\vec{q} _ {1}^{T} \cdot \vec{q} _ {1}) & (\vec{q} _ {1}^{T} \cdot \vec{q} _ {2}) & \cdots & (\vec{q} _ {1}^{T} \cdot \vec{q} _ {m}) \\
(\vec{q} _ {2}^{T} \cdot \vec{q} _ {1}) & (\vec{q} _ {2}^{T} \cdot \vec{q} _ {2}) & \cdots & (\vec{q} _ {2}^{T} \cdot \vec{q} _ {m}) \\
\vdots & \vdots & \ddots & \vdots \\
(\vec{q} _ {m}^{T} \cdot \vec{q} _ {1}) & (\vec{q} _ {m}^{T} \cdot \vec{q} _ {2}) & \cdots & (\vec{q} _ {m}^{T} \cdot \vec{q} _ {m})
\end{bmatrix}
&= I
\end{aligned}
$$
Recordemos que:
$$
\vec{q} _ {i}^{T} \cdot \vec{q} _ {j} =
\left\{
  \begin{aligned}
  0 \text{ cuando } i \neq j \\
  1 \text{ cuando } i = j
  \end{aligned}
\right.
$$
donde $\vec{q} _ {i}$ y $\vec{q} _ {j}$ son ortonormales. Por lo tanto:
$$
\begin{aligned}
\begin{bmatrix}
(\vec{q} _ {1}^{T} \cdot \vec{q} _ {1}) & (\vec{q} _ {1}^{T} \cdot \vec{q} _ {2}) & \cdots & (\vec{q} _ {1}^{T} \cdot \vec{q} _ {m}) \\
(\vec{q} _ {2}^{T} \cdot \vec{q} _ {1}) & (\vec{q} _ {2}^{T} \cdot \vec{q} _ {2}) & \cdots & (\vec{q} _ {2}^{T} \cdot \vec{q} _ {m}) \\
\vdots & \vdots & \ddots & \vdots \\
(\vec{q} _ {m}^{T} \cdot \vec{q} _ {1}) & (\vec{q} _ {m}^{T} \cdot \vec{q} _ {2}) & \cdots & (\vec{q} _ {m}^{T} \cdot \vec{q} _ {m})
\end{bmatrix}
&= I \\
\begin{bmatrix}
1 & 0 & \cdots & 0 \\
0 & 1 & \cdots & 0 \\
\vdots & \vdots & \ddots & \vdots \\
0 & 0 & \cdots & 1
\end{bmatrix}
&=
I
\end{aligned}
$$
La diagonal de $Q^{T}Q$ serán solo $1$s y el resto de sus entradas, ceros. Así, $Q^{T}Q = I$ (Q.E.D).

Ahora bien, la igualdad $Q^{T}Q = I$ se cumple solo si en $Q$ de $n \times m$, $n \geq m$. En cambio, si $n \leq m$, solo se satisface $QQ^{T} = I$. No obstante, cuando $n = m$, ocurre que:
$$
  Q^{T}Q = QQ^{T} = I
$$
La igualdad de arriba es el __criterio de invertibilidad__ que estudiamos en la Clase 3: Si una matriz $A$ es __cuadrada e invertible__, se satisface que:
$$
  A^{-1}A = AA^{-1} = I
$$
En otras palabras, cuando $Q$ es cuadrada (i.e, $n = m$), se cumple que $Q^{T} = Q^{-1}$ y, por consiguiente, que:
$$
  Q^{-1}Q = QQ^{-1} = I
$$
En ese momento, $Q$ recibe el nombre de __Matriz Ortogonal__, la cual se caracteriza por:

- Tener vectores columna __ortonormales__.
- Ser cuadrada.
- Ser invertible, donde $Q^{-1} = Q^{T}$.

## 2.1 Ejemplos de Matrices Ortogonales.

Una __matriz permutación__ cuadrada es un ejemplo de una matriz ortogonal. Como recordaremos, consiste de ceros y un $1$ en cada columna, la cual se usa para reordenar las entradas de otra matriz al multiplicarla. A continuación tenemos un ejemplo:

Sea $P$ la siguiente matriz permutación:
$$
P =
\begin{bmatrix}
0 & 0 & 1 \\
1 & 0 & 0 \\
0 & 1 & 0
\end{bmatrix}
$$
Los vectores columna de $P$ son ortogonales entre sí y todos de magnitud igual a $1$. Ahora multipliquémosle su transpuesta.
$$
P^{T}P =
\begin{bmatrix}
0 & 1 & 0 \\
0 & 0 & 1 \\
1 & 0 & 0
\end{bmatrix}
\cdot
\begin{bmatrix}
0 & 0 & 1 \\
1 & 0 & 0 \\
0 & 1 & 0
\end{bmatrix} =
\begin{bmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & 1
\end{bmatrix} =
I
$$
Otro ejemplo de una matriz ortogonal es la __Matriz de Rotación__ $R$, la cual es utilizada para hacer rotar un objeto en un espacio euclidiano:
$$
R =
\begin{bmatrix}
\cos(\theta) & -\sin(\theta) \\
\sin(\theta) & \cos(\theta)
\end{bmatrix}
$$
Las columnas de $R$ son ortogonales y unitarias. Además, cuando es multiplicada por su transpuesta, obtenemos la matriz identidad:
$$
R^{T}R =
\begin{bmatrix}
\cos(\theta) & \sin(\theta) \\
-\sin(\theta) & \cos(\theta)
\end{bmatrix}
\cdot
\begin{bmatrix}
\cos(\theta) & -\sin(\theta) \\
\sin(\theta) & \cos(\theta)
\end{bmatrix} =
\begin{bmatrix}
1 & 0 \\
0 & 1
\end{bmatrix} =
I
$$
En ocasiones nos encontraremos con matrices de columnas ortogonales, pero que no son unitarias. Un ejemplo son las __Matrices Hadamard__ $H$. Éstas son cuadradas, con entradas de valores $1$ y $-1$ y sus columnas son perpendiculares entre sí. A continuación tenemos una de $4 \times 4$:
$$
H =
\begin{bmatrix}
1 & 1 & 1 & 1 \\
1 & -1 & 1 & -1 \\
1 & 1 & -1 & -1 \\
1 & -1 & -1 & 1
\end{bmatrix}
$$
Veamos que todas las columnas de $H$ son de magnitud $2$. Por lo tanto, podemos normalizarlas muliplicando a esta matriz por $1/2$ (i.e, el recíproco de sus normas), pasando a ser __ortonormales__ y, en consecuencia, $H = Q$.

$$
\frac{1}{2} \cdot H =
\frac{1}{2}
\cdot
\begin{bmatrix}
1 & 1 & 1 & 1 \\
1 & -1 & 1 & -1 \\
1 & 1 & -1 & -1 \\
1 & -1 & -1 & 1
\end{bmatrix} =
\begin{bmatrix}
0.5 & 0.5 & 0.5 & 0.5 \\
0.5 & -0.5 & 0.5 & -0.5 \\
0.5 & 0.5 & -0.5 & -0.5 \\
0.5 & -0.5 & -0.5 & 0.5
\end{bmatrix} =
Q
$$
Al ser cuadrada, se cumplirá que $Q^{T}Q = I$.

## 2.2 Aplicación de las Matrices Ortogonales.

Las matrices ortogonales son útiles, por ejemplo, para __buscar una matriz de proyección__.

Como recordaremos de la Clase 15, la matriz de proyección $P$ para buscar a un vector $\vec{p} \in C(A)$ que se proyecte sobre $\vec{b} \notin C(A)$, se obtiene a partir de la siguiente fórmula:
$$
  P = A(A^{T}A)^{-1}A^{T}
$$
conllevando a que:
$$
  \vec{p} = P\vec{b}
$$
En ciertas ocasiones podría ser más preferible trabajar con una matriz $Q$ de vectores columna ortonormales y, por consiguiente, buscar a $\vec{p} \in C(Q)$ proyectado sobre $\vec{b}$:
$$
  P = Q(Q^{T}Q)^{-1}Q^{T}
$$
Como las columnas de $Q$ son ortonormales, entonces son linealmente independientes y podemos dar por asegurado al menos que $Q^{T}Q = I$:
$$
  P = Q(I)^{-1}Q^{T} = QIQ^{T} = QQ^{T}
$$
En ese sentido, si $Q$ es cuadrada, entonces:
$$
  P = I
$$
Esta última igualdad hace sentido, puesto que si $Q$ es cuadrada y sus columnas linealmente independientes^[Y, por consiguiente, de rango completo.], $\vec{b}$ estará sí o sí en $C(Q)$, de manera que:
$$
  \vec{p} = I\vec{b} = \vec{b}
$$
Por lo tanto, para $Q$ de $n \times m$ podemos resumir que:
$$
P =
\left\{
\begin{aligned}
I \text{ si } n = m \\
QQ^{T} \text{ si } n > m
\end{aligned}
\right. 
$$
Las propiedades de $P$, $P^{2} = P$ y $P^{T} = P$, también se aplican en $QQ^{T}$:
$$
\begin{aligned}
(QQ^{T})^{2} &= (QQ^{T}) \cdot (QQ^{T}) = Q(Q^{T}Q)Q^{T} = QIQ^{T} = QQ^{T} \\ \\
(QQ^{T})^{T} &= (Q^{T})^{T} Q^{T} = QQ^{T}
\end{aligned}
$$
También se hace más fácil resolver las __ecuaciones normales del método de mínimos cuadrados__ usando matrices ortogonales.

En el método de mínimos cuadrados, como estudiamos en la Clase 16, las ecuaciones normales se obtienen como:
$$
  A^{T}A \hat{x} = A^{T}\vec{b}
$$
donde $\hat{x}$ es el vector de las mejores soluciones del sistema $A\vec{x} = \vec{b}$ cuando no tiene soluciones.

Si, en vez de trabajar con una matriz $A$, lo hacemos con una $Q$ de vectores columna ortonormales, entonces:
$$
\begin{aligned}
Q^{T}Q \hat{x} &= Q^{T} \vec{b} \\
I \hat{x} &= Q^{T} \vec{b} \\
\hat{x} &= Q^{T} \vec{b}
\end{aligned}
$$
Por lo tanto, sean $\hat{x} _ {i}$ los componentes del vector $\hat{x}$, para $i = 1, \ 2, \ \cdots, \ n$; y $\vec{q} _ {j}$ los vectores columnas ortogonales de $Q$, donde $j = 1, \ 2, \ \cdots, \ m$, los primeros corresponderán a:
$$
  \hat{x} _ {i} = \vec{q} _ {i}^{T} \cdot \vec{b}
$$


# 3. Proceso de Gram-Schmidt.

Cuando tenemos un conjunto de __vectores linealmente independientes__, es posible __ortonormalizarlos__ a través de un algoritmo llamado __Proceso de Gram-Schmidt__.

Digamos que el conjunto $X = \{\vec{x} _ {1}, \ \vec{x} _ {2}, \ \cdots, \ \vec{x} _ {m}\}$ son vectores linealmente independientes; los de $U = \{\vec{u} _ {1}, \ \vec{u} _ {2}, \ \cdots, \ \vec{u} _ {m}\}$ son ortogonales; y los de $W = \{\vec{w} _ {1}, \ \vec{w} _ {2}, \ \cdots, \ \vec{w} _ {m}\}$, ortonormales.

La tarea del proceso de Gram-Schmidt es convertir a los vectores de $X$ en los de $U$ y luego en los de $W$, pero la condición es que los primeros sean linealmente independientes.

__Paso 1.__ El primer paso del proceso de Gram-Schmidt, es establecer que
$$
\vec{u} _ {1} = \vec{x} _ {1}
$$
y luego normalizamos a $\vec{u} _ {1}$ para obtener a la versión ortonormalizada de $\vec{x} _ {1}$, $\vec{w} _ {1}$.
$$
\vec{w} _ {1} = \frac{1}{||\vec{u} _ {1}||} \cdot \vec{u} _ {1}
$$
__Paso 2.__ Ahora debemos buscar a $\vec{w} _ {2}$ a partir de $\vec{x} _ {2}$, tal que $\vec{w} _ {1} \perp \vec{w} _ {2}$. Para ello, definimos a $\vec{u} _ {2}$ como la resta entre $\vec{x} _ {2}$ y la proyección de este último sobre $\vec{u} _ {1}$.
$$
\vec{u} _ {2} = \vec{x} _ {2} - \left(\vec{u} _ {1} \cdot \frac{\vec{u} _ {1}^{T}\vec{x} _ {2}}{\vec{u} _ {1}^{T}\vec{u} _ {1}}\right)
$$
El vector $\vec{u} _ {2}$ es, básicamente, el vector error que estudiamos en la Clase 15.

Ahora, veamos que la proyección de $\vec{x} _ {1}$ sobre $\vec{u} _ {1}$ la podemos simplificar de la siguiente manera:
$$
\begin{aligned}
\vec{u} _ {1} \cdot \frac{\vec{u} _ {1}^{T}\vec{x} _ {2}}{\vec{u} _ {1}^{T}\vec{u} _ {1}} =
\frac{\vec{u} _ {1} \cdot \vec{u} _ {1}^{T}}{||\vec{u} _ {1}||^{2}} \cdot \vec{x} _ {2} =
\frac{\vec{u} _ {1}}{||\vec{u} _ {1}||} \cdot \frac{\vec{u} _ {1}^{T}}{||\vec{u} _ {1}||} \cdot \vec{x} _ {2}
\end{aligned}
$$
Recordemos que $(1/||\vec{u} _ {1}||) \cdot \vec{u} _ {1} = \vec{w} _ {1}$. Por lo tanto:
$$
\vec{u} _ {1} \cdot \frac{\vec{u} _ {1}^{T}\vec{x} _ {2}}{\vec{u} _ {1}^{T}\vec{u} _ {1}} =
\vec{w} _ {1} \cdot (\vec{w} _ {1}^{T} \cdot \vec{x} _ {2})
$$
De este modo, encontramos una forma más sencilla de calcular a $\vec{u} _ {2}$:
$$
\vec{u} _ {2} = \vec{x} _ {2} - (\vec{w} _ {1}^{T} \cdot \vec{x} _ {2}) \cdot \vec{w} _ {1}
$$

Posteriormente, normalizamos a $\vec{u} _ {2}$.
$$
  \vec{w} _ {2} = \frac{1}{||\vec{u} _ {2}||} \cdot \vec{u} _ {2}
$$
__Paso 3.__ Continuamos con $\vec{w} _ {3}$, donde $\vec{w} _ {3} \perp \vec{w} _ {1}$ y $\vec{w} _ {3} \perp \vec{w} _ {2}$. Primero buscamos a $\vec{u} _ {3}$ como la resta entre $\vec{x} _ {3}$ y las proyecciones de este vector sobre $\vec{u} _ {1}$ y sobre $\vec{u} _ {3}$.
$$
\vec{u} _ {3} = \vec{x} _ {3} -
                (\vec{w} _ {1}^{T} \cdot \vec{x} _ {3}) \cdot \vec{w} _ {1} -
                (\vec{w} _ {2}^{T} \cdot \vec{x} _ {3}) \cdot \vec{w} _ {2} 
$$
para después normalizarlo, resultando en $\vec{w} _ {3}$:
$$
  \vec{w} _ {3} = \frac{1}{||\vec{u} _ {3}||} \cdot \vec{u} _ {3}
$$

Así, podemos resumir el proceso de Gram-Schmidt para los $m$ vectores de $W$ como:
$$
\begin{aligned}
  \vec{u} _ {1} &= \vec{x} _ {1}, & \vec{w} _ {1} &= \frac{1}{||\vec{u} _ {1}||} \cdot \vec{u} _ {1} \\
  \vec{u} _ {2} &= \vec{x} _ {2} - (\vec{w} _ {1}^{T} \cdot \vec{x} _ {2}) \cdot \vec{w} _ {1}, &
                   \vec{w} _ {2} &= \frac{1}{||\vec{u} _ {2}||} \cdot \vec{u} _ {2} \\
  \vec{u} _ {3} &= \vec{x} _ {3} - (\vec{w} _ {1}^{T} \cdot \vec{x} _ {3}) \cdot \vec{w} _ {1}  -
                   (\vec{w} _ {2}^{T} \cdot \vec{x} _ {3}) \cdot \vec{w} _ {2} , &
                   \vec{w} _ {3} &= \frac{1}{||\vec{u} _ {3}||} \cdot \vec{u} _ {3} \\
  \vec{u} _ {4} &= \vec{x} _ {4} - (\vec{w} _ {1}^{T} \cdot \vec{x} _ {4}) \cdot \vec{w} _ {1} -
                   (\vec{w} _ {2}^{T} \cdot \vec{x} _ {4}) \cdot \vec{w} _ {2} -
                   (\vec{w} _ {3}^{T} \cdot \vec{x} _ {4}) \cdot \vec{w} _ {3}, &
                   \vec{w} _ {4} &= \frac{1}{||\vec{u} _ {4}||} \cdot \vec{u} _ {4} \\
  &\vdots & &\vdots \\
  \vec{u} _ {m} &= \vec{x} _ {m} -
                   \sum_{i = 1}^{m - 1} (\vec{w} _ {i}^{T} \cdot \vec{x} _ {m}) \cdot \vec{w} _ {i}, &
                   \vec{w} _ {m} &= \frac{1}{||\vec{u} _ {m}||} \cdot \vec{u} _ {m}
\end{aligned}
$$


# 4. Descomposición $A = QR$.

Continuemos con los conjuntos de vectores $X$, $U$ y $W$ usados en la sección anterior.

Una consecuencia del Proceso de Gram-Schmidt, es que cada vector de $X$ es una combinación lineal de los de $W$ y viceversa. Esto significa^[Anton y Rorres (2013). _Elementary Linear Algebra. Applications Version_. Pp. 200.] que:
$$
  \text{span}(X) = \text{span}(W)
$$
Recordemos que:
$$
  \vec{w} _ {1} = \frac{1}{||\vec{u} _ {1}||} \cdot \vec{u} _ {1}
$$
Si despejamos $\vec{u} _ {1}$, entonces:
$$
  \vec{u} _ {1} = ||\vec{u} _ {1}|| \cdot \vec{w} _ {1}
$$
Y como $\vec{u} _ {1} = \vec{x} _ {1}$:
$$
  \vec{x} _ {1} = ||\vec{u} _ {1}|| \cdot \vec{w} _ {1}
$$
Del mismo modo, como $\vec{w} _ {2} = (1/||\vec{u} _ {2}||) \cdot \vec{u} _ {2}$, entonces:
$$
  \vec{u} _ {2} = ||\vec{u} _ {2}|| \cdot \vec{w} _ {2}
$$
Si reemplazamos a $\vec{u} _ {2}$ en la ecuación $\vec{u} _ {2} =   \vec{x} _ {2} - (\vec{w} _ {1}^{T} \cdot \vec{x} _ {2}) \cdot \vec{w} _ {1}$ y despejamos $\vec{x} _ {2}$ en ella, entonces:
$$
  \vec{x} _ {2} = (\vec{w} _ {1}^{T} \cdot \vec{x} _ {2}) \cdot \vec{w} _ {1} + ||\vec{u} _ {2}|| \cdot \vec{w} _ {2}
$$
En otras palabras:
$$
\begin{aligned}
\vec{x} _ {1} &= ||\vec{u} _ {1}|| \cdot \vec{w} _ {1} \\
\vec{x} _ {2} &= (\vec{w} _ {1}^{T} \cdot \vec{x} _ {2}) \cdot \vec{w} _ {1} + ||\vec{u} _ {2}|| \cdot \vec{w} _ {2} \\
\vec{x} _ {3} &= (\vec{w} _ {1}^{T} \cdot \vec{x} _ {3}) \cdot \vec{w} _ {1} + (\vec{w} _ {2}^{T} \cdot \vec{x} _ {3}) \cdot \vec{w} _ {2} +
                ||\vec{u} _ {3}|| \cdot \vec{w} _ {3} \\
&\vdots \\
  \vec{x} _ {m} &= \sum_{i = 1}^{m - 1} \left[(\vec{w} _ {i}^{T} \cdot \vec{x} _ {m}) \cdot \vec{w} _ {i}\right] +
                   ||\vec{u} _ {m}|| \cdot \vec{w} _ {m}
\end{aligned}
$$
donde $(\vec{w} _ {i}^{T} \cdot \vec{x} _ {m})$ y $||\vec{u} _ {m}||$ son __escalares__.

Veamos esta idea en matrices. Digamos que $A$ es una matriz de $n \times m$ con columnas linealmente independientes, o de rango$(A) = m$, y las ortonormalizamos usando el proceso de Gram-Schmidt, obteniendo a $Q$ también de $n \times m$ y de rango$(Q) = m$.

Sea $A = [\vec{a} _ {1} \ \vec{a} _ {2} \ \cdots \ \vec{a} _ {m}]$, sabemos que coincide que span$(\vec{a} _ {1}, \ \vec{a} _ {2}, \ \cdots, \ \vec{a} _ {m}) = C(A)$. De igual modo, si $Q = [\vec{q} _ {1} \ \vec{q} _ {2} \ \cdots \ \vec{q} _ {m}]$, entonces span$(\vec{q} _ {1}, \ \vec{q} _ {2}, \ \cdots, \ \vec{q} _ {m}) = C(Q)$. Por lo tanto, a partir de lo que estudiamos anteriormente:
$$
  C(A) = C(Q)
$$
Es decir, cada vector columna de $A$ es una combinación lineal de los $Q$.

Supongamos que $U$ es una matriz que consiste de las columnas ortogonalizadas de $A$. Que $C(A) = C(Q)$ significa que:
$$
\begin{aligned}
\vec{a} _ {1} &= ||\vec{u} _ {1}|| \cdot \vec{q} _ {1} \\
\vec{a} _ {2} &= (\vec{q} _ {1}^{T} \cdot \vec{a} _ {2}) \cdot \vec{q} _ {1} + ||\vec{u} _ {2}|| \cdot \vec{q} _ {2} \\
&\vdots \\
\vec{a} _ {m} &= (\vec{q} _ {1}^{T} \cdot \vec{a} _ {m}) \cdot \vec{q} _ {1} + (\vec{q} _ {2}^{T} \cdot \vec{a} _ {m}) \cdot \vec{q} _ {2} +
                 \cdots + (\vec{q} _ {m-1}^{T} \cdot \vec{a} _ {m}) \cdot \vec{q} _ {m-1} + ||\vec{u} _ {m}|| \cdot \vec{q} _ {m}
\end{aligned}
$$
Las combinaciones lineales de la derecha de cada vector columna $\vec{a}$ son equivalentes a la multiplicación entre una matriz y las componentes de un vector:
$$
\begin{aligned}
\vec{a} _ {1} &= \begin{bmatrix} \vec{q} _ {1} \end{bmatrix} \cdot \begin{bmatrix} ||\vec{u} _ {1}|| \end{bmatrix} \\
\vec{a} _ {2} &= \begin{bmatrix} \vec{q} _ {1} & \vec{q} _ {2} \end{bmatrix} \cdot
                 \begin{bmatrix} \vec{q} _ {1}^{T} \cdot \vec{a} _ {2} \\ ||\vec{u} _ {2}|| \end{bmatrix} \\
\vdots \\
\vec{a} _ {m} &= \begin{bmatrix} \vec{q} _ {1} & \vec{q} _ {2} & \cdots & \vec{q} _ {m - 1} & \vec{q} _ {m}\end{bmatrix} \cdot
                 \begin{bmatrix}
                   \vec{q} _ {1}^{T} \cdot \vec{a} _ {m} \\
                   \vec{q} _ {2}^{T} \cdot \vec{a} _ {m} \\
                   \vdots \\
                   \vec{q} _ {m - 1}^{T} \cdot \vec{a} _ {m} \\
                   ||\vec{u} _ {m}||
                 \end{bmatrix}
\end{aligned}
$$
Los vectores del lado derecho los denotaremos como $\vec{r} _ {i}$, para cada $i = 1, \ 2, \ \cdots, \ m$:
$$
\vec{r} _ {1} = \begin{bmatrix} ||\vec{u} _ {1}|| \end{bmatrix} \quad
\vec{r} _ {2} = \begin{bmatrix} \vec{q} _ {1}^{T} \cdot \vec{a} _ {2} \\ ||\vec{u} _ {2}|| \end{bmatrix} \quad
\cdots \quad
\vec{r} _ {m} = \begin{bmatrix}
                  \vec{q} _ {1}^{T} \cdot \vec{a} _ {m} \\
                  \vec{q} _ {2}^{T} \cdot \vec{a} _ {m} \\
                  \vdots \\
                  \vec{q} _ {m - 1}^{T} \cdot \vec{a} _ {m} \\
                  ||\vec{u} _ {m}||
                \end{bmatrix}
$$
Reemplazando en las ecuaciones de arriba:
$$
\begin{aligned}
\vec{a} _ {1} &= \begin{bmatrix} \vec{q} _ {1} \end{bmatrix} \cdot \vec{r} _ {1} \\
\vec{a} _ {2} &= \begin{bmatrix} \vec{q} _ {1} & \vec{q} _ {2} \end{bmatrix} \cdot \vec{r} _ {2} \\
\vdots \\
\vec{a} _ {m} &= \begin{bmatrix} \vec{q} _ {1} & \vec{q} _ {2} & \cdots & \vec{q} _ {m - 1} & \vec{q} _ {m}\end{bmatrix} \cdot \vec{r} _ {m}
\end{aligned}
$$
Los vectores $\vec{r} _ {i}$ podemos considerarlos como las columnas de una matriz muy relevante que se denota como $R$:
$$
  R = \begin{bmatrix} \vec{r} _ {1} & \vec{r} _ {2} & \cdots & \vec{r} _ {m} \end{bmatrix}
$$
La matriz $R$ es relevante porque las combinaciones lineales del último conjunto de ecuaciones de arriba corresponden a la multiplicación entre $Q$ y las columnas de $R$, que es lo mismo a calcular el producto $QR$ y con ellas obtenemos a las columnas de $A$. Es decir, podemos factorizar a esta última matriz como:
$$
A = QR
$$
y a esta ecuación se la conoce como __Descomposición__ $A = QR$.

En general, si tenemos una __matriz $A$ de columnas linealmente independientes__ (i.e, de rango columna completo), es posible factorizarla como el producto entre $Q$, una matriz con las columnas ortonormalizadas de $A$; y $R$, cuyas columnas contienen las constantes de las combinaciones lineales de $Q$.

## 4.1 Explicación de la Matriz $R$ en $A = QR$.

La matriz $R$ se caracteriza por ser __cuadrada__, __invertible__ y __triangular superior__, donde:
$$
R =
\begin{bmatrix}
||\vec{u} _ {1} || & \vec{q} _ {1}^{T} \cdot \vec{a} _ {2} & \cdots & \vec{q} _ {1}^{T} \cdot \vec{a} _ {m} \\
0 & ||\vec{u} _ {2}|| & \cdots & \vec{q} _ {2}^{T} \cdot \vec{a} _ {m} \\
\vdots & \vdots & \ddots & \vdots \\
0 & 0 & \cdots & ||\vec{u} _ {m} ||
\end{bmatrix}
$$
La diagonal principal de la matriz $R$ está compuesta de las magnitudes de los vectores ortogonales $\vec{u} _ {i}$, para $i = 1, \ 2, \ \cdots, \ m$ y la parte inferior a ella solo consiste de __ceros__.

Ahora, recordemos que las columnas de $Q$ son linealmente independientes al ser ortogonales, por lo tanto se cumple $Q^{T}Q = I$. En ese sentido, podemos obtener a la matriz $R$ multiplicando a la ecuación $A = QR$ por $Q^{T}$:
$$
\begin{aligned}
  A &= QR \\
  Q^{T}A &= Q^{T}QR \\
  Q^{T}A &= IR \\
  Q^{T}A &= R
\end{aligned}
$$
Veamos que $R$ será __cuadrada__ porque $Q$ y $A$ son de igual dimensión. Si $Q$ y $A$ son de $n \times m$, entonces $Q^{T}$ es de $m \times n$. Por lo tanto, $Q^{T}A = R$ será de $n \times n$.

Por otra parte, debido a que las columnas de $A$ y de $Q$ son linealmente independientes y a que $Q^{T}A$ conlleva a una matriz cuadrada, la matriz $R$ siempre será __invertible__. Si lo evaluamos por su rango, será de __rango completo__.

Además, la multiplicación $Q^{T}A$ nos ayuda a entender por qué las entradas que están por debajo de __la diagonal de $R$ son iguales a cero__.

$$
\begin{aligned}
Q^{T}A &= R \\
\begin{bmatrix}
\vec{q} _ {1}^{T} \\ \vec{q} _ {2}^{T} \\ \vdots \\ \vec{q} _ {m}^{T}
\end{bmatrix}
\cdot
\begin{bmatrix}
\vec{a} _ {1} & \vec{a} _ {2} & \cdots & \vec{a} _ {m}
\end{bmatrix} &= R \\
\begin{bmatrix}
\vec{q} _ {1}^{T} \cdot \vec{a} _ {1} & \vec{q} _ {1}^{T} \cdot \vec{a} _ {2} & \cdots & \vec{q} _ {1}^{T} \cdot \vec{a} _ {m} \\
\vec{q} _ {2}^{T} \cdot \vec{a} _ {1} & \vec{q} _ {2}^{T} \cdot \vec{a} _ {2} & \cdots & \vec{q} _ {2}^{T} \cdot \vec{a} _ {m} \\
\vdots & \vdots & \ddots & \vdots \\
\vec{q} _ {m}^{T} \cdot \vec{a} _ {1} & \vec{q} _ {m}^{T} \cdot \vec{a} _ {2} & \cdots & \vec{q} _ {m}^{T} \cdot \vec{a} _ {m}
\end{bmatrix}
\end{aligned}
$$
Todos los productos punto que están debajo de la diagonal principal de $R$ son entre __vectores ortogonales__. Por ejemplo, $\vec{q} _ {2}$ es la versión ortonormal de $\vec{u} _ {2}$ la que, a su vez, es ortogonal a $\vec{a} _ {1}$. Aquello explica por qué $\vec{q} _ {2}^{T} \cdot \vec{a} _ {1} = 0$ y por el mismo motivo los demás productos puntos que están en esa zona, son iguales a ese valor.


## 4.2 Aplicación en el Método de Mínimos Cuadrados.

La descomposición $A = QR$ también podemos usarla para resolver las ecuaciones normales del método de mínimos cuadrados:
$$
  A^{T}A \hat{x} = A^{T} \vec{b}
$$
Recordemos que el método de mínimos cuadrados trata con el problema de que en $A$ de $n \times m$, $n > m$. Por lo tanto existe la posibilidad de que $A$ sea de rango$(A) = m$. De ser el caso, podemos factorizarla como $A = QR$ y podemos reemplazar el producto $QR$ en las ecuaciones normales:
$$
\begin{aligned}
  (QR)^{T} \cdot QR \hat{x} &= (QR)^{T} \vec{b} \\
  (R^{T}Q^{T}QR) \hat{x} &= R^{T}Q^{T} \vec{b} \\
  R^{T}IR \ \hat{x} &= R^{T}Q^{T} \vec{b} \\
  R^{T}R \hat{x} &= R^{T}Q^{T} \vec{b}
\end{aligned}
$$
Las ecuaciones normales podemos trabajarlas de esa manera o es posible multiplicar esta ecuación por $(R^{T})^{-1}$, ya que al ser $R$ cuadrada e invertible, entonces su transpuesta también tiene una inversa, donde $(R^{T})^{-1} = (R^{-1})^{T}$.
$$
\begin{aligned}
  ((R^{T})^{-1} R^{T}) R \hat{x} &= ((R^{T})^{-1} R^{T}) Q^{T} \vec{b} \\
  I R \hat{x} &= I Q^{T} \vec{b} \\
  R \hat{x} &= Q^{T} \vec{b}
\end{aligned}
$$
No obstante, podemos ir más allá multiplicando a esta última por $R^{-1}$:
$$
\begin{aligned}
  R^{-1}R \hat{x} &= R^{-1} Q^{T} \vec{b} \\
  I \hat{x} &= R^{-1} Q^{T} \vec{b} \\
  \hat{x} &= R^{-1} Q^{T} \vec{b}
\end{aligned}
$$

La principal ventaja de trabajar con $A = QR$, es que toma menos tiempo resolver las ecuaciones normales con $R$ al ser triangular superior que al trabajar solo con $A^{T}A \hat{x} = A^{T} \vec{b}$.

