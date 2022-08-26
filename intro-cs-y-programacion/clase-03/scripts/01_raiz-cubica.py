#======================================================
#   Cálculo de la raíz cúbica perfecta de un número
#     usando el método de enumeración exhaustiva.
#======================================================

while True:
  x = int(input("Ingresa un número entero: "))
  soluciones = range(0, abs(x) + 1)

  for solucion in soluciones:
    if solucion**3 == abs(x):
      break

  if solucion**3 != abs(x):
    print("El número", x, "no tiene una raíz cúbica perfecta.")
  else:
    if x < 0:
      solucion = -solucion

    print("La raíz cúbica perfecta de", x, "es:", solucion)

  input("Presiona ENTER para seguir o CTRL-c para terminar...")

