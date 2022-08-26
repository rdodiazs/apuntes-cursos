#!/usr/bin/env python3
numero = int(input("Ingresa un número: "))

if numero > 0:
  if (numero % 2) == 0:
    print("Tu número es positivo y par")
  else:
    print("Tu número es positivo e impar")
elif numero < 0:
  if (numero % 2) == 0:
    print("Tu número es negativo y par")
  else:
    print("Tu número es negativo e impar")
else:
  print("Tu número es cero")

print("Gracias (:")
