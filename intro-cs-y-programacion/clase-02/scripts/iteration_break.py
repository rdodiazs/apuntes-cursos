#!/usr/bin/env python3

contador = 100

while contador >= 0:
  print(contador)
  contador -= 1
  if contador % 6 == 0:
    print("¡Detente! --> " + str(contador) + " es múltiplo de 6.")
    break
