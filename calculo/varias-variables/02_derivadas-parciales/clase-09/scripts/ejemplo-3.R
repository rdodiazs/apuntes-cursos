#=============================================
#
#  Prueba de las segundas derivadas parciales
#               del Ejemplo 3.
#
#=============================================

# Segundas derivadas parciales de f ------
f_xx <- function(x, y) (-20*x*y)*(3 - (2*(x^2)))*exp(-((x^2) + (y^2)))
f_yy <- function(x, y) (-20*x*y)*(3 - (2*(y^2)))*exp(-((x^2) + (y^2)))
f_xy <- function(x, y) 10*(1 - (2*(x^2)))*(1 - (2*(y^2)))*exp(-((x^2) + (y^2)))

# Determinante de la matriz hessiana -----
det_H <- function(x, y) {
  mat_H <- matrix(
    data = c(f_xx(x, y), f_xy(x, y), f_xy(x, y), f_yy(x, y)),
    nrow = 2, ncol = 2
  )

  return(det(mat_H))
}

# Tabla resumen expresada como data.frame
x <- c(0, 1/sqrt(2), -1/sqrt(2), 1/sqrt(2), -1/sqrt(2))
y <- c(0, 1/sqrt(2), 1/sqrt(2), -1/sqrt(2), -1/sqrt(2))

fxx <- f_xx(x, y)

detH <- numeric(length = length(x))
for(i in 1:length(x)) {
  detH[i] <- det_H(x[i], y[i])
}

print(data.frame(x, y, fxx, detH))

rm(f_xx, f_yy, f_xy, det_H, x, y, fxx, detH, i)

