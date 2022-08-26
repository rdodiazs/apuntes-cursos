---
title: Clase 1. ¿Qué es la Computación?
subtitle: MIT 6.0001. Introduction to Computer Science and Programming in Python.
lang: es
abstract: \noindent Esta primera clase es una introducción tanto a lo que es la computación, su historia y cómo funciona un programa en sus partes internas, así como al lenguaje de programación Python.
documentclass: article
geometry: margin=1in
fontsize: 12pt
header-includes:
  - \usepackage{setspace} \onehalfspacing
  - \usepackage{parskip}
  - \usepackage{graphicx}
---

# 1. Principales tareas de un computador.

Un computador realiza dos principales tareas: La primera es __calcular__ (o computar). Algunos cálculos vienen incorporados en el lenguaje computacional, tales como las operaciones aritméticas; pero también es posible __programarlas__ por nosotros mismos/as, definiéndolas de manera tal que el computador pueda realizarlas. Algo a tener en cuenta, es que __solo hará lo que le digamos y de forma literal__.

La otra tarea que realiza un computador, es __almacenar información__. Por ejemplo, los cálculos que va realizando, después los va guardando en su memoria.


# 2. Pensamiento Computacional.

Para saber cómo darle una instrucción a un computador, antes debemos entender el tipo de conocimiento que sigue.

Los computadores operan a partir de lo que en epistemología se conoce como __Conocimiento Imperativo__ (o Procedimental), que es aquel que se expresa por medio de reglas o __instrucciones__.

Por ejemplo, si queremos calcular la raíz cuadrada de un número $x$ en un computador, no lo hará señalándole que "es un número $y$ tal que $y \cdot y = x$"^[Esto se conoce como __Conocimiento Declarativo__ y se compone de afirmaciones de hecho (_statement of facts_).]. Más bien, tenemos que darle instrucciones para que lo haga. Usemos las definidas (aparentemente) por el matemático griego Herón de Alejandría:

1. Comience con un supuesto $s_{0}$.
2. Si $s_{0} \cdot s_{0}$ es lo suficientemente cercano a $x$, pare y señale que $s_{0}$ es la respuesta.
3. En caso contrario, cree un nuevo supuesto $s_{1}$ promediando a $s_{0}$ con $x/s_{0}$. Es decir:
$$
  s_{1} = \frac{s_{0} + (x/s_{0})}{2}
$$
4. Repita el paso 2, pero usando a $s_{1}$ como su nuevo supuesto.

Al seguir estos pasos, veremos que el resultado irá aproximándose al valor real de la raíz cuadrada, aunque nunca será igual a éste.

El conjunto de instrucciones que acabamos de ver, consistió de tres partes:

- Una secuencia de pasos simples.
- Un flujo de control $\rightarrow$ Cada paso se ejecuta siguiendo un orden.
- Un medio para determinar cuándo debe parar (o "converger") el proceso.

Una secuencia finita de instrucciones como la vista para calcular una raíz cuadrada, recibe el nombre de __Algoritmo__. Se caracteriza por describir un cálculo (_computation_) que cuando se ejecuta sobre un conjunto de entradas (_inputs_), pasa por un conjunto de estados bien definidos produciendo un resultado (_output_).

En otras palabras, un __algoritmo__ es una __descripción no ambigüa de cómo realizar un cálculo__. Podemos entenderlo como una receta, pero con pruebas para decidir cuándo un paso está completo o para saltar de una instrucción a otra, entre otras particularidades.


# 3. Instrucciones como Procesos Mecánicos.

Históricamente, las secuencias de instrucciones comenzaron a materializarse en __Computadores de Programa Fijo__ (_fixed-program computers_). Estas máquinas eran diseñadas para __realizar una tarea específica__ y solo era posible modificarlas cambiando todo su circuito por uno que hiciera la funcionalidad de interés.

Posteriormente, se crearon los __Computadores de Programa Almacenado__ (_stored-program computers_), los cuales poseen una memoria para __guardar secuencias de instrucciones__ las que, después, son ejecutadas por un __intérprete__. Es decir, el conjunto de pasos ya no viene fijo a la máquina sino que uno se lo da, de manera que es posible modificar su funcionalidad sin necesidad de cambiar su circuito.

La base de los computadores que usamos en la actualidad proviene, en términos generales, de los de programa fijo y los de programa almacenado. Veamos ahora la arquitectura básica de este último.

## 3.1 Arquitectura básica de un Computador de Programa Almacenado.

Un computador de programa almacenado suele estar construido a partir de la siguiente arquitectura básica^[Se conoce también como Arquitectura de Von Neumann.]:

\begin{figure}[hbt!]
\centering
\includegraphics[scale=0.6]{img/stored-prog-comp-arch.jpg}
\end{figure}

donde:

- __Memoria__: Almacena datos y secuencia de instrucciones (también interpretados como datos).
- __Unidad Aritmética Lógica__: Realiza operaciones aritméticas y a nivel de bits (_bitwise operations_).
- __Unidad de Control__: Contiene al __Contador de Programa__, que indica el lugar en la memoria de la siguiente instrucción a ser ejecutada.
- __Dispositivos de Entrada y Salida__: También conocidos como __periféricos__, son aquellos con los que nos comunicamos con un computador (e.g, el teclado [entrada], el monitor [salida], etc).

En particular, el contador de programa toma la ubicación en la memoria de la primera instrucción. Luego, ésta se ejecuta en la unidad aritmética lógica y, al terminar, vuelve a la memoria. En ese momento, el contador asciende en una unidad (i.e, $+ 1$) y continúa con la siguiente instrucción. Al finalizar la secuencia completa, se obtiene una respuesta en el dispositivo de salida correspondiente.

El contador de programa opera de forma lineal o secuencial. No obstante, recordemos que algunas instrucciones pueden contener pruebas, lo que determina el lugar de la memoria al cual apuntará, según si se cumple o no la condición.

Lo relevante del computador de programa almacenado, es que la secuencia de instrucciones parte siendo dato en la memoria y lo es otra vez al terminar su ejecución, lo que nos permite modificarlo como y cuándo queramos.

Todas las instrucciones que creamos en un computador de programa almacenado se hacen sobre la base de __instrucciones primitivas predefinidas__, las cuales son:

- Operaciones aritméticas y lógicas.
- Evaluar pruebas.
- Mover y copiar datos de un lugar de la memoria a otro.

Por otra parte, las instrucciones son ejecutadas por un programa especial llamado __Intérprete__, el cual usa pruebas para cambiar el __flujo de control__ y se detiene cuando ya se realizaron todas.


# 4. Programa Computacional.

Un __algoritmo__, o secuencia de instrucciones, se implementa en un computador a partir de un __Programa Computacional__, el cual se escribe usando un __Lenguaje de Programación__.

En 1936, el matemático inglés __Alan Turing__ demostró que es posible programar (_computing_) cualquier secuencia de pasos a partir de __seis instrucciones primitivas básicas__: mover a la izquierda, a la derecha, leer, escribir, escanear y parar/hacer nada.

En la actualidad podemos escribir programas usando más operaciones primitivas de las señaladas por Turing. No obstante, su planteamiento sigue sosteniéndose en el hecho de que es posible escribir una misma serie de instrucciones en varios lenguajes a la vez^[La diferencia se da en que, en ocasiones, un programa es más fácil escribirlo en un lenguaje que en otro, pero la posibilidad se mantiene en ambos.]. A ésto se lo conoce como __Completitud de Turing__.


## 4.1 Entendiendo los Lenguajes de Programación.

En este curso trabajaremos con el lenguaje de programación __Python__, pero lo usaremos más de forma práctica para entender lo que iremos estudiando en las clases.

En general, todo lenguaje de programación se constituye de:

- __Constructos Primitivos__: Elementos más simples disponibles en un lenguaje.
- __Sintaxis__: Define si una expresión construida de constructos primitivos está bien formulada o no.
- __Semántica Estática__: Evalúa si una expresión con sintaxis válida tiene sentido.
- __Semántica Completa__: La interpretación de la expresión que es sintácticamente correcta y no tiene errores de semántica estática.

Los constructos primitivos en Python son los tipos de datos como los numéricos (`int`, `float` y `complex`) y cadenas de caracteres (`str`), por mencionar algunos; y los tipos de operadores (aritméticos, de asignación, de comparación, etc).

A partir de los constructos primitivos podemos escribir __expresiones__. Éstos son una combinación compleja pero sintácticamente legal de los primeros, los cuales regresan un nuevo valor.

En Python (y probablemente en cualquier otro lenguaje de programación), la siguiente expresión es sintácticamente válida:

```
>>> 3+2
5
```

Sin embargo, si reemplazamos el operador de adición `+` con un espacio en blanco, obtenemos un __error de sintaxis__.

```
>>> 3 2
  File "<stdin>", line 1
    3 2
      ^
SyntaxError: invalid syntax
```

La __sintaxis__ en un lenguaje de programación podemos entenderlo como el __conjunto de reglas__ sobre la __forma__ de escribir expresiones. El ejemplo de arriba entrega una error porque está determinado en Python que no podemos escribir dos números con un espacio entre ellos.

Es un tanto similar a la sintaxis del lenguaje con el que nos comunicamos. La oración "perro cama plato" es sintácticamente inválida porque, en el idioma español, debe consistir de sustantivos y al menos un verbo. Un ejemplo válido sería, más bien, "perro dormir plato".

También es posible que escribamos una instrucción cuya sintaxis sea válida, pero de igual el lenguaje nos regrese un error porque para éste no tiene sentido, como el que vemos a continuación:

```
>>> 3+"hola"
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: unsupported operand type(s) for +: 'int' and 'str'
```

La sintaxis de la expresión `3+"hola"` es válida, pero para Python la adición entre un valor de tipo numérico (`int` o entero) y uno de cadena de caracteres (`str`), es incompatible. Esto se conoce como un __error de semántica estática__.

Usando el español, un ejemplo de error de semántica estática sería la oración "tú estoy durmiendo". Su sintaxis es correcta, pero no tiene sentido el "estoy", ya que está en segunda persona. Lo correcto sería escribirlo como "tú estás durmiendo".

Python siempre nos señalará y de forma explícita si cometimos un error de sintaxis. En los de semántica estática, como vimos, será un tanto más implícito, pero __nunca lo hará__ cuando es un __error de semántica completa__.

Un __error de semántica completa__  es aquel donde se obtiene un __resultado que no era el de interés__ a pesar de que la expresión es sintácticamente válida y su semántica estática hace sentido. Por ejemplo, cuando un programa se bloquea (_crashes_), entra en un búcle (_loop_) infinito o, simplemente, cuando la respuesta es distinta a la esperada.

Recordemos que un computador ejecuta de forma literal lo que uno le instruye. Por lo tanto, cuando nos enfrentamos a un error de semántica completa tenemos que revisar el código fuente para identificar el problema y depurarlo (_debuging_).


# 5. Python.

Un programa escrito en Python corresponde a una secuencia de __definiciones__ que son evaluadas y __comandos__ que instruyen lo que se debe hacer. Estos últimos son ejecutados por el intérprete del lenguaje en una __shell__.

Es posible escribir los comandos de Python directamente en la shell o por medio de un archivo de texto, conocido como __script__ y que llevan la extensión `.py`.

Por ejemplo, el siguiente programa llamado `saludo.py` consiste del código que vemos a continuación:

```python
#!/usr/bin/env python3
print("¡Hola! :)")
```

Para ejecutar `saludo.py`, usamos el comando:

```
python saludo.py
```

Obteniendo como respuesta:

```
¡Hola! :)
```

En este ejemplo usamos la función `print()` para mostrar el resultado en la consola. Si no la utilizamos __al trabajar con un script__, no aparecerá nada. Esto no es necesario cuando lo hacemos directamente desde la shell, pero esta aplicación no es la mejor opción cuando estamos creando programas más complejos.

## 5.1 Objetos.

La programación en Python se realiza, principalmente, manipulando __Objetos__ (_objects_). Cada uno de ellos tiene definido un __tipo__ (_type_), el cual determina las operaciones que podemos hacer con ellos.

Los objetos se dividen en dos tipos:

- __Escalares__: Son los __objetos más básicos__ del lenguaje y, por tanto, no tienen subdivisiones. Pueden contener un único valor y es posible usarlos en cualquier tarea en Python.
- __No escalares__: Este tipo de objetos son __divisibles__ porque __tienen una estructura interna__ y, por consiguiente, podemos acceder a sus elementos.

Los objetos escalares y no escalares tienen subdivisiones entre sí y es posible verificar aquellos tipos usando la función `type()`.

Dentro de los __objetos escalares__ es posible encontrar algunos de los siguientes tipos:

- `int`: Son objetos numéricos que representan a __números enteros__.
- `float`: Corresponden a valores de __punto flotante__, los cuales son una aproximación científica a los __números reales__. Son todos aquellos con un `.` entre los dígitos.
- `bool`: Representan los __valores booleanos__ `True` y `False`.
- `NoneType`: Son objetos escalares cuyo valor es `None`, que expresan la __ausencia de un tipo__ de escalar.

Cada objeto escalar tiene una función para convertir el valor de un tipo a otro. Por ejemplo, pasar el número `3` de tipo `int` a `3.0`, que es de tipo `float`.

```
>>> type(3)
<class 'int'>
>>> float(3)
3.0
>>> type(float(3))
<class 'float'>
```

## 5.2 Expresiones y Operadores en Python.

Anteriormente estudiamos que las expresiones son una combinación compleja de constructos primitivos. En Python se crean a partir de __operadores__ y __objetos__, las que regresan un valor de un tipo determinado.

Sean `i` y `j` dos objetos escalares numéricos. Si son de tipo `int` y/o `float`, podemos realizar las siguientes __operaciones__:

- __Adición__ $\rightarrow$ `i + j`.
- __Sustracción__ $\rightarrow$ `i - j`.
- __Producto__ $\rightarrow$ `i * j`.

En estas tres operaciones, si los dos objetos son `int`, el resultado es `int`. Si al menos uno de ellos es `float`, regresa un valor de tipo `float`.

También podemos dividir:

- __División__ $\rightarrow$ `i/j`.

En esta operación, __el resultado siempre será un objeto de tipo__ `float`.

```
>>> 2/1
2.0
>>> type(2/1)
<class 'float'>
```

Otras operaciones que podemos hacer con `i` y `j` son:

- __Resto de la división__ $\rightarrow$ `i % j`.
- __Potencia__ $\rightarrow$ `i ** j` (`i` elevado a `j`).

Las operaciones aritméticas en Python siguen las __reglas de precedencia__ que se usa en matemática.


## 5.3 Variables.

Al programar, muchas veces vamos a querer guardar un resultado en una especie de contenedor informático para acceder a él posteriormente. Éstos reciben el nombre de __Variable__ y es un __nombre simbólico asignado a un objeto__, el cual se almacena en la memoria de un computador.

Por ejemplo, digamos que calculamos el siguiente promedio:

```
>>> (3+2+5)/3
3.3333333333333335
```

Para acceder a él podemos copiar, pegarlo en la consola o adentro de la función `print()` y ejecutarlo las veces que queramos. Pero si estamos creando un programa más complejo, escribir aquella línea de código probablemente lo hará más ilegible o, si otra persona lo lee, no siempre sabrá qué es. En ese caso, lo mejor sería __vincularlo__ (_binding_) a una variable.

Llamemos a la variable `promedio_1` y, para vincularlo a ese valor, usamos el __operador de asignación__ `=`.

```
>>> promedio_1 = (3+2+5)/3
```

Como vemos, con el operador de asignación vinculamos el nombre de la variable `promedio_1` al valor de la expresión `(3+2+5)/3` y siempre deben ser escritos de izquierda (nombre) a derecha (objeto).

Para acceder a la variable, solo tenemos que escribir su nombre.

```
>>> promedio_1
3.3333333333333335
```

Una __buena práctica__ al trabajar con variables, es que su __nombre siempre debe representar lo que se está vinculando__. Fácilmente podríamos haber escrito `a = (3+2+5)/3`, pero es posible que, con el pasar del tiempo, no recordemos qué es lo que calculamos en `a`.

También es posible __asignar variables usando otras__, como lo vemos a continuación:

```
>>> suma_2 = 1+15+7
>>> valor_n = 3
>>> promedio_2 = suma_2/valor_n
>>> promedio_2
7.666666666666667
```
Otra tarea que podemos hacer con variables, es cambiar el valor vinculado a ella. Por ejemplo:

```
>>> promedio_1
3.3333333333333335
>>> promedio_1 = promedio_2 + 1
>>> promedio_1
8.666666666666668
```

Este cambio ocurre para siempre. Es decir, no podemos volver al objeto anterior vinculado a `promedio_1` salvo que lo reasignemos a su expresión original.



