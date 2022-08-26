#===================================================
#     Aproximación a la raíz cúbica de un número
#        mediante el método de bisección.
#===================================================

while True:
  x = int(input("Ingresa un número: "))

  if x < 0:
    exit("Número ingresado debe ser mayor a cero.")

  epsilon = float(input("Nivel de precisión: "))

  if epsilon <= 0:
    exit("\nError: Nivel de precisión debe ser mayor a cero.")
  
  cota_sup = max(1.0, x)
  cota_inf = 0.0
  
  solucion = (cota_sup + cota_inf)/2.0
  num_intentos = 0
  
  while abs(solucion**3 - x) >= epsilon:
    num_intentos += 1
  
    if solucion**3 < x:
      cota_inf = solucion
    else:
      cota_sup = solucion
  
    solucion = (cota_sup + cota_inf)/2.0
  
  print("\nCantidad de intentos:", num_intentos)
  print("La raíz cúbica de", x, "se aproxima a", solucion, "\n")
