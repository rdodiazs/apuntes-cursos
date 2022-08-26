#!/usr/bin/env python3

tabla = int(input("¿Qué tabla buscas calcular?\nIngresa el número: "))

print("\nTabla del", tabla, "\n------------")

for contador in range(1, 13):
  producto = tabla*contador
  print(tabla, "x", contador, "=", producto)
