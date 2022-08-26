#!/usr/bin/env python3

tabla = int(input("¿Qué tabla buscas calcular?\nIngresa el número: "))
contador = 1

print("\nTabla del", tabla, "\n------------")

while contador <= 12:
  producto = tabla*contador
  print(tabla, "x", contador, "=", producto)
  contador += 1 # Es lo mismo a `contador = contador + 1`

print("\n¡Gracias!")
