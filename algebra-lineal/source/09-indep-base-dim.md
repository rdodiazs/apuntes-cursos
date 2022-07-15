---
title: Clase 9. Independencia, Base y Dimensión.
subtitle: Curso 'Linear Algebra' del MIT.
fontsize: 12pt
geometry: [margin=1in]
header-includes:
  - \usepackage{setspace} \onehalfspacing
  - \usepackage{graphicx}
  - \usepackage{amsmath}
  - \usepackage{amssymb}
---

Para entender varios de los conceptos vistos hasta ahora, hemos tenido que interactuar con otros explícita e implícitamente. Estos corresponden a los de __independencia lineal__, __sistema generador de un (sub)espacio vectorial__ (_linear span of a space_), __base de un subespacio__ (_basis of a subspace_) y la __dimensión de un subespacio vectorial__. Todos ellos se relacionan entre sí y nos entregan información muy relevante para resolver $Ax = b$.


## 9.1. Independencia Lineal.

Algo que no abordamos en clases anteriores es que en $Ax = 0$, si $A$ es de $n \times m$ dimensiones y $n < m$ (i.e, si tenemos más incógnitas que ecuaciones), podemos garantizar que al menos una solución $x_{i}$ donde $i = \{1, \ 2, \ \cdots, \ m\}$ no será igual a cero.

Esto se debe a que, al aplicar el método de eliminación de Gauss en esta matriz $A$, __siempre habrá al menos una columna libre__, por lo que las soluciones a $Ax = 0$ (i.e, el $N(A)$) no serán todas iguales a cero.

Recordemos que las __columnas libres__ en $U$ son, a su vez, las __linealmente dependientes__ en $A$. El caso anterior nos lleva a la definición de la __Independencia Lineal__.

Un conjunto de vectores $\vec{x} _ {1}, \ \vec{x} _ {2}, \ \cdots, \ \vec{x} _ {n}$ son __linealmente independientes__ si:
$$
  \sum_{i = 1}^{n} c _ {i} \cdot \vec{x} _ {i} \neq \vec{0} \quad (\text{excepto para } c_{i} = 0)
$$
Es decir, si ninguna combinación lineal resulta en el vector cero salvo cuando todos los escalares son iguales a cero, entonces los vectores son linealmente independientes entre sí. Si ocurre lo contrario en al menos una combinación, quiere decir que son linealmente dependientes.

Un caso donde podemos asegurar que un conjunto de vectores es linealmente dependiente, es cuando uno de ellos es $\vec{0}$. Por ejemplo, digamos que tenemos los vectores $\vec{x} _ {1}$ y $\vec{x} _ {2} = \vec{0}$; y los escalares $c _ {1} = 0$ y $c _ {2} = 6$. Su combinación lineal será:
$$
  c _ {1} \cdot \vec{x} _ {1} + c _ {2} \cdot \vec{x} _ {2} = 0 \cdot \vec{x} _ {1} + 6 \cdot \vec{0} = \vec{0}
$$
__Ejercicio.__ \quad Explique por qué los vectores $\vec{v} _ {1}$, $\vec{v} _ {2}$ y $\vec{v} _ {3}$ que están en $\mathbb{R}^{2}$, son linealmente dependientes. 

__Solución.__ \quad Como están en $\mathbb{R}^{2}$, digamos que $\vec{v} _ {1} = \langle a_{1, 1}, \ a_{2, 1}\rangle$, $\vec{v} _ {2} = \langle a_{1, 2}, \ a_{2, 2}\rangle$ y $\vec{v} _ {3} = \langle a_{1, 3}, \ a_{2, 3}\rangle$ son los vectores columna de una matriz $A$.
$$
A =
\begin{bmatrix}
a_{1, 1} & a_{1, 2} & a_{1, 3} \\
a_{2, 1} & a_{2, 2} & a_{2, 3}
\end{bmatrix}
$$
Anteriormente señalamos que cuando la cantidad de filas de una matriz de coeficientes $A$ es menor a su cantidad de columnas, podemos garantizar que al menos una de las soluciones de $Ax = 0$ será distinta de cero. Por lo tanto, si $\vec{x} = \langle c_{1}, \ c_{2}, \ c_{3} \rangle$ para todo $c_{i} \neq 0$, entonces:
$$
  Ax = c_{1} \cdot \begin{bmatrix} a_{1, 1} \\ a_{2, 1} \end{bmatrix} +
       c_{2} \cdot \begin{bmatrix} a_{1, 2} \\ a_{2, 2} \end{bmatrix} +
       c_{3} \cdot \begin{bmatrix} a_{1, 3} \\ a_{2, 3} \end{bmatrix} 
     = \sum_{i = 1}^{3} c_{i} \cdot \vec{v} _ {i}
     = \vec{0}
$$
En consecuencia, $\vec{v} _ {1}$, $\vec{v} _ {2}$ y $\vec{v} _ {3}$ son linealmente dependientes.

### 9.1.1 Independencia Lineal de las Columnas de una Matriz $A$.

A partir de este ejercicio podemos generalizar la definición de independencia lineal para las columnas de una matriz. 

Sean $\vec{v} _ {1}, \ \vec{v} _ {2}, \ \cdots, \vec{v} _ {n}$ los vectores columna de una matriz $A$. Si en $Ax = 0$, $\vec{x} = \vec{0}$, entonces las columnas de $A$ son linealmente independientes. Serán dependientes si al menos un $x_{i} \neq 0$.

\begin{table}[hbt!]
\centering

\begin{tabular}{c c c}
\hline
& \multicolumn{2}{c}{Linealmente} \\
\cline{2-3}
 & Independientes & Dependientes \\
\hline
$Ax = 0$ & $\vec{x} = \vec{0}$ & Al menos un $x_{i} \neq 0$ \\
\hline
\end{tabular}

\end{table}

No olvidemos que $\vec{x} = N(A)$ en $Ax = 0$. Por lo tanto, cuando las columnas de $A$ son __linealmente independientes__, significa que:
$$
  N(A) = \vec{0}
$$

### 9.1.2 Independencia Lineal y el Rango de una Matriz.

Conocer el rango de una matriz también nos entrega información sobre la (in)dependencia de las columnas de una matriz.

Si el rango de una matriz de $n \times m$ es $r = m$, significa que todas sus columnas son linealmente independientes. En cambio, si $r < m$, entonces al menos una de ellas es linealmente dependiente.

Con esta información, modifiquemos la tabla que señalamos anteriormente.

\begin{table}[hbt!]
\centering

\begin{tabular}{c c c}
\hline
& \multicolumn{2}{c}{Linealmente} \\
\cline{2-3}
 & Independientes & Dependientes \\
\hline
$Ax = 0$ & $\vec{x} = \vec{0}$ & Al menos un $x_{i} \neq 0$ \\
Rango de $A$ & $r = m$ & $r < m$ \\
\hline
\end{tabular}

\end{table}

## 9.2 Sistema Generador de un (Sub)Espacio Vectorial.

Cuando señalamos que "la combinación lineal de un conjunto de vectores _producen_ un (sub)espacio vectorial", es más frecuente referirse a aquello como que "el conjunto de vectores _generan_ un (sub)espacio vectorial".

Un __sistema generador de un (sub)espacio vectorial__ es el conjunto de vectores $\vec{v} _ {1}, \ \vec{v} _ {2}, \ \cdots, \ \vec{v} _ {n}$ cuyas combinaciones lineales producen dicho (sub)espacio. Es una forma más resumida de referirnos a aquel proceso.

En inglés (y, en ciertas ocasiones, en español también) al verbo "generar" se lo menciona como "_span_ o _spanning of a space_" y al "espacio generado" como "_linear span_".

Un ejemplo aplicado de este concepto serían: "Las columnas de una matriz _generan_ el espacio columna" o "Sea $S$ el espacio _generado_ por un conjunto de vectores" donde $S$ son todas las combinaciones lineales entre ellos.


## 9.3 La Base de un (Sub)Espacio Vectorial.

A partir de lo visto en las dos secciones anteriores, podemos definir qué es y cuándo un grupo de vectores es una __Base__.

Un conjunto de vectores $\vec{v} _ {1}, \ \vec{v} _ {2}, \ \cdots, \ \vec{v} _ {n}$ constituyen una __base__ (_basis_, en inglés) si:

1. Son linealmente independientes.
2. Generan un (sub)espacio vectorial.

Un grupo de vectores puede generar un subespacio vectorial, pero no necesariamente ser linealmente independientes. Para comprobar que lo sean, podemos expresarlos como vectores columna de una matriz, llevar esta última a una de forma escalonada reducida e identificar si todas las columnas son pivotes o si algunas son libres.

Ahora bien, para que todas las columnas de una matriz sean __linealmente independientes__, como mínimo debe ser __cuadrada__. Si se cumplen ambas condiciones, entonces la matriz es de __rango completo__ y, por consiguiente:

1. La matriz es invertible.
2. $Ax = b$ tiene una única solución, implicando que las columnas de $A$ generan el $C(A)$ (i.e, un subespacio) que es, a su vez, el $N(A) = \vec{0}$.

Por lo tanto, un conjunto de $n$ vectores en $\mathbb{R}^{n}$ dimensiones __es una base__ si la __matriz de $n \times n$__ que forman como vectores columna, es __invertible__.

Es decir, si las columnas de una matriz generan el espacio columna y, además, son independientes, entonces son __una base para dicho espacio columna__.

## 9.4 Dimensión de un (Sub)Espacio.

Un hecho que se desprende de la definición de una base, es que no es única. A pesar de que un conjunto de vectores debe cumplir dos condiciones, aún así pueden ser bastantes y con una variedad de componentes. Pero todos ellos tienen una característica similar: __La cantidad de vectores que componen una base es igual al espacio (i.e, el número de dimensiones) de éstos__.

Por ejemplo, para que un grupo de vectores en el espacio $\mathbb{R}^{3}$ sea una base, éstos tendrán que ser tres, ni más ni menos.

El __número que representa la cantidad de vectores de una base__, es la __Dimensión de un subespacio__.

### 9.4.1 Dimensión del Espacio Columna de una Matriz.

A continuación tenemos la siguiente matriz $A$:
$$
A =
\begin{bmatrix}
1 & 2 & 3 & 1 \\
1 & 1 & 2 & 1 \\
1 & 2 & 3 & 1
\end{bmatrix}
$$
Veamos que solo la primera y segunda columna de $A$ son linealmente independientes, lo que significa que el rango de $A$ es $r = 2$, el cual nos entrega relevante información sobre el $C(A)$.

Si tomamos las columnas de $A$ por separado (i.e, como vectores columna), con cada par de ellas podemos formar una base, puesto que generan el $C(A)$ y son linealmente independientes entre sí. No obstante, cuando consideramos a tres o las cuatro, dejan de constituir una base.

En otras palabras, __el rango de una matriz es, a su vez, la dimensión de su espacio columna__.
$$
  dim(C(A)) = r
$$
Por lo que el $C(A)$ de este caso, es de dos dimensiones. Y no solo para las columnas de forma individual, sino que también para combinaciones lineales de ella.

Veamos los siguientes ejemplos:
$$
\begin{bmatrix}
2 \\ 2 \\ 2
\end{bmatrix}
\qquad
\begin{bmatrix}
7 \\ 5 \\ 7
\end{bmatrix}
$$
El primer vector es el doble de la primera o la cuarta columna de $A$ o la suma de estas dos, mientras que el segundo es la suma de todas las columnas de dicha matriz. Es decir, son combinaciones lineales de $A$, por lo que pertenecen o generan el $C(A)$ y, por otra parte, son linealmente independientes. Por lo tanto, también constituyen una base y no necesitamos otro vector más. Esto nos indica, otra vez, que el $C(A)$ es de dos dimensiones.

### 9.4.2 Dimensión del Espacio Nulo de una Matriz.

Sigamos con la anterior matriz $A$. Recordemos que el $N(A)$ son las soluciones a $Ax = 0$. Para encontrarlas, tenemos que identificar las columnas pivotes y libres; luego buscamos las soluciones especiales.

Debido a que el rango de $A$ es $r = 2$ y la matriz es de $3 \times 4$ dimensiones, significa que tenemos dos columnas libres y, por consiguiente, el $N(A)$ se genera de dos soluciones especiales.

Al pasar de $A \to U \to R$, obtendremos las siguientes soluciones especiales:
$$
\begin{bmatrix}
-1 \\ -1 \\ 1 \\ 0
\end{bmatrix}
\qquad
\begin{bmatrix}
-1 \\ 0 \\ 0 \\ 1
\end{bmatrix}
$$
Ya sabemos que ambos vectores generan el $N(A)$. A eso podemos sumarle que son linealmente independientes entre sí, lo que significa que conforman una base para este subespacio vectorial y, como no necesita más vectores, quiere decir que es de dos dimensiones.

En términos generales, la __dimensión del espacio nulo__ de una matriz de $n \times m$ corresponde a la __cantidad de columnas libres__ (i.e, las linealmente dependientes) que esta tiene. Es decir:
$$
  dim(N(A)) = m - r \quad (r = \text{rango de } A)
$$
