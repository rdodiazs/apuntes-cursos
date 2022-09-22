"""
  Script para crear el gráfico de puntos del problema (paradoja)
                  del cumpleaños.
"""


from matplotlib import pyplot as plt
from math import perm


def naive_prob(event, omega):
  """
  Función para calcular la probabilidad de un evento
  usando la definición ingenua.
  """
  if event > omega:
    return 0

  return event/omega


n = 365   # Días de un año.
size = 80 # Cantidad máxima de personas en la sala.


"""
Calculo la `P(A)` para cada cantidad `r` de personas y los almaceno
en listas.
"""
prob_A, r = [], []

for i in range(1, size + 1):
  r.append(i)
  prob_Ac = naive_prob(perm(n, i), n**(i)) # P(A^{c})
  prob_A.append(1 - prob_Ac)               # P(A)



"""
Diseño del gráfico.
"""
fig, axes = plt.subplots(figsize = (7, 4))

def plot_points(*args, **kargs):
  """
  Función de atajo para graficar los puntos.
  Sobre parametros 'keywords' o 'positional' ('non-keyword') de una
  función, revisar la sección 'parameter' en:
     https://docs.python.org/3/glossary.html
  """
  axes.plot(*args, marker = "o", markersize = 4.5, linewidth = 0, **kargs)

axes.axhline(y = 0.5, color = 'lightgray', linestyle = "--")
plot_points(r, prob_A)

for i in [22, 76]:
  text = f"({r[i]}, {round(prob_A[i], 4)})" # Probando los f-strings.
  plot_points(r[i], prob_A[i], color = "red")
  axes.text(r[i] - 1.5, prob_A[i] - 0.07, text, fontsize = 13)

axes.set(xlabel = "$r$", ylabel = "$P(A)$", yticks = [0.0, 0.5, 1.0])

#plt.show()
#plt.savefig("problema-cumple.jpg", dpi=200)
