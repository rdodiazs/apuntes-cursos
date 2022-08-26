#===================================================
#     Aproximación a la raíz cúbica de un número
#    mediante el método de enumeración exhaustiva.
#===================================================

while True:
  x = int(input("Ingrese un número: "))
  epsilon = float(input("Nivel de precisión: "))

  if epsilon <= 0:
    exit("\nError: Nivel de precisión debe ser mayor a cero.")

  incremento = epsilon**2
  num_intentos = 0
  solucion = 0.0
  
  while abs(solucion**3 - x) >= epsilon and solucion <= x:
    # Es lo mismo que `solucion = solucion + incremento`
    solucion += incremento
    num_intentos += 1
  
  print("\nCantidad de intentos: " + str(num_intentos))
  
  if abs(solucion**3 - x) >= epsilon:
    print("No se pudo encontrar la raíz cúbica de", x, "\n")
  else:
    print("La raíz cúbica de", x, "se aproxima a", solucion,"\n")
